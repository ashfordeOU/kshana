# The mission thread

Advisory software, not certified navigation equipment. Public sources only; not affiliated with or endorsed by any
agency, and nothing here claims conformance with any programme's requirements.

`kind = "mission-thread"` chains phases of a mission, each one of eight registered kinds with its own sensors and
filter, and reports the **navigation and timing error budget** of the whole chain: for every phase the 1-sigma
position, velocity and clock bias at entry, at the peak and at exit; every contribution to it, with its unit; the
margin against a requirement you state; the weakest link; the dated events; and a timeline figure. Every number is
**MODELLED**: a stated input or a model of one. The only external oracle rows are in
[`xval/mission-thread/`](../xval/mission-thread/) and say what they test.

Run the example from a checkout (it reads a committed Moon kernel cut):

```sh
kshana scenarios/mission-thread-artemis-class.toml
```

## The document

```toml
kind = "mission-thread"
title = "..."                       # optional
seed = 20261024                     # each phase's seed comes from it and the phase id
epoch_utc = "2028-01-01T00:00:00Z"  # mission elapsed time counts from here
moon_kernel_path = "..."            # optional JPL SPK cut with the Moon and the Earth (a file: refused by the MCP server)

[entry]                             # the first phase's entry state
frame = "gcrf"; x = [...]           # six numbers, metres and metres per second
sigma_pos_m = 10.0; sigma_vel_mps = 0.01
timescale = "utc"; sigma_time_s = 1e-7; sigma_drift_s_per_s = 1e-12

[[phase]]
id = "ascent"                       # unique; names the phase in the report and seeds its noise
kind = "launch-ascent"
duration_s = 540.0
nav = ["gnss", "inertial"]          # gnss | gnss-ssv | ground-tracking | lunanet | trn | inertial | relative-optical
time = "gnss"                       # gnss | ground-clock | lunar-time | onboard-holdover
frame = "mci"                       # optional: the frame this phase needs its entry in
timescale = "ltc"                   # optional: the clock timescale it needs
[phase.handover]                    # how this phase hands over to the next (default carry)
rule = "inflate"; q_acc = 1e-9; gap_s = 172800.0
[phase.requirement]                 # optional limits; the margin is the smallest limit over peak
max_pos_m = 50.0
[phase.model]                       # the kind's own parameters
```

**A document is refused, not guessed at,** when a phase id repeats, a `nav` list is empty, a name is unknown, a model
key is not one the kind knows, a length key disagrees with `duration_s`, or a phase lists a source its model does not
give numbers for.

### What a handover does

The state handed on is the full 6x6 covariance of `[x, y, z, vx, vy, vz]` in SI units, the clock (bias, drift and their
covariance, tagged with a timescale), the frame, the mission time and an evidence label. A handover never resets a
covariance.

| Rule | What it does |
|---|---|
| `carry` | hands the state on unchanged |
| `inflate` | white acceleration noise of PSD `q_acc` over `gap_s` on a straight-line model; the row states both |
| `reacquire` | dead reckoning for `acquire_s`, then an axis is set to the source floor only where the floor is smaller; never below the floor, never a reset |

### Frames and timescales

The thread converts at the handover, never inside a phase, and each conversion is its own budget row. Frames: GCRF,
MCI, MCMF (ITRF and LVLH are refused with the reason). `Gcrf <-> Mci` shifts the origin by the Moon's geocentric state:
the DE440-grade state from the kernel where it covers the epoch (stand-in 5 m and 1 mm/s; measured worst 2.6 m against
pinned JPL Horizons), otherwise the analytic series with its measured 195.7 km RMS, which the row states; a lunar example
must therefore carry a kernel covering its epoch. `Mci <-> Mcmf` is the mean sidereal rotation with the axes aligned at the
epoch and no libration. Timescales go through TT: `Utc <-> Tt` exact, `Tdb <-> Tt` adds 14 us, `Tt <-> Ltc` uses the
secular rate of `lunar_time` with its 56 to 59 us/day band as the rate uncertainty.

## The eight phase kinds

| Kind | Segment | What it does | Parameters |
|---|---|---|---|
| `launch-ascent` | Earth | powered ascent to a parking orbit: constant-velocity covariance with white acceleration noise, GNSS acquisition and fade, clock holdover | `[phase.model]` keys in `src/mission_thread/earth/launch.rs` |
| `leo-rendezvous` | Earth | relative navigation over sensor legs: Clohessy-Wiltshire transition in LVLH, 6x6 Kalman covariance, docking window | below |
| `tli-and-cruise` | Earth | TLI burn and cislunar cruise: Cowell propagation, finite-difference state-transition matrix, gnss-ssv and ground-tracking updates | below |
| `entry` | Earth | return coast to the entry interface; flight-path-angle sigma, corridor probability, peak deceleration, footprint | below |
| `lunar-orbit-rendezvous` | lunar | relative navigation to docking in a lunar orbit | [`mission-thread/lunar-phases.md`](mission-thread/lunar-phases.md) |
| `lunar-descent` | lunar | landing-dispersion budget at a polar site | same |
| `lunar-surface` | lunar | surface PNT and timing availability by site and season | same |
| `lunar-ascent` | lunar | powered ascent to an insertion orbit | same |

The lunar kinds are also standalone scenario kinds; the design and the evidence are in
[`MISSION-THREAD-LUNAR.md`](MISSION-THREAD-LUNAR.md).

### `leo-rendezvous`

The budget carries the **relative** sigmas; the chaser's absolute covariance is handed on unchanged and a row says so,
because this phase measures the vehicles against each other, not against the Earth. The starting relative covariance is the
chaser's absolute one plus the target's stated sigmas, added as if independent (conservative). Keys: `target_alt_m`,
`target_abs_sigma_pos_m`, `target_abs_sigma_vel_mps`, `capture_pos_m`, `capture_vel_mps`, optional `process_q_acc` and
`min_window_s`, and one or more `[[phase.model.legs]]` with `range_m`, `end_range_m`, `duration_s`, `sensor`
(`optical-camera`, `lidar` or `rf-ranging`, ILLUSTRATIVE parameters in `src/mission_thread/sensors.rs`) and `interval_s`;
the legs' durations add to the phase's. The docking window is the time from which the relative sigma stays inside the
capture envelope to the end of the phase. Repeats are separate phases with their own ids.

### `tli-and-cruise`

The mean state is the engine's Cowell propagator with Earth gravity and J2 and the Sun and Moon as third bodies. The
covariance goes through each `step_s` segment with a forward-difference state-transition matrix (the nominal run and six
perturbed runs) and a white acceleration noise. The burn is along the entry velocity with a stated size fraction and
pointing error. **Limit named:** the committed Moon kernel cuts hold the Moon but not the Sun, so the propagator takes the
Moon from the kernel and the Sun from the analytic series (the Sun's third-body term is insensitive to that series' error);
the phase says which it used in an event, and where no kernel covers a segment it uses the analytic series for both. The
burn is **not targeted**: the nominal state is wherever the stated burn goes, and the lunar phases take only the covariance.

Updates, used only when the document lists the source: `gnss-ssv` (position fixes with availability and PDOP from the
engine's space-service-volume sweep along an osculating Earth orbit standing in for the arc, one sweep per `ssv_window_s`;
fix sigma = median PDOP times `ssv_uere_m`; the expected-information form keeps the run deterministic) and `ground-tracking`
(range and range rate along the geocentric direction, so the plane of the sky is not observed; the update variance is divided
by the tracking duty). Keys: `tli_dv_mps`, `tli_dv_sigma_fraction`, `tli_pointing_sigma_rad`, `step_s`, `clock_q_f`,
`clock_q_d`, optional `process_q_acc`, `ssv_uere_m`, `ssv_window_s`, `ssv_step_min`, `ssv_cn0_min_dbhz`,
`ground_range_sigma_m`, `ground_range_rate_sigma_mps`, `ground_interval_s`, `ground_duty`.

### `entry`

The coast is the `tli-and-cruise` coast with no burn, ending at the entry interface; its keys are the coast keys above. At the
interface the phase reads the flight-path angle and its sigma from the full covariance, the probability that the angle is inside
a stated corridor, the peak deceleration at the nominal angle and at both corridor edges (the engine's planar ballistic entry
beside the Allen-Eggers closed form) against an optional limit, and the footprint: downrange from a stated sensitivity, crossrange
from the interface covariance across the orbit plane. Keys: `interface_alt_m`, `ballistic_coeff_kg_m2`, `corridor_min_deg`,
`corridor_max_deg`, `downrange_sensitivity_km_per_deg`, `flight_time_s`, optional `max_decel_g`, `scale_height_m` and
`start_state_gcrf` (the nominal return state, six numbers, when the chain has no trans-Earth burn to produce one). Nothing here
models a capsule's lift, guidance or heating.

## The ground-network overlay

An optional `[ground_network]` table gives stations and the lowest tracking elevation; for each phase it names, the thread
computes the fraction of the phase a station can track and passes it to the phase as the duty that scales its ground-tracking
update rate. Geometries: `entry-orbit` (the entry state flown two-body with J2, for low-orbit phases), `moon-direction` (the
vehicle at the Moon's position, for the cislunar cruise) and `stated` (a duty you give). A station change loses
`handover_gap_s`; the phase's budget gets the longest interval with no station in view and an event gives the duty. Nothing
models a network's antennas or schedules.

## The report

`kshana-mission-thread/1`: `phases[]` (index, id, kind, times, label, navigation and time sources, limiting source, entry, peak
and exit sigmas, requirement, margin, `budget_rows[]` with a per-row unit, `events[]`), the `weakest_link` (smallest margin
against a stated requirement, else the largest peak position), the `timeline[]`, the thread `label` (the weakest phase label),
and a `units` block. The figure is the 1-sigma position and clock bias against mission time, one band per phase.

## What the evidence is

The thread's label is the weakest phase label, and every phase is MODELLED. The lunar propagator is compared with LRO and
CAPSTONE ([`xval/mission-thread-lunar/`](../xval/mission-thread-lunar/)); the cislunar arc is compared with a public
Horizons trajectory ([`xval/mission-thread/`](../xval/mission-thread/)). A row passes or misses a bar fixed in a committed file
before the run, and a miss is recorded as a miss. Nothing is VALIDATED unless the ledger says so.
