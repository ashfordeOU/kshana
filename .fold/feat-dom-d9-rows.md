# D9, measured clock library ("Clock Atlas"): proposed matrix rows and records

Branch `feat/dom-d9`. Engine commits a12d5d5f (library) and 52a931b2 (multi-record cards); the
pre-registration of every comparison below is commit **2ec76864**, pushed 2026-10-02 16:07 UTC
before any fixture was fetched or any oracle was run. `src/verification.rs` is not edited on
this branch; the integrator pastes the text below.

Checked on a scratch copy (not committed): with rows 1 and 2 and the basis entry pasted into
`src/verification.rs`, `cargo test --lib verification` passes every matrix invariant except
`readme_headline_counts_match_the_matrix` (the generated README counts must be regenerated:
226 rows / 110 validated -> 228 / 111), and `verification_rows_name_a_test_that_exists`,
`verification_rows_cite_evidence_that_exists` and `verification_rows_declare_an_oracle_basis`
pass.

Summary:

| Row | Outcome | Status to set |
|---|---|---|
| NEW "Lag-1 autocorrelation power-law noise identification" | PROMOTE | VALIDATED (Library) |
| NEW (b) "Measured device cards with held-out prediction" | FINDING (GPS IIF), BLOCKED (TCXO, Galileo maser, Deep Space Atomic Clock) | MODELLED |
| (a) M010, spoofing-detection row | round 3 BLOCKED; rounds 4 and 4b FINDING (0 false alarms, 6 of 10 onsets) | stays MODELLED |
| NEW "GPS Block IIF cards with per-revolution terms" (round 2) | FINDING (9 of 11) | MODELLED |
| M002 "Onboard clock state estimation" round 3 (round 2) | FINDING ((a), (c) all 11; (b) fails on 2) | stays MODELLED |
| M083 round 3 (round 2) | pre-registered, prospective, awaiting Circular T 465 | unchanged |
| M001 | not acted on: no clock class promoted, so nothing to re-anchor on | unchanged |
| M073 | deferred to the D3 archive | unchanged |

---

## 1. NEW row: lag-1 autocorrelation noise identification (PROMOTE)

Insert after the row "Frequency stability characterisation" (or anywhere in the externally
validated block):

```rust
        VerificationItem {
            requirement: "Power-law noise identification by lag-1 autocorrelation",
            capability: "allan::lag1_noise_id: the Riley and Greenhall (2004) lag-1 autocorrelation noise identifier (decimated phase with its quadratic removed, or group-averaged frequency with its line removed; repeated first differences until delta = r1/(1+r1) < 0.25 or d = dmax), returning the integer and unrounded power-law exponent alpha (+2 white PM to -2 random-walk FM) at any averaging factor; it sets the noise-type degrees of freedom of the measured clock library's device cards",
            module: "allan (lag1_noise_id, lag1_acf)",
            tests: "tests/clock_library_lag1_noise_id_allantools.rs (140 cases: ten Kasdin power-law records, b = 0 to -4, as phase and frequency data, af = 1 to 64; alpha_int and d identical, worst |d alpha| 9.6e-13 and |d rho| 4.8e-13 against 1e-9; pre-registered 2ec76864); allan::tests (lag1_identifies_white_pm_white_fm_and_random_walk_fm; lag1_is_blind_to_a_quadratic_phase_trend)",
            oracle: "allantools 2024.6 autocorr_noise_id (A. Wallin and contributors, LGPL-3.0-or-later, run as a separate program by the fixture generator): an independent implementation of the published Riley-Greenhall algorithm, a uniquely defined quantity under the stated conventions. Validates the identifier, not the noise content of any real clock",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
```

`validated_oracle_basis()` entry:

```rust
        OracleBasisEntry {
            requirement: "Power-law noise identification by lag-1 autocorrelation",
            basis: Library,
            oracle_test: "tests/clock_library_lag1_noise_id_allantools.rs",
            source: "allantools 2024.6",
            flag: "",
        },
```

Record:
- Pre-registration: 2ec76864 (header of `tests/clock_library_lag1_noise_id_allantools.rs`).
- Quantity: alpha_int, alpha, d, rho per (record, data type, averaging factor).
- Oracle: allantools 2024.6 (PyPI `allantools==2024.6`, numpy 2.4.6), LGPL-3.0-or-later, separate
  program. Algorithm conventions checked against its source before the pre-registration (reading
  the definition, not running it).
- Tolerance and source: integers identical; |d alpha| and |d rho| <= 1e-9 absolute (two
  double-precision evaluations differing only in the detrend's least-squares solver).
- Result: AGREES. 140 of 140; worst |d alpha| 9.6e-13, worst |d rho| 4.8e-13.
- Mutation: `rho = r1 / (1.0 - r1)` in `allan::lag1_noise_id` turns the test red; reverted.
- Disclosure: the first attempt stopped in the harness before any comparison (numpy 2 wrote
  `np.float64(...)`); the generator now writes `float(v)`, the same seeds regenerate the same
  records and `oracle.txt` was byte-identical (SHA-256 d90516df...). The comparison then ran once.
- Inputs are synthetic; no third-party data is vendored.

## 2. NEW row (b): measured device cards with held-out prediction (FINDING, MODELLED)

```rust
        VerificationItem {
            requirement: "Measured clock device cards (held-out prediction)",
            capability: "clock_library: a device card (white phase, white, flicker and random-walk FM plus a linear frequency drift) fitted to one third of a named measured clock record after a logged conditioning pass (gaps, phase outliers, phase steps, bursts removed; frequency steps logged), weighted by the lag-1-identified noise-type degrees of freedom, and its predicted Allan deviation scored on the held-out two thirds; readers for RINEX and IGS clock files, BIPM per-laboratory files and Circular T Section 1; conversion of a card to the slot-timing noise model, the extended Kalman clock model and the spoofing monitor's noise levels",
            module: "clock_library (card, condition, series), realdata::clk, allan (lag1_noise_id)",
            tests: "tests/clock_library_device_cards_oracle.rs (gps_iif_cards_reproduce_the_recorded_finding; receiver_training_is_blocked_by_the_epoch_minimum; non_blind_cards_are_reported; pre-registered 2ec76864); clock_library::card::tests; clock_library::condition::tests; clock_library::series::tests; realdata::clk::tests",
            oracle: "Measured records, held out: IGS final combined 30 s clocks of the 11 GPS Block IIF satellites over 2026-03-01 to 14 (a window no test had opened; IGS, open with attribution) and the JammerTest 2024 u-blox ZED-F9P receiver in its non-scored stationary sessions (GPL-3.0-or-later). 0.31 external comparison (pre-registered 2ec76864, every card's predicted / measured Allan deviation within [1/1.5, 1.5] at its fitted averaging times), a finding (stays MODELLED): 10 of 11 GPS IIF cards are within the bar; G27 is optimistic at the two-hour scale (0.662 at 7680 s, worst factor 1.510), the periodic hour-scale error a power-law card does not carry. The receiver TCXO card is blocked: outside the logged transmissions the dataset's other sessions leave 167 epochs against the 3600 required. Reported, not blind (records opened by earlier rows): the 5071A caesium card is within the bar (worst 1.070 up to 4096 s), the OCXO card is conservative and outside it (2.348 at 128 s; its noise floor changes during the record), and the Norcia strontium card fitted on the three shortest published points is within it at the two scored points (1.291, 1.405). Galileo passive hydrogen masers (no login-free source of final Galileo clocks reachable) and the Deep Space Atomic Clock (one open in-space value) are blocked",
            oracle_kind: ExternalDataset,
            status: Modelled,
        },
```

Record:
- Pre-registration: 2ec76864. Engine fixed at 52a931b2 (method, detector, score).
- Oracle: the held-out two thirds of each measured record (Measured).
- Tolerance and source: predicted / measured in [1/1.5, 1.5] at every fitted averaging time (edf
  >= 30), the factor of the existing caesium holdover row, unchanged. Outcome rule fixed in
  advance: promote per BLIND class whose every card passes; not-blind classes never promote.
- Results (first and only run):
  - GPS Block IIF (blind): worst factors G03 1.110, G06 1.164, G08 1.339, G09 1.127, G10 1.065,
    G24 1.367, G25 1.144, G26 1.121, **G27 1.510 (fail)**, G30 1.312, G32 1.149. Class: FINDING.
    Conditioning log: no gaps; 15 to 40 phase steps per fit third, 29 to 78 per held-out part;
    0 to 1 phase outliers; no bursts or frequency steps.
  - Receiver TCXO (blind): BLOCKED. Candidate sessions 1.6.4 (2024-09-09, 1039 epochs, 0 kept),
    3.1.1/3.1.2 (734, 166 kept), 3.2.7 (395, 198 kept), 3.2.8 (182, 0 kept); after the
    receiver-clock extraction, 167 epochs in 2 records.
  - Not blind, reported: caesium 1.070 (pass), OCXO 2.348 (fail, conservative), strontium 1.405
    (pass at 7.36 s and 14.72 s; the three longer points have edf < 30 and are reported only).
  - Galileo maser and Deep Space Atomic Clock: BLOCKED (see founder items).
- Mutation: `0.125 * self.h_0 / tau` in `DeviceCard::noise_allan_variance` grows the failing GPS
  set from {G27} to {G08, G09, G10, G26, G27, G32}; the strict test was already red. Reverted.
- Disclosures: the caesium, OCXO and strontium records were opened by earlier rows and the
  strontium values were read while writing the header, hence "not blind". The GPS IIF strict
  test remains `#[ignore]` with the measured gap; `gps_iif_cards_reproduce_the_recorded_finding`
  pins all eleven worst factors.
- Fixture note for the integrator: `tests/fixtures/clock_library_device_cards_oracle/igs_iif_30s.txt`
  is 5.3 MB (11 PRNs x 40 320 epochs, delta-encoded). If that is too large to vendor, the
  generator can write it under `$KSHANA_ORACLES` and the test can become data-gated.

## 3. M010 (spoofing-detection row): BLOCKED

Append to the oracle text of the row whose capability is "Clock-aided χ², RAIM, AGC, SQM fused
per-epoch security FoM":

> 0.31 round 3, the round-2 monitors and bars with the clock monitor's noise levels from a
> receiver-TCXO device card fitted on the dataset's other stationary sessions (pre-registered
> 2ec76864), blocked (stays MODELLED): outside the logged transmissions those sessions leave 167
> receiver-clock epochs against the 3600 required, so no card was fitted and nothing was scored

and append to its `tests` field:
`tests/clock_library_tcxo_card_jammertest_oracle.rs::round_3_is_blocked_by_the_training_minimum (round 3, blocked)`.

Record: pre-registration 2ec76864; oracle the official JammerTest 2024 log onsets (unchanged);
tolerance unchanged (detection within 10 s, zero pre-onset alarms, at least 8 evaluable);
result BLOCKED; no mutation (nothing scored).

## 3a. Round 2 (owner instruction: "finish everything"; pre-registration fb475550)

The owner asked, after round 1, for the dominant options to be carried out. Round 2 was
pre-registered in one commit, **fb475550** (pushed 2026-10-02 17:47 UTC, engine 2e0a2bc1),
before any of its data was fetched.

### NEW row: GPS Block IIF device cards with per-revolution terms (FINDING, MODELLED)

```rust
        VerificationItem {
            requirement: "Measured GPS Block IIF clock cards with per-revolution terms (held-out prediction)",
            capability: "clock_library::DeviceCard::fit_phase_periodic: a device card that carries the once- to four-per-revolution phase terms (period T/k, T = 43 082.05 s), fitted jointly with the quadratic by least squares on one third of a measured satellite clock record, with each term's closed-form Allan contribution 4 A^2 sin^4(pi tau / P) / tau^2 in the predicted Allan deviation",
            module: "clock_library (card)",
            tests: "tests/clock_library_periodic_cards_oracle.rs (periodic_cards_reproduce_the_recorded_finding; pre-registered fb475550); clock_library::card::tests (a_periodic_card_carries_the_sinusoid_a_power_law_card_cannot)",
            oracle: "Measured records, held out: IGS final combined 30 s clocks of the 11 GPS Block IIF satellites over 2026-04-01 to 14 (a window no test had opened; IGS, open with attribution). 0.31 external comparison (pre-registered fb475550, predicted / measured Allan deviation within [1/1.5, 1.5] at every fitted averaging time on every satellite), a finding (stays MODELLED): 9 of 11 cards are within the bar; G03 (1.947) and G25 (1.581) are optimistic between 60 s and 2000 s because their held-out records are noisier than their fit thirds (G25's held-out part carries 16 gaps and 29 phase outliers), a change of the clock rather than a missing periodic term. Dropping the periodic terms from the prediction fails all 11 cards (1.77 to 4.96), so the terms carry the prediction",
            oracle_kind: ExternalDataset,
            status: Modelled,
        },
```

Record: pre-registration fb475550; oracle the held-out two thirds (Measured); bar [1/1.5, 1.5],
all cards; result 9 of 11 (G06 1.100, G08 1.145, G09 1.053, G10 1.062, G24 1.153, G26 1.336, G27
1.117, G30 1.415, G32 1.083; fail G03 1.947, G25 1.581); power-law control fails on the same
two; mutation `0.0 * a * a` fails all 11; first and only run.

### M083 round 3 (prospective): PRE-REGISTERED, awaiting data

`tests/utck_bound_prospective_oracle.rs`, pre-registered fb475550 before Circular T 465 was
published. Prior laboratories (SHA-256 of the acronym, first byte even) over 2015-2022; test
laboratories (odd) on Circular T issues from 465 until 1000 values accumulate; a laboratory
without history counts as exceeding; bar pooled exceedance <= 1e-2, unchanged. Append to the
row's oracle text: "0.31 round 3, a pooled hierarchical ageing bound, pre-registered fb475550 and
scored prospectively on Circular T issues from 465; not yet run (awaiting issues)" and to its
tests field `tests/utck_bound_prospective_oracle.rs (round 3, prospective, not yet run)`.

### Device-card class C8: u-blox ZED-F9P receiver TCXO (model class) — FINDING

Append to the oracle text of row (b): "0.31 round 2, the ZED-F9P receiver TCXO as a model class
on 14 days of 12 static Wroclaw stations (Zenodo 6488497, CC BY 4.0; pre-registered fb475550), a
finding: with the registered pipeline 11 of 12 stations were not evaluable (RAIM rejected most
ionosphere-free epochs) and BX14 failed; a disclosed re-run with a corrected pipeline
(pre-registered c9cc0d49) passes 1 of 11 blind stations (BX12, 1.412; BX07 1.532 and BX13 1.542
just outside), because single-point receiver clocks from intermittent 30 s files are not a clean
oscillator record" and to its tests field `tests/clock_library_f9p_cards_oracle.rs
(f9p_first_pipeline_reproduces_the_recorded_finding; f9p_corrected_pipeline_reproduces_the_recorded_finding; data-gated)`.

### M002 round 3 — FINDING (closer than round 2)

Append to the oracle text of "Onboard clock state estimation": "0.31 round 3, the round-2
extended filter, tuning and criteria unchanged after the frozen conditioning detector, on fresh
IGS clocks of 2026-04-01 to 14 (pre-registered fb475550), a finding (stays MODELLED): (a)
one-step 0.941 to 0.968 and (c) triple-NIS mean 2.641 to 3.549 hold on all 11 satellites; (b)
one hour fails on G09 (0.894) and G26 (0.876) against 0.90" and to its tests field
`tests/clock_state_ext_igs_conditioned_oracle.rs::conditioned_extended_filter_finding`.
Disclosed: tuning ran on scipy 1.17.1 and numpy 2.4.6 (round 2: 1.18.1, 2.3.5), same algorithm
and options.

### M010 rounds 4 and 4b — FINDING (closer than round 2)

Replace the round-3 note of section 3 with: "0.31 round 3 (receiver card from the JammerTest
unit's other sessions, pre-registered 2ec76864) blocked: 167 training epochs against 3600. Round
4 (noise levels from the ZED-F9P model class, Wroclaw 2021, pre-registered fb475550) and round 4b
(a disclosed re-run with the corrected extraction, c9cc0d49), a finding (stays MODELLED): zero
pre-onset false alarms at all 10 logged onsets (round 2: 86) and 6 of 10 within 10 s (round 2:
4); 2.1.1, 2.3.5, 2.3.10 and 2.6.1 stay late (+211, +23, +18, +51 s), unchanged by the clock
noise level", and add to the tests field
`tests/clock_library_tcxo_card_jammertest_oracle.rs (round_4_reproduces_the_recorded_finding; round_4b_reproduces_the_recorded_finding; data-gated)`.
What it means: the TCXO card removes M010's false alarms, as the roadmap expected; the four late
onsets are a detection-latency problem the clock monitor alone does not solve.

## 4. Founder decisions: written proposals, nothing run

### M001, "GNSS-denied clock holdover" (re-anchoring with a fit/test split)
Status after round 2: still not acted on. Re-anchoring needs a validated class to anchor on; no
device-card class promoted (GPS IIF 10/11 and 9/11, ZED-F9P 1/11), so changing the published
holdover figures now would anchor them on unvalidated cards.
Proposal: replace the synthesised per-class red-noise floors (`ClockClass`, `QuantumClockClass`)
behind every holdover row with device cards fitted on measured records, each with a
pre-registered fit/test split as in row (b): caesium (5071A), GPS IIF (the D9 window passes 10 of
11), strontium (Norcia), and a crystal card once a stationary record exists. Consequence: every
published holdover figure and golden that reads a class floor changes, and each change must be
listed old -> new in the CHANGELOG. Needed: a decision that holdover figures may move, and which
class each scenario maps to. D9 changed no published number.

### M002, "Onboard clock state estimation" (more than three states)
The conditioning detector is frozen at 52a931b2 (`clock_library::condition`) and pre-registered
in 2ec76864; it is a whole-record design with no notion of file or day boundaries (the
day-boundary repair tried after the round-2 result is not reused). Proposal for round 3: on a new
unopened IGS window (for example 2026-04-01 to 14), condition every record with the frozen
detector BEFORE the first-half tuning, then run `ClockStateExt` with the round-2 model, tuning
rule and criteria (a), (b), (c) unchanged. Evidence that motivates it, not a result: on the D9
window the detector removed 15 to 78 phase steps per GPS IIF record segment. Needs founder
approval to open a window and re-run M002.

### M083, "Heterogeneous UTC(k) traceability-bias integrity overbound"
Engine ready: `utck_bound` (pooled, hierarchical ageing bound: log mean-square increments pooled
across laboratories per lag, prior at an upper quantile, precision-weighted shrinkage, bound
`|x_last| + z s~`) and `realdata::clk::parse_circular_t_section1`. Proposal: prior fitted on a
laboratory subset chosen by a rule fixed in advance (for example SHA-256 of the acronym, first
byte even) over 2015-2022; scored PROSPECTIVELY on the other laboratories in Circular T issues
published after the pre-registration push (from issue 465), each laboratory's history up to the
month before the issue; a row with no bound counts as an exceedance; bar pooled exceedance <= 1e-2
at the 1e-2 allocation, unchanged. Constants z_p and nu0 to be fixed in that pre-registration.
Needs D3's prospective issue archive and founder approval.

### Unblocking the blocked cards
- Receiver TCXO and M010 round 3: need at least an hour of quiet-sky record from the same
  ZED-F9P. Options: ask the dataset authors for the non-attack portions of the 2024-09-09/10
  logs; or a new pre-registration admitting the dataset's dynamic sessions if the dataset
  confirms the same receiver unit. Either is a new comparison.
- Galileo passive hydrogen masers: final Galileo clocks need CDDIS (Earthdata login, a
  credential) or another reachable mirror; the GSC constellation page gives the active clock
  per satellite (PHM or RAFS).
- Deep Space Atomic Clock: needs the published figure data of Burt et al. 2021 (Nature source
  data, licence to be checked) with digitisation error in the bar.

## 5. Not done in this session
- M073: deferred to the D3 archive, as the roadmap says.
- `src/clock_state*.rs`, `src/clock_specs.rs`, `src/holdover.rs`, `src/powerlaw.rs` are owned but
  unchanged; the optional extended model (item 4) already exists as `clock_state::ClockModelExt`
  and a card converts to it (`DeviceCard::clock_model_ext`).
