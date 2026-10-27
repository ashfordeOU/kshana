# The lunar phase kinds: `[phase.model]` reference

Advisory software, not certified navigation equipment. Every number these phases produce is MODELLED: the relay set,
the signal-in-space error, the priors and the terminal sensors are illustrative inputs, not measurements. The design
and the evidence are in [`../MISSION-THREAD-LUNAR.md`](../MISSION-THREAD-LUNAR.md); the pre-registered oracle rows are in
`xval/mission-thread-lunar/`. The examples are named "Artemis-class" and claim no agency endorsement.

## What a phase takes and gives

A phase kind is `lunar-orbit-rendezvous`, `lunar-descent`, `lunar-surface` or `lunar-ascent`. Its `[phase.model]` table
holds the keys below, which are the standalone scenario's own fields (`scenarios/<kind>.toml`).

- **Nothing is required.** Every key has a default. A table may be empty or absent.
- **Duration.** The phase's length is the thread's `duration` for the phase. Each kind also has a length key of its own
  (`arc_s`, `descent_s`, `stay_days`, `ascent_s`). If the model sets it, it must equal the thread's duration (for
  `stay_days`, in days against seconds / 86400); a mismatch is refused with the key named. If the model leaves it out,
  the thread's duration is used.
- **Seed.** The thread's id-keyed phase seed is what a phase uses. `lunar-orbit-rendezvous` and `lunar-descent` accept a
  `seed` key (the standalone scenario's), but inside a thread it is not used; the other two kinds have no seed.
- **Entry.** The previous phase's state is the entry. The wrapper converts it through the thread onto the MCI frame (MCMF
  is native for `lunar-surface`) and an LTC clock; the conversion lines are added to the phase's budget. Frame pairs and
  timescales the thread cannot convert (ITRF, for example) are refused with the thread's message. A core called outside
  a thread refuses a frame or clock it cannot use, with the reason.
- **Exit.** The covariance and clock the phase ends with, in MCI (MCMF for `lunar-surface`), handed to the next phase.
  A phase never resets a covariance. The entry position and velocity vector of the rendezvous is not used: it flies its
  own nominal orbit, and the event list says so.
- **Every table refuses** a key not in its list (a misspelling is an error, not ignored), and a value outside the range
  named below.

## `lunar-orbit-rendezvous`

Relative navigation of a chaser and a target in the same lunar orbit: a batch Gauss-Newton estimate over the arc of both
vehicles' states and persistent signal-in-space biases, from an absolute fix per vehicle (AFS code-tracking bound) and a
crosslink range, under the crate's lunar force model.

| Key | Unit | Default | Meaning |
|---|---|---|---|
| `orbit` | | `llo` | `llo` (100 km circular polar) or `elfo` (100 km by 3000 km polar, periapsis over the south pole) |
| `sma_km`, `eccentricity`, `inc_deg`, `argp_deg` | km, 1, deg, deg | from `orbit` | element overrides |
| `mean_anomaly_deg` | deg | 0 | target mean anomaly at the start |
| `separation_m` | m | 2000 | along-track separation, chaser behind target |
| `arc_s` | s | thread duration | arc length (see Duration) |
| `step_s` | s | 20 | integration and measurement step |
| `n_relays` | | 8 | illustrative relays, 4 to 24 |
| `afs_cn0_dbhz`, `isl_cn0_dbhz` | dB-Hz | 35, 35 | C/N0 of the absolute fixes and of the crosslink range |
| `integration_s` | s | 1 | coherent integration of the code tracker |
| `sis_ure_m` | m | 30 | signal-in-space user range error, 1-sigma (the LNIS nominal) |
| `common_mode_fraction` | 1 | 0.9 | fraction of the signal-in-space variance common to both vehicles, in [0, 1) (ILLUSTRATIVE) |
| `target_pos_sigma_m`, `target_vel_sigma_m_s` | m, m/s | 50, 0.05 | target prior |
| `carried_pos_sigma_m`, `carried_vel_sigma_m_s` | m, m/s | 100, 0.1 | chaser prior, used only standalone (a thread run carries the entry covariance) |
| `filter_model` | | `same` | `same` or `point-mass` (what ignoring the harmonics costs) |
| `n_trials` | | 50 | Monte Carlo trials |
| `seed` | | 20261024 | standalone only |
| `conv_threshold_m` | m | 1 | formal relative 1-sigma at which the estimate counts as converged |
| `gravity_table_path`, `gravity_degree` | path, | none, 150 | a PDS SHADR gravity table (GRAIL GL0660B); absent: built-in J2 and C22. Reads a file: refused on an inline-only surface such as the MCP server |

Also refused: an invalid `orbit` or `filter_model`, `n_relays` outside 4 to 24, a covariance that is not symmetric with a
non-negative diagonal. The report carries `monte_carlo.non_converged_trials`: trials whose Gauss-Newton iteration stopped
without a further cost decrease.

## `lunar-descent`

The landing-dispersion budget at a polar site: a per-axis five-state inertial error model (position, velocity,
accelerometer bias, tilt, gyro bias) aided by AFS fixes, a terrain-relative fix and lunar time, with a Monte Carlo
touchdown ellipse.

| Key | Unit | Default | Meaning |
|---|---|---|---|
| `site_lat_deg`, `site_lon_deg` | deg | -89.5, 0 | site |
| `more_site_lats_deg` | deg | none | further latitudes tabulated beside the headline site |
| `descent_s` | s | thread duration | powered descent length (see Duration) |
| `specific_force_m_s2` | m/s² | 3 | couples tilt into horizontal acceleration |
| `horizontal_speed_m_s` | m/s | 150 | at the start, falling linearly to zero |
| `accel_bias_ug`, `align_arcmin`, `gyro_bias_deg_per_hr` | µg, arcmin, deg/h | 100, 3, 0.01 | inertial sensor 1-sigmas |
| `carried_pos_sigma_m`, `carried_vel_sigma_m_s` | m, m/s | 100, 0.1 | entry prior, used only standalone |
| `guidance_sigma_m` | m | 20 | guidance dispersion per horizontal axis |
| `afs_mode` | | `standalone` | `off`, `standalone` or `differential` |
| `n_relays` | | 8 | 3 to 24 |
| `mask_deg` | deg | 5 | elevation mask |
| `afs_cn0_dbhz`, `sis_ure_m` | dB-Hz, m | 35, 30 | AFS signal level; user range error for `standalone` |
| `afs_first_fix_s`, `afs_interval_s` | s | 60, 60 | fix schedule |
| `baseline_km` | km | 10 | reference-station baseline for `differential` |
| `trn_source` | | `terrain-nav` | `off`, `terrain-nav` (synthetic relief, the `terrain-nav` matcher) or `lola-crlb` (Cramer-Rao bound on a LOLA DEM) |
| `trn_fix_time_s` | s | 480 | time of the terrain fix |
| `trn_altimeter_sigma_m`, `trn_map_sigma_m` | m | 8, 15 | `terrain-nav` |
| `dem_descriptor`, `trn_window_m`, `trn_height_sigma_m`, `trn_registration_sigma_m` | path, m | repo LOLA crop, 12000, 5, 30 | `lola-crlb`; the descriptor names a file, so it is refused on an inline-only surface |
| `lunar_time_mode` | | `ltc` | `off`, `ltc` or `tt` |
| `time_since_sync_days` | d | 3 | since the vehicle clock was last synchronised |
| `n_trials`, `seed` | | 2000, 20261024 | Monte Carlo landings; seed is standalone only |

Also refused: an invalid mode name, relays outside 3 to 24, and (for `lola-crlb`) a DEM whose terrain gives no usable
fix (the rule: no fix unless the weakest information axis is at least 1e-3 of the strongest, the aperture problem).

## `lunar-surface`

Surface PNT and timing availability by site and season, from the relay set, the Earth and the Sun, with the terrain
skyline. A one-site run equals `moonlight-service-volume` to the bit.

| Key | Unit | Default | Meaning |
|---|---|---|---|
| `sites` | table array | four south-polar sites at longitude 0: -89.9, -89.5, -88.5, -85.0 deg | sites |
| `season_dates` | `YYYY-MM-DD` | four dates 91.3 days apart from 2028-01-01 | season starts, 1901 to 2099 |
| `window_days` | d | 27.3217 | window after each season start |
| `step_min` | min | 30 | epoch step |
| `stay_days` | d | thread duration / 86400 | time on the surface; mission time advances by it (see Duration) |
| `timing_floor_s` | s | 5e-8 | 1-sigma of a clock disciplined by a relay or the Earth in view (ILLUSTRATIVE) |
| `n_sats`, `sma_km`, `eccentricity`, `inc_deg`, `argp_deg` | | the `moonlight-service-volume` defaults | relay constellation, 1 to 24 relays |
| `mask_deg`, `earth_mask_deg`, `sun_mask_deg` | deg | 5, 0, 0 | elevation masks |
| `pdop_threshold` | 1 | as `moonlight-service-volume` | PDOP under which positioning is available |
| `terrain` | table | none | the terrain horizon section, as in `moonlight-service-volume` |

Also refused: a date outside 1901 to 2099, a non-positive `stay_days` or `timing_floor_s`, and an entry state in a frame
other than MCI or MCMF after the thread's conversion.

## `lunar-ascent`

The ascent from a polar site to an insertion orbit: the descent's error model run in reverse, aided by AFS fixes and
lunar time, reporting the insertion dispersion.

| Key | Unit | Default | Meaning |
|---|---|---|---|
| `site_lat_deg`, `site_lon_deg` | deg | -89.5, 0 | site |
| `ascent_s` | s | thread duration | powered ascent length (see Duration) |
| `specific_force_m_s2` | m/s² | 5 | along the ascent |
| `insertion_altitude_km` | km | 100 | insertion altitude |
| `accel_bias_ug`, `align_arcmin`, `gyro_bias_deg_per_hr` | µg, arcmin, deg/h | 100, 3, 0.01 | inertial sensor 1-sigmas |
| `surface_pos_sigma_m`, `surface_vel_sigma_m_s` | m, m/s | 10, 0.01 | surface prior per axis, used only standalone |
| `cutoff_sigma_m_s` | m/s | 1 | engine cutoff dispersion per axis; reported, not carried |
| `afs_mode`, `n_relays`, `mask_deg`, `afs_cn0_dbhz`, `sis_ure_m`, `baseline_km` | | as `lunar-descent` | AFS aiding |
| `afs_first_fix_s`, `afs_interval_s` | s | 60, 30 | fix schedule |
| `lunar_time_mode`, `time_since_sync_days` | | `ltc`, 3 | lunar time |

Also refused: an invalid mode name, relays outside 3 to 24, and an entry state in a frame other than MCI after the
thread's conversion.

## Honesty

All four kinds are MODELLED. The only external oracle rows (`xval/mission-thread-lunar/`) test the propagator they share
against LRO (A1, MET) and CAPSTONE (A2, NOT MET), not a filter, signal or budget. The estimator's consistency check
(B1) says the estimate agrees with its own model, since truth and estimator share one force model.
