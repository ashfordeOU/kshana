<!-- Fragment of docs/LUNAR-REFERENCE-STATION.md (workstream D). Included by the main document. -->

## Station time laboratory: a miniRAFS holding LTC

> **MODELLED.** Under the stated assumptions the model gives the figures below. They are not a
> statement about any real station clock or any real system, and Kshana is not affiliated with
> or endorsed by any agency.

**Question.** If the station clock is steered to Coordinated Lunar Time (LTC) and then
free-runs, or is re-steered every N seconds, how does its time error against LTC grow, and how
long does it stay within 1, 10 and 100 ns?

**Source statement (not a claim).** The ICG WG-B Lunar PNT material of June 2024 (unoosa.org,
`LunarPNT_Jun24_01_04.pdf`, source S3) describes a lunar time reference laboratory at the
station with a nanosecond-level time target. Kshana quotes that target for context only. It does
not adopt it, and nothing here shows that any clock meets it.

### Run

```sh
kshana scenarios/lunar-station-time-lab.toml
```

The time lab is the optional `[time_lab]` block of the existing `lunar-time-budget` kind
(`src/lunar_time_lab.rs`). It is not a new kind. Without the block, the `lunar-time-budget`
report, its long-form table and its summary are byte-for-byte what they were before (pinned by
`tests/lunar_station_time_lab.rs::the_block_is_additive`).

### Model

The time error after the last steer, `x(t)`, is the root-sum-square of four terms. Each term is
a function of the time since that steer (`t` when free-running, `t mod N` when steered):

| Term | What it is | Provenance |
|---|---|---|
| `clock` | the clock's power-law time error `sigma_y(tau) * tau`, the same curve the budget uses; a named class (default `mini-rafs`) or a device card fitted to stated stability points | named classes calibrated to their published one-day rows (`clock_specs`) |
| `steer-residual` | the constant offset left by each steer, default 0.5 ns | **ILLUSTRATIVE**, no public figure |
| `ltc-realisation` | the constant LTC realisation residual after the relativistic rate model, default 0.05 ns | budget allocation; the LTC rate itself is not re-derived and keeps its own VALIDATED row ("Lunar coordinate time") |
| `station-height` | zero by default (the station height is modelled exactly). With `station_height_sigma_m` set, the height error biases the gravitational rate by the per-metre topographic redshift (`topographic_spread_ns_per_day / LUNAR_TOPO_ELEVATION_SPAN_M`, about 1.6e-3 ns/day per metre), applied linearly | first-order `g dh / c^2`, MODELLED |

No lunar thermal model is included, because none is sourced.

### Outputs (all with units in the report's `units` block)

| Field | Unit | Meaning |
|---|---|---|
| `time_lab.t_s[]` | s | run time since the initial steer (the scenario's averaging-time grid) |
| `time_lab.terms[].x_ns[]` | ns | each term's time error at each run time |
| `time_lab.x_total_ns[]` | ns | root-sum-square total: the x(t) curve |
| `time_lab.time_to_threshold[]` | s | the time after a steer to each threshold by bisection, the closed-form inverse for the dominant noise type and their relative difference; `status` is `reached`, `held-by-steering`, `not-reached-within-horizon` or `floor-at-or-above-threshold` |
| `time_lab.horizons[]` | s, ns | the total and the dominant term at 1 h, 1 d, 7 d and 30 d |

### Time to threshold (free-running, default inputs, 1 s to 1e7 s grid)

MODELLED; steer residual 0.5 ns (ILLUSTRATIVE), realisation residual 0.05 ns, height modelled
exactly.

| Clock class | to 1 ns | to 10 ns | to 100 ns | dominant at 1 h / 1 d / 7 d / 30 d |
|---|---|---|---|---|
| miniRAFS (`mini-rafs`) | 2.82 s | 377 s | 3.78e4 s (10.5 h) | clock / clock / clock / clock |
| RAFS (`rafs`) | 7.47e3 s (2.1 h) | 9.97e5 s (11.5 d) | not within 1e7 s | clock / clock / clock / clock |
| passive H-maser (`passive-h-maser`) | 7.51e4 s (20.9 h) | 8.67e5 s (10.0 d) | 8.68e6 s (100.5 d) | steer-residual / clock / clock / clock |
| optical master (`optical-master`) | 8.30e6 s (96.1 d) | not within 1e7 s | not within 1e7 s | steer-residual at every horizon |

For the miniRAFS, the total at 1 h, 1 d, 7 d and 30 d is 30.9, 151.2, 400.1 and 828.4 ns. With
`steer_interval_s = 3600`, the miniRAFS still reaches 1 ns at 2.82 s and 10 ns at 377 s, but it
never reaches 100 ns, because its error just before each hourly steer is 30.9 ns
(`held-by-steering`).

Every bisected value agrees with the closed form to better than 1e-9 relative
(`closed_form_rel_diff`).

### What the checks can and cannot tell

- With steering off, the clock term equals the budget's own clock term to the bit, for all four
  classes (`lunar_time_lab::tests::free_run_clock_term_is_the_budget_clock_term`).
- The bisection agrees with the closed-form inverse of the dominant noise type, for both noise
  classes. This is internal consistency, not an external oracle.
- From 1 s to 7e5 s the clock error is ordered optical < PHM < RAFS < miniRAFS. **It is not
  ordered at every t.** The PHM is modelled as a pure flicker-FM floor (x grows as t) and the RAFS
  as pure white FM (x grows as the square root of t), so the PHM curve overtakes the RAFS curve
  between 7e5 and 8e5 s (about 8.7 days). This is a property of the single-noise-type clock
  models, and the test pins it rather than narrowing the span to hide it.
- None of this checks a real clock, a real steer, or the LTC realisation of any service. The
  ledger row "Lunar station time laboratory: miniRAFS holdover against LTC" is **MODELLED**
  (internal consistency).
