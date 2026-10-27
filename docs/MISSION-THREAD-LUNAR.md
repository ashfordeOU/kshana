<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# The lunar segment of the Artemis-class mission thread

Four scenario kinds, each also a phase kind of the `mission-thread` interface (`src/mission_thread/`): they carry a
navigation-and-timing error budget through a south-polar lunar mission, from rendezvous in lunar orbit to landing,
the surface stay and the ascent back to orbit. **Every number here is MODELLED**: a stated model with ILLUSTRATIVE
inputs, none of it a statement about any mission, system or site. "Artemis-class" names a class of mission concept,
nothing more; no agency's data, product or endorsement is used or claimed, and nothing here is affiliated with one.
Advisory software, not certified navigation equipment. Kshana transmits nothing and drives no hardware.

| Phase and kind | What it computes | Example scenario | Core |
|---|---|---|---|
| `lunar-orbit-rendezvous` | relative navigation to docking, 100 km circular polar or 100 km by 3000 km elliptical polar | `scenarios/lunar-orbit-rendezvous.toml`, `...-elfo.toml` | `src/lunar_rendezvous.rs` |
| `lunar-descent` | the landing-dispersion budget at a south-polar site | `scenarios/lunar-descent.toml`, `lunar-descent-lola.toml` (needs the DEM, a checkout) | `src/lunar_landing.rs` |
| `lunar-surface` | positioning and timing availability by site and season | `scenarios/lunar-surface.toml`, `lunar-surface-terrain.toml` (needs the DEM, a checkout) | `src/lunar_surface_map.rs` |
| `lunar-ascent` | ascent to the rendezvous orbit and the covariance carried back to orbit | `scenarios/lunar-ascent.toml` | `src/lunar_ascent.rs` |

Each core is a function of `(config, entry state, thread context)`; a standalone run builds the default entry (a
Moon-centred inertial covariance of 100 m and 0.1 m/s, a 1 microsecond LTC clock) and the default epoch
2028-01-01, and a thread run takes the entry from the previous phase. The thread, not a core, converts frames and
timescales and applies the handover rule: a phase wrapper converts the entry state onto `Mci` (or `Mcmf` for the surface
map) and an LTC clock through the thread's conversions, and the conversion lines are added to the phase's budget. A frame
or timescale the thread cannot convert (ITRF, for example) is refused with the thread's message; a core called directly
with a frame it cannot use refuses it with the reason. A phase never resets a covariance, only hands on the one it ends with.

## What each phase does

### `lunar-orbit-rendezvous`

Two vehicles, a chaser and a target, fly the same orbit under the crate's lunar force model (a gravity field and the
Earth and Sun as third bodies). A batch Gauss-Newton estimate over the arc recovers both initial states from:

- an absolute position fix per vehicle from an ILLUSTRATIVE LCNS-class relay set (relays behind the Moon dropped, four
  needed), whose white part is the code-tracking bound on the AFS pilot (BPSK(5), 5.115 Mchip/s) at the stated C/N0 times
  the DOP cofactor;
- a **persistent** signal-in-space error on every fix: relay errors do not average away over an arc of hours, so it is
  carried as constant position biases, one common to both vehicles (`common_mode_fraction` of the variance, default 0.9,
  ILLUSTRATIVE) and one independent per vehicle. A constant bias gives no averaging benefit, the conservative reading;
- a crosslink range from the same signal at its own C/N0.

It reports the formal and Monte Carlo relative position and velocity error in the target's local axes, the fraction
of epochs with fixes on both vehicles, the mean normalised estimation error squared (NEES) of the relative state
against its expected value of 6, the relative drift from ignoring the gravity harmonics, a closed-form Hill
(Clohessy-Wiltshire) check for the circular case, the terminal relative-sensor models of the thread's `sensors.rs`
(ILLUSTRATIVE parameters) beside the signals-only figure, and the 6x6 covariance of the chaser at the end.

**What the result says.** With signals alone, the crosslink range fixes the relative position along the line of
sight, but the relative position across it is limited by the independent signal-in-space error and by what the
dynamics give; docking needs a relative sensor, and the `relative_sensors` rows show at what range each of the
thread's sensor models beats the signals. The result also depends on the truth and the estimator sharing a force
model; the `point-mass` estimator option shows the cost of ignoring the harmonics, and that run is not expected to be
consistent.

The phase flies its own nominal orbit (the `orbit` fields), so the entry position and velocity vector is not used,
only its covariance, frame and clock; an event in the thread says so.

### `lunar-descent`

Per horizontal axis, a five-state inertial error model (position, velocity, accelerometer bias, attitude tilt, gyro
bias, driven by the descent's specific force) from the entry covariance and the IMU, then a sequential filter over the
enabled aids:

- **AFS fix**: from the relays visible above a flat mask, with the ENU DOP cofactor times a user range error. `standalone`
  uses the signal-in-space error; `differential` uses the correction-link residual of `lunar-differential-pnt`. With
  exactly three relays in view the clock is aided, not estimated, and the fix then carries `c sigma_t`: this is where
  lunar time enters the fix.
- **Terrain-relative fix**: `terrain-nav` runs the crate's TERCOM/SITAN matcher on its synthetic relief and an Earth metre
  scale (a stand-in, not south-polar relief); `lola-crlb` takes the Cramer-Rao bound of matching an elevation window of the
  real LOLA DEM at the site, `I = sum(grad h grad h') / sigma_h^2`, and claims no fix where the relief constrains one
  direction only (the aperture problem).
- **Lunar time**: the clock error at the fix combines the entry clock, its growth since synchronisation and the LTC-TT
  term of `lunar-time-offset`. With `lunar_time_mode = "tt"` the vehicle ticks TT and the accumulated offset is an
  uncorrected bias; with `"ltc"` only the uncertainty of the published 56 to 59 microseconds per day band over the
  horizon remains. A time-tag error moves a fix along track by `v_h(t) sigma_t`.

Landing dispersion is the navigation error at touchdown plus an independent guidance term (`guidance_sigma_m`,
ILLUSTRATIVE, 20 m per axis by default). The `ablation` table runs every combination of the aids. The ellipse is
calibrated by Monte Carlo (the fraction of simulated landings inside the 3-sigma contour against the 98.9 % a
2-D Gaussian gives).

**Read it with care.** The default dispersion is dominated by the assumed guidance term, and at every south-polar site
the relay geometry is nearly the same, so the sites differ little. Lunar time matters little through time-tagging
(150 m/s times a few microseconds is under a millimetre); it matters when the geometry degrades to three relays.

### `lunar-surface`

For each site and season (an epoch and a window after it): relay positioning (four or more relays in view above the
mask and the site's terrain horizon with PDOP under the threshold, from the same functions and constellation as
`moonlight-service-volume`; the single-site result equals its figure to the bit), whether the Earth and the Sun are
above the horizon (analytic Sun, Moon and lunar orientation, libration included), and timing availability (a relay or
the Earth in view) with the longest stretch of neither. The relay figure does not change with the season in this model
(Keplerian set, mean rotation); the Earth and Sun figures do. The phase hands on the covariance unchanged and
disciplines the clock to a timing floor (ILLUSTRATIVE, 50 ns), leaving only the longest timing gap to hold over.

### `lunar-ascent`

The descent's five-state model on all three site axes from the surface state, an AFS fix at a stated interval with the
same lunar-time treatment, and the full 6x6 position-velocity covariance at insertion handed on, with the
position-velocity correlation of each axis kept. The engine cutoff dispersion moves where the vehicle is and is
reported beside the navigation covariance, not carried. The errors are held in the launch site's axes (no downrange
curvature) and the nominal exit state is a stand-in; only the covariance is the result.

## How a document states a phase

In a thread, a phase's `[phase.model]` table is the standalone scenario's own table. The phase length is the thread's
`duration_s`: a model that also states its own length key (`arc_s`, `descent_s`, `stay_days`, `ascent_s`) must agree with
it or the phase refuses, and a model that leaves the key out takes the thread's. The seed is the thread's id-keyed phase
seed, so a phase run on its own under the same id and thread seed returns the numbers it returns in the thread. A
misspelt model key is refused, not ignored. The handover between phases, and the frame and timescale conversions it
needs (Moon-centred inertial and Moon-fixed, Earth to Moon, the LTC pairs), belong to the thread.

## Evidence

The designs, inputs and bars were fixed in `xval/mission-thread-lunar/PREREGISTRATION.md` before any run, with six dated
amendments, each disclosed in the file; the verdict of every bar, the misses and the estimator history included, is in
`xval/mission-thread-lunar/RESULTS.md`.

- **A1** (the propagator against LRO's reconstructed trajectory, 24 h): MET, 33 m maximum 3-D difference against 500 m, 2.4 m
  RMS radial against 60 m.
- **A2** (the same propagator against the CAPSTONE near rectilinear halo orbit over one 6.5-day revolution): **NOT MET**,
  136.8 km end-position difference against 25 km, and 28.4 km osculating periapsis radius difference against 10 km. The
  causes were not isolated (candidates are the omitted radiation pressure and albedo, the sensitivity of the orbit to
  the initial state, and the analytic Earth and Sun series); the row stays MODELLED.
- These two rows test the propagator the lunar kinds share. **They test no navigation filter, signal or budget, and nothing
  else here has an external oracle.**

Everything else is MODELLED, and the kinds' consistency checks (B1 to B8 of the pre-registration) test an
implementation against its own stated model, not against the Moon.
