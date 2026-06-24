// SPDX-License-Identifier: AGPL-3.0-only
//! Joint multi-technique lunar OD + clock batch estimator (a SIMULATED network).
//!
//! One snapshot (single reference epoch) batch least-squares fit that **fuses three
//! observation techniques** to recover, *together*:
//!
//! * a lunar surface station's 3-D position (NovaMoon-class), in Moon-centred inertial (MCI) m,
//! * a small lunar constellation's per-satellite 3-D positions (MCI m), and
//! * every asset's clock offset (station + each satellite, s).
//!
//! The fused techniques are:
//!
//! 1. **Earth-baseline geodetic VLBI** — for each pair of Earth ground stations, the near-field
//!    two-range-difference delay to the lunar station treated as the VLBI beacon
//!    ([`crate::lunar_vlbi::geometric_delay_s`]). These delays make the station's **full 3-D**
//!    position observable — the headline. (Toggled by `with_vlbi`.)
//! 2. **Radiometric / lunar-local ranging** — Earth-station→satellite geocentric ranges (which
//!    multilaterate the constellation from the well-spread Earth stations) and station↔satellite
//!    lunar-local ranges in MCI, each a pseudo-range (Euclidean distance plus the differenced
//!    clock term). These tie the satellite positions and the asset clock differences.
//! 3. **Inter-satellite ranging** — satellite↔satellite pseudo-ranges (same form). These tie the
//!    constellation's relative geometry and clock differences.
//!
//! A single **station-clock sync** pseudo-observation (a time-transfer tie of the lunar station's
//! clock to the Earth network reference) anchors the otherwise-unobservable common clock offset.
//!
//! ## The headline (honest) result
//!
//! Lunar-local ranging from a station to a handful of satellites that all sit roughly *above* the
//! station leaves the station's position **weakly observed along one direction** — the ranges
//! pin the horizontal-ish components and the clock, but the radial/along-look component is poorly
//! constrained, so the solve is ill-conditioned and the recovered station 3-D error is large.
//! **Adding the Earth-baseline VLBI delays makes the station's full 3-D position observable**, and
//! the recovered station error collapses to the metre level. [`estimate`] run with `with_vlbi =
//! true` vs `false` on the *same* seed/truth demonstrates this directly, and the test
//! `vlbi_restores_station_observability` asserts the with-VLBI station error is markedly smaller.
//!
//! ## Honesty / scope (MODELLED — simulated closed-loop recovery)
//!
//! This is a **closed-loop recovery on a simulated network**: an injected truth state is mapped to
//! synthetic observables through the *same* geometry model the solver inverts, seeded Gaussian
//! noise is added, and the estimator must recover the injected truth within the noise. The oracle
//! is therefore **internal consistency** — recovery of an injected truth plus formal-covariance
//! (NEES) realism — **NOT** validation against real VLBI / ranging data. The satellite positions
//! are fixed, distinct, illustrative points on a representative lunar orbit (NO force-model
//! propagation inside the solver — a deliberately clean snapshot fit). No TRL, flight heritage or
//! agency endorsement is claimed.
//!
//! ### Frame convention (one consistent path, used identically for truth and prediction)
//!
//! Constellation, station and inter-satellite geometry live in **MCI** (Euclidean). For the VLBI
//! legs the lunar station is the beacon: at the single snapshot epoch the MCI and Moon-fixed
//! (MCMF) frames are aligned (the lunar rotation angle is zero at the epoch, see
//! [`crate::lunar::mci_to_mcmf`]), so the corrected MCI station position is read as an MCMF point,
//! reduced to selenographic coordinates ([`crate::lunar::mcmf_to_selenographic`]) and fed to
//! [`crate::lunar_vlbi::beacon_inertial_position`] — exactly the beacon mapping `lunar_vlbi` uses
//! — to obtain the station's geocentric-inertial position for the Earth baselines. Earth stations
//! come from [`crate::lunar_vlbi::station_inertial_position`]. Because truth and prediction take
//! the identical path, the closed loop is exact up to the injected noise.

use crate::batch_ls::{gauss_newton, LsqResult};
use crate::fusion::ukf::inverse;
use crate::lunar::mcmf_to_selenographic;
use crate::lunar_vlbi::{beacon_inertial_position, geometric_delay_s, station_inertial_position};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};

/// Speed of light (m/s).
const C: f64 = crate::timegeo::C_M_PER_S;

type Vec3 = [f64; 3];

// ---------------------------------------------------------------------------
// Config defaults (serde).
// ---------------------------------------------------------------------------

fn d_n_sat() -> usize {
    3
}
fn d_n_earth() -> usize {
    6
}
fn d_seed() -> u64 {
    42
}
fn d_sigma_vlbi_s() -> f64 {
    1.0e-11 // ~3 mm geodetic-VLBI delay precision
}
fn d_sigma_range_m() -> f64 {
    0.1 // coherent two-way range precision
}
fn d_sigma_isl_m() -> f64 {
    0.1 // optical inter-satellite range precision
}
fn d_sigma_clock_s() -> f64 {
    1.0e-9 // station-clock sync (time-transfer) tie σ
}
fn d_with_vlbi() -> bool {
    true
}
fn d_epoch_year() -> i32 {
    2024
}
fn d_epoch_month() -> u32 {
    1
}
fn d_epoch_day() -> u32 {
    1
}
fn d_station_lat_deg() -> f64 {
    -88.0 // south-polar NovaMoon-class site
}
fn d_station_lon_deg() -> f64 {
    23.0
}
fn d_station_alt_m() -> f64 {
    0.0
}
fn d_orbit_radius_km() -> f64 {
    6000.0
}

/// Configuration of the simulated joint OD + clock network.
///
/// All `sigma_*` are per-observable measurement noise standard deviations; weights are `1/σ²`.
/// `with_vlbi` toggles the Earth-baseline VLBI legs (the fusion-demonstration switch).
#[derive(Clone, Copy, Debug, serde::Deserialize)]
pub struct LunarNetworkConfig {
    /// Number of constellation satellites.
    #[serde(default = "d_n_sat")]
    pub n_sat: usize,
    /// Number of Earth ground stations (≥ 3 gives ≥ 2 independent VLBI baselines).
    #[serde(default = "d_n_earth")]
    pub n_earth: usize,
    /// RNG seed (deterministic measurement noise + truth jitter).
    #[serde(default = "d_seed")]
    pub seed: u64,
    /// VLBI delay measurement σ (s).
    #[serde(default = "d_sigma_vlbi_s")]
    pub sigma_vlbi_s: f64,
    /// Lunar-local range measurement σ (m).
    #[serde(default = "d_sigma_range_m")]
    pub sigma_range_m: f64,
    /// Inter-satellite range measurement σ (m).
    #[serde(default = "d_sigma_isl_m")]
    pub sigma_isl_m: f64,
    /// Station-clock sync (time-transfer) measurement σ (s) — the absolute-clock anchor.
    #[serde(default = "d_sigma_clock_s")]
    pub sigma_clock_s: f64,
    /// Include the Earth-baseline VLBI legs (the fusion switch).
    #[serde(default = "d_with_vlbi")]
    pub with_vlbi: bool,
    /// Epoch UTC year.
    #[serde(default = "d_epoch_year")]
    pub epoch_year: i32,
    /// Epoch UTC month (1–12).
    #[serde(default = "d_epoch_month")]
    pub epoch_month: u32,
    /// Epoch UTC day (1–31).
    #[serde(default = "d_epoch_day")]
    pub epoch_day: u32,
    /// Station selenographic latitude (deg).
    #[serde(default = "d_station_lat_deg")]
    pub station_lat_deg: f64,
    /// Station selenographic longitude (deg).
    #[serde(default = "d_station_lon_deg")]
    pub station_lon_deg: f64,
    /// Station altitude above the mean lunar sphere (m).
    #[serde(default = "d_station_alt_m")]
    pub station_alt_m: f64,
    /// Constellation orbit radius (km, MCI) on which the illustrative fixed satellites sit.
    #[serde(default = "d_orbit_radius_km")]
    pub orbit_radius_km: f64,
}

impl Default for LunarNetworkConfig {
    fn default() -> Self {
        LunarNetworkConfig {
            n_sat: d_n_sat(),
            n_earth: d_n_earth(),
            seed: d_seed(),
            sigma_vlbi_s: d_sigma_vlbi_s(),
            sigma_range_m: d_sigma_range_m(),
            sigma_isl_m: d_sigma_isl_m(),
            sigma_clock_s: d_sigma_clock_s(),
            with_vlbi: d_with_vlbi(),
            epoch_year: d_epoch_year(),
            epoch_month: d_epoch_month(),
            epoch_day: d_epoch_day(),
            station_lat_deg: d_station_lat_deg(),
            station_lon_deg: d_station_lon_deg(),
            station_alt_m: d_station_alt_m(),
            orbit_radius_km: d_orbit_radius_km(),
        }
    }
}

/// The recovered-vs-truth summary of a joint solve. Errors are `recovered − true`.
#[derive(Clone, Copy, Debug, serde::Serialize)]
pub struct JointSolution {
    /// Station 3-D position error magnitude (m).
    pub station_pos_err_m: f64,
    /// RMS over satellites of the per-satellite 3-D position error (m).
    pub sat_pos_rms_m: f64,
    /// Station clock error magnitude (s).
    pub station_clock_err_s: f64,
    /// RMS over satellites of the per-satellite clock error (s).
    pub sat_clock_rms_s: f64,
    /// Solver convergence flag.
    pub converged: bool,
    /// Solver iterations run.
    pub iterations: usize,
    /// Post-fit RMS measurement residual (whitened: the residual is in the measurement's own
    /// units, so this mixes s and m — see [`estimate`]; reported for diagnostics only).
    pub rms_residual: f64,
    /// Number of observables in the batch.
    pub n_obs: usize,
    /// Number of estimated parameters.
    pub n_params: usize,
}

// ---------------------------------------------------------------------------
// Geometry helpers.
// ---------------------------------------------------------------------------

fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn add(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] + b[0], a[1] + b[1], a[2] + b[2]]
}
fn norm(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

/// Number of estimated parameters: `3 + 3·n_sat + 1 + n_sat`.
fn n_params(cfg: &LunarNetworkConfig) -> usize {
    3 + 3 * cfg.n_sat + 1 + cfg.n_sat
}

/// Internal fixed geometry (nominal positions + epoch products) the forward model is built on.
struct Network {
    /// Nominal station MCI position (m).
    station_nom_mci: Vec3,
    /// Nominal satellite MCI positions (m).
    sat_nom_mci: Vec<Vec3>,
    /// Earth-station geocentric-inertial positions (m).
    earth_stations: Vec<Vec3>,
    /// TT Julian date of the snapshot epoch.
    jd_tt: f64,
    /// Nominal-geometry VLBI delays (s) for the station beacon over each baseline, used to
    /// mean-remove the VLBI observables (see [`forward`]).
    station_vlbi_nominal: Vec<f64>,
    /// Nominal-geometry Earth-station→satellite geocentric ranges (m), indexed `[sat][earth]`,
    /// used to mean-remove the (large, ~lunar-distance) radiometric-range observables.
    sat_range_nominal: Vec<Vec<f64>>,
}

impl Network {
    fn build(cfg: &LunarNetworkConfig) -> Network {
        let jd_utc = crate::timescales::julian_date(
            cfg.epoch_year,
            cfg.epoch_month,
            cfg.epoch_day,
            0,
            0,
            0.0,
        );
        let jd_tt = crate::timescales::utc_to_tt(jd_utc);
        let jd_ut1 = crate::timescales::utc_to_ut1(jd_utc, 0.0);

        // Station nominal MCI position: selenographic → MCMF; at the snapshot epoch MCI≡MCMF.
        let station_sel = crate::lunar::Selenographic {
            lat_rad: cfg.station_lat_deg.to_radians(),
            lon_rad: cfg.station_lon_deg.to_radians(),
            alt_m: cfg.station_alt_m,
        };
        let station_nom_mci = crate::lunar::selenographic_to_mcmf(station_sel);

        // Constellation: fixed, distinct, illustrative points on a representative lunar orbit.
        // Spread over true anomaly + alternating inclination so the satellites are NOT all on one
        // line yet (deliberately) sit toward one side of the sky from the polar station, leaving a
        // poorly-observed station direction for ranging-only — which VLBI then fixes.
        let r = cfg.orbit_radius_km * 1.0e3;
        let sat_nom_mci: Vec<Vec3> = (0..cfg.n_sat)
            .map(|k| {
                let frac = if cfg.n_sat > 1 {
                    k as f64 / cfg.n_sat as f64
                } else {
                    0.0
                };
                // True anomaly spread over a ~110° arc (a partial pass, not full sky coverage).
                let nu = (-55.0 + 110.0 * frac).to_radians();
                // Mild inclination wobble so the points are not coplanar.
                let inc = (60.0 + 8.0 * (k as f64).sin()).to_radians();
                [
                    r * nu.cos() * inc.sin(),
                    r * nu.sin() * inc.sin(),
                    r * inc.cos(),
                ]
            })
            .collect();

        // Earth ground stations: distinct lat/lon spread for ≥2 independent baselines.
        let earth_geodetics = earth_station_geodetics(cfg.n_earth);
        let earth_stations: Vec<Vec3> = earth_geodetics
            .into_iter()
            .map(|g| station_inertial_position(g, jd_tt, jd_ut1))
            .collect();

        let pairs = baseline_pairs(cfg.n_earth);
        let geocentric = |mci: Vec3| beacon_inertial_position(mcmf_to_selenographic(mci), jd_tt);
        // Nominal station-beacon VLBI delays over each baseline.
        let r_st_b = geocentric(station_nom_mci);
        let station_vlbi_nominal: Vec<f64> = pairs
            .iter()
            .map(|&(i, j)| geometric_delay_s(earth_stations[i], earth_stations[j], r_st_b))
            .collect();
        // Nominal Earth-station→satellite geocentric ranges.
        let sat_range_nominal: Vec<Vec<f64>> = sat_nom_mci
            .iter()
            .map(|&s| {
                let r_s = geocentric(s);
                earth_stations.iter().map(|&e| norm(sub(r_s, e))).collect()
            })
            .collect();

        Network {
            station_nom_mci,
            sat_nom_mci,
            earth_stations,
            jd_tt,
            station_vlbi_nominal,
            sat_range_nominal,
        }
    }

    /// Station geocentric-inertial position for a corrected MCI station position, via the
    /// `lunar_vlbi` beacon mapping (MCI≡MCMF at the epoch → selenographic → beacon).
    fn station_geocentric(&self, station_mci: Vec3) -> Vec3 {
        let sel = mcmf_to_selenographic(station_mci);
        beacon_inertial_position(sel, self.jd_tt)
    }
}

/// A small spread of Earth ground stations (DSN-flavoured), enough for the requested count.
fn earth_station_geodetics(n: usize) -> Vec<crate::frames::Geodetic> {
    // Goldstone, Canberra, Madrid, then a few extra spread points if more are asked for.
    let table: [(f64, f64, f64); 6] = [
        (40.4256, -116.8893, 1000.0), // Goldstone
        (-35.4014, 148.9819, 688.0),  // Canberra
        (40.4314, -4.2481, 837.0),    // Madrid
        (78.2300, 15.4000, 80.0),     // Svalbard-ish (high lat)
        (-25.8870, 27.7070, 1400.0),  // Hartebeesthoek-ish
        (19.8000, -155.5000, 3700.0), // Hawaii-ish
    ];
    (0..n.max(1))
        .map(|k| {
            let (lat, lon, alt) = table[k % table.len()];
            crate::frames::Geodetic {
                lat_rad: lat.to_radians(),
                lon_rad: lon.to_radians(),
                alt_m: alt,
            }
        })
        .collect()
}

/// All Earth-station index pairs `(i, j)` with `i < j` — the VLBI baselines.
fn baseline_pairs(n_earth: usize) -> Vec<(usize, usize)> {
    let mut v = Vec::new();
    for i in 0..n_earth {
        for j in (i + 1)..n_earth {
            v.push((i, j));
        }
    }
    v
}

// ---------------------------------------------------------------------------
// State-vector layout helpers. x = [station_pos(3), {sat_pos(3)}×N, station_clk, {sat_clk}×N].
// ---------------------------------------------------------------------------

/// Parameter scale (metres per stored unit). Every state parameter is stored as
/// `physical_metres / PARAM_SCALE`, so the small (~50 m) corrections live as ~5e-5 in stored
/// units. This is essential numerically: `gauss_newton`'s finite-difference step is
/// `1e-6·max(1, |param|)`, and with `|param| < 1` that is `1e-6` stored units = `1 m` physical —
/// large enough that a perturbation of a ~3.8e8 m geocentric range registers far above the range
/// value's f64 ULP (~8e-8 m). Storing corrections directly in metres would give a sub-µm FD step,
/// which underflows the precision of a lunar-distance range and corrupts the Jacobian.
const PARAM_SCALE: f64 = 1.0e6;

// Clock parameters are additionally held in RANGE-EQUIVALENT METRES (`c · clk_seconds`) before the
// `PARAM_SCALE` division — estimating `c·clk` instead of `clk` puts the clock Jacobian columns on
// the same O(1) scale as the position columns (a range's partial wrt the clock parameter is ±1,
// not ±c ≈ 3e8), avoiding a ~c² condition-number blow-up. The public boundary converts (× / ÷ c).

fn station_pos_corr(x: &[f64]) -> Vec3 {
    [x[0] * PARAM_SCALE, x[1] * PARAM_SCALE, x[2] * PARAM_SCALE]
}
fn sat_pos_corr(x: &[f64], k: usize) -> Vec3 {
    let b = 3 + 3 * k;
    [
        x[b] * PARAM_SCALE,
        x[b + 1] * PARAM_SCALE,
        x[b + 2] * PARAM_SCALE,
    ]
}
/// Station-clock parameter in range-equivalent metres (stored value × `PARAM_SCALE`).
fn station_clk_m(x: &[f64], n_sat: usize) -> f64 {
    x[3 + 3 * n_sat] * PARAM_SCALE
}
/// Satellite-`k` clock parameter in range-equivalent metres (stored value × `PARAM_SCALE`).
fn sat_clk_m(x: &[f64], n_sat: usize, k: usize) -> f64 {
    x[3 + 3 * n_sat + 1 + k] * PARAM_SCALE
}

/// Build the forward observable model `h(x)` for a network/config. The ordering is,
/// deterministically: the station-clock sync anchor; then (if enabled) the Earth-baseline VLBI
/// delays observing the station beacon and each satellite beacon over every baseline; then the
/// station↔satellite lunar-local ranges; then the satellite↔satellite ISL ranges.
///
/// Which technique observes what:
/// * **The lunar station's 3-D position** is observed by the Earth-baseline VLBI delays (when
///   enabled) plus the station↔sat lunar-local ranges. The illustrative constellation sits in a
///   ~110° arc on one side of the polar station's sky, so those ranges have poor geometry (a
///   weakly-observed look direction) — exactly the situation VLBI resolves. This is the headline
///   contrast: with VLBI the station's full 3-D is observable; range-only leaves it markedly worse.
/// * **The satellite positions** are observed by the Earth→sat radiometric ranges (multilaterated
///   from the well-spread Earth stations) + the ISL mesh + the station↔sat ranges — so the
///   constellation is recovered *regardless* of the VLBI switch, and the with/without contrast is
///   specifically about the STATION direction VLBI makes observable.
/// * **The clocks** are observed by the sync anchor + every range's differenced clock term.
///
/// The station VLBI delays and the Earth→sat ranges are reported MEAN-REMOVED — each minus its
/// nominal-geometry value. The absolute observable carries a large common-mode term independent of
/// the small corrections; differencing the absolute value by the finite-difference step underflows
/// f64 precision (catastrophic cancellation) and corrupts the partials. Subtracting the constant
/// nominal value (the SAME constant from the truth observable and the prediction) leaves the
/// least-squares problem identical but keeps `h` small so the finite-difference Jacobian is
/// well-scaled.
fn forward(net: &Network, cfg: &LunarNetworkConfig, x: &[f64]) -> Vec<f64> {
    let n_sat = cfg.n_sat;
    let station_mci = add(net.station_nom_mci, station_pos_corr(x));
    let sats_mci: Vec<Vec3> = (0..n_sat)
        .map(|k| add(net.sat_nom_mci[k], sat_pos_corr(x, k)))
        .collect();
    // Clock parameters in range-equivalent metres (see the layout-helper note).
    let clk_st = station_clk_m(x, n_sat);
    let clk_sat: Vec<f64> = (0..n_sat).map(|k| sat_clk_m(x, n_sat, k)).collect();

    let mut z = Vec::new();

    // 0. Station-clock sync pseudo-observation (a one-way time-transfer tie of the lunar station's
    //    clock to the Earth network reference time), in range-equivalent metres. Ranges only ever
    //    measure clock *differences*, so without an absolute anchor the clock parameters carry a
    //    rank-1 null space (a common offset on every clock is unobservable). This single direct
    //    sync observable breaks that ambiguity and is the absolute time reference.
    z.push(clk_st);

    // 1. Earth-baseline geodetic VLBI delays observing the lunar station as the beacon, MEAN-
    //    REMOVED. These tie the station's FULL 3-D position (the headline result).
    if cfg.with_vlbi {
        let pairs = baseline_pairs(cfg.n_earth);
        let r_station_beacon = net.station_geocentric(station_mci);
        for (b, &(i, j)) in pairs.iter().enumerate() {
            let d = geometric_delay_s(
                net.earth_stations[i],
                net.earth_stations[j],
                r_station_beacon,
            );
            z.push(d - net.station_vlbi_nominal[b]);
        }
    }

    // 2. Earth-station→satellite radiometric ranges (geocentric inertial, MEAN-REMOVED + the sat
    //    clock term). These multilaterate the satellites from the well-spread Earth stations —
    //    present regardless of the VLBI switch, so the constellation is recovered either way.
    for (k, sat) in sats_mci.iter().enumerate().take(n_sat) {
        let r_sat = net.station_geocentric(*sat);
        for (e, &r_e) in net.earth_stations.iter().enumerate() {
            let geo = norm(sub(r_sat, r_e));
            z.push((geo - net.sat_range_nominal[k][e]) + clk_sat[k]);
        }
    }

    // 3. Lunar-local ranges station↔each sat (MCI Euclidean + the differenced clock term; the
    //    clock parameters are already in range-equivalent metres so they add directly).
    for k in 0..n_sat {
        let geo = norm(sub(sats_mci[k], station_mci));
        z.push(geo + (clk_sat[k] - clk_st));
    }

    // 4. Inter-satellite ranges for each sat pair (i<j).
    for i in 0..n_sat {
        for j in (i + 1)..n_sat {
            let geo = norm(sub(sats_mci[i], sats_mci[j]));
            z.push(geo + (clk_sat[i] - clk_sat[j]));
        }
    }

    z
}

/// Per-observable σ vector in the same order as [`forward`]: the station-clock sync, then (if
/// enabled) the station-beacon VLBI delays, then the Earth→sat radiometric ranges, then the
/// station↔sat lunar-local ranges, then the inter-satellite ranges.
fn sigmas(cfg: &LunarNetworkConfig) -> Vec<f64> {
    let mut s = Vec::new();
    // 0. Station-clock sync, in range-equivalent metres (σ_clock_s · c).
    s.push((C * cfg.sigma_clock_s).max(1e-12));
    // 1. Station-beacon VLBI delays (n_base).
    if cfg.with_vlbi {
        for _ in baseline_pairs(cfg.n_earth) {
            s.push(cfg.sigma_vlbi_s.max(1e-30));
        }
    }
    // 2. Earth→sat radiometric ranges (n_sat × n_earth), reusing the range σ.
    for _ in 0..(cfg.n_sat * cfg.n_earth) {
        s.push(cfg.sigma_range_m.max(1e-9));
    }
    // 3. Lunar-local station↔sat ranges (n_sat).
    for _ in 0..cfg.n_sat {
        s.push(cfg.sigma_range_m.max(1e-9));
    }
    // 4. Inter-satellite ranges (C(n_sat, 2)).
    for _ in baseline_pairs(cfg.n_sat) {
        s.push(cfg.sigma_isl_m.max(1e-9));
    }
    s
}

/// The injected truth state (small corrections): station 50 m/axis, sats 30 m/axis, clocks 1e-7 s,
/// with a tiny seeded per-component jitter so different seeds give a genuinely different truth.
fn truth_state(cfg: &LunarNetworkConfig, rng: &mut ChaCha8Rng) -> Vec<f64> {
    let n_sat = cfg.n_sat;
    let mut x = vec![0.0; n_params(cfg)];
    // Deterministic base pattern + small seeded jitter. All values are PHYSICAL (metres, or
    // range-metres for clocks) here and divided by PARAM_SCALE at the end to match the stored units.
    let jit = Normal::new(0.0, 1.0).unwrap();
    // Station position correction (~50 m/axis).
    for a in 0..3 {
        x[a] = 50.0 * [1.0, -1.0, 0.8][a] + 5.0 * jit.sample(rng);
    }
    // Satellite position corrections (~30 m/axis).
    for k in 0..n_sat {
        let b = 3 + 3 * k;
        for a in 0..3 {
            let sign = if (k + a) % 2 == 0 { 1.0 } else { -1.0 };
            x[b + a] = 30.0 * sign + 3.0 * jit.sample(rng);
        }
    }
    // Station clock (~1e-7 s) as range-equivalent metres (× c).
    x[3 + 3 * n_sat] = C * (1.0e-7 + 1.0e-8 * jit.sample(rng));
    // Satellite clocks (~1e-7 s, alternating sign) as range-equivalent metres (× c).
    for k in 0..n_sat {
        let sign = if k % 2 == 0 { 1.0 } else { -1.0 };
        x[3 + 3 * n_sat + 1 + k] = C * (sign * 1.0e-7 + 1.0e-8 * jit.sample(rng));
    }
    // Convert physical → stored units.
    for v in x.iter_mut() {
        *v /= PARAM_SCALE;
    }
    x
}

/// Build, simulate, solve and compare against truth. Errors in the returned [`JointSolution`] are
/// `recovered − true`. The solve starts from `x0 = zeros`. All reported numbers are guarded against
/// NaN/inf (a diverged without-VLBI solve is captured as a large finite error, never propagated as
/// non-finite — that ill-conditioning is the point of the contrast).
pub fn estimate(cfg: &LunarNetworkConfig) -> JointSolution {
    let net = Network::build(cfg);
    let mut rng = ChaCha8Rng::seed_from_u64(cfg.seed);

    // Truth first (so the truth is seed-determined and identical regardless of with_vlbi), then
    // the noise stream.
    let x_true = truth_state(cfg, &mut rng);

    // Clean observables, then seeded per-observable Gaussian noise.
    let sig = sigmas(cfg);
    let z_clean = forward(&net, cfg, &x_true);
    let z: Vec<f64> = z_clean
        .iter()
        .zip(&sig)
        .map(|(&zc, &s)| zc + Normal::new(0.0, s).unwrap().sample(&mut rng))
        .collect();
    let weights: Vec<f64> = sig.iter().map(|&s| 1.0 / (s * s)).collect();

    let np = n_params(cfg);
    let x0 = vec![0.0; np];
    let net_ref = &net;
    let cfg_ref = cfg;
    let h = move |x: &[f64]| forward(net_ref, cfg_ref, x);

    // tol is the step norm in STORED units; 1e-6 stored = ~1 m physical, well below the lunar-
    // distance formal σ, so it declares convergence once the GN step settles into the floor.
    let result = gauss_newton(h, &z, &weights, &x0, 100, 1e-6);

    summarize_solution(cfg, &x_true, result, z.len(), np)
}

/// Convert a solver result + truth into the recovered-vs-truth summary, guarding non-finite values.
fn summarize_solution(
    cfg: &LunarNetworkConfig,
    x_true: &[f64],
    result: Option<LsqResult>,
    n_obs: usize,
    np: usize,
) -> JointSolution {
    let n_sat = cfg.n_sat;
    // A guard: a singular/diverged solve (None) or a non-finite estimate is reported as a large
    // finite error, never NaN/inf — the ill-conditioned without-VLBI case is expected to land here
    // or with a large station error, and either way it drives the contrast test.
    let big = 1.0e9_f64;
    let (x_hat, converged, iterations, rms) = match result {
        Some(r) if r.x.iter().all(|v| v.is_finite()) => {
            (r.x, r.converged, r.iterations, r.rms_residual)
        }
        _ => (vec![f64::NAN; np], false, 0, big),
    };

    // Errors are returned in PHYSICAL units (metres / range-metres) — the stored-unit difference
    // times PARAM_SCALE.
    let err = |i: usize| -> f64 {
        let e = (x_hat[i] - x_true[i]) * PARAM_SCALE;
        if e.is_finite() {
            e
        } else {
            big
        }
    };

    // Station position error magnitude.
    let station_pos_err_m = (err(0).powi(2) + err(1).powi(2) + err(2).powi(2))
        .sqrt()
        .min(big);

    // Satellite position RMS.
    let sat_pos_rms_m = if n_sat > 0 {
        let mut acc = 0.0;
        for k in 0..n_sat {
            let b = 3 + 3 * k;
            acc += err(b).powi(2) + err(b + 1).powi(2) + err(b + 2).powi(2);
        }
        ((acc / (3.0 * n_sat as f64)).sqrt()).min(big)
    } else {
        0.0
    };

    // Station clock error (the clock state is in range-metres; convert back to seconds ÷ c).
    let station_clock_err_s = (err(3 + 3 * n_sat).abs() / C).min(big);

    // Satellite clock RMS (metres → seconds ÷ c).
    let sat_clock_rms_s = if n_sat > 0 {
        let mut acc = 0.0;
        for k in 0..n_sat {
            acc += err(3 + 3 * n_sat + 1 + k).powi(2);
        }
        (((acc / n_sat as f64).sqrt()) / C).min(big)
    } else {
        0.0
    };

    let rms_residual = if rms.is_finite() { rms } else { big };

    JointSolution {
        station_pos_err_m,
        sat_pos_rms_m,
        station_clock_err_s,
        sat_clock_rms_s,
        converged,
        iterations,
        rms_residual,
        n_obs,
        n_params: np,
    }
}

// ---------------------------------------------------------------------------
// Formal covariance + NEES (optional consistency oracle).
// ---------------------------------------------------------------------------

/// Central finite-difference Jacobian `H` (`m × n`) of the forward model at `x`.
fn fd_jacobian(net: &Network, cfg: &LunarNetworkConfig, x: &[f64]) -> Vec<Vec<f64>> {
    let m = forward(net, cfg, x).len();
    let n = x.len();
    let mut jac = vec![vec![0.0; n]; m];
    for (p, &xp_val) in x.iter().enumerate() {
        let step = 1e-6 * xp_val.abs().max(1.0);
        let mut xp = x.to_vec();
        let mut xm = x.to_vec();
        xp[p] += step;
        xm[p] -= step;
        let hp = forward(net, cfg, &xp);
        let hm = forward(net, cfg, &xm);
        for (i, jr) in jac.iter_mut().enumerate() {
            jr[p] = (hp[i] - hm[i]) / (2.0 * step);
        }
    }
    jac
}

/// Single-run NEES `(x̂−x_true)ᵀ P⁻¹ (x̂−x_true)` at the recovered solution, where `P = (HᵀWH)⁻¹`
/// is the formal covariance built from the finite-difference Jacobian at the solution. Returns
/// `None` if the network is rank-deficient (singular normal matrix — the ill-conditioned case).
///
/// Note `P⁻¹ = HᵀWH`, so the NEES is `Δxᵀ (HᵀWH) Δx` — formed directly without inverting `P`.
pub fn formal_covariance_nees(cfg: &LunarNetworkConfig) -> Option<f64> {
    let net = Network::build(cfg);
    let mut rng = ChaCha8Rng::seed_from_u64(cfg.seed);
    let x_true = truth_state(cfg, &mut rng);
    let sig = sigmas(cfg);
    let z_clean = forward(&net, cfg, &x_true);
    let z: Vec<f64> = z_clean
        .iter()
        .zip(&sig)
        .map(|(&zc, &s)| zc + Normal::new(0.0, s).unwrap().sample(&mut rng))
        .collect();
    let weights: Vec<f64> = sig.iter().map(|&s| 1.0 / (s * s)).collect();

    let np = n_params(cfg);
    let x0 = vec![0.0; np];
    let h = {
        let net_ref = &net;
        move |x: &[f64]| forward(net_ref, cfg, x)
    };
    let r = gauss_newton(h, &z, &weights, &x0, 50, 1e-10)?;
    if !r.x.iter().all(|v| v.is_finite()) {
        return None;
    }

    // Information matrix HᵀWH at the solution; verify it is invertible (else rank-deficient).
    let jac = fd_jacobian(&net, cfg, &r.x);
    let m = jac.len();
    let n = np;
    let mut info = vec![vec![0.0; n]; n];
    for i in 0..m {
        let w = weights[i];
        for p in 0..n {
            for q in 0..n {
                info[p][q] += jac[i][p] * w * jac[i][q];
            }
        }
    }
    // P = info⁻¹ must exist; if not, the geometry is rank-deficient.
    inverse(&info)?;

    let dx: Vec<f64> = (0..n).map(|i| r.x[i] - x_true[i]).collect();
    // NEES = Δxᵀ (HᵀWH) Δx.
    let mut nees = 0.0;
    for p in 0..n {
        let mut row = 0.0;
        for q in 0..n {
            row += info[p][q] * dx[q];
        }
        nees += dx[p] * row;
    }
    if nees.is_finite() {
        Some(nees)
    } else {
        None
    }
}

// ---------------------------------------------------------------------------
// Scenario (TOML `kind = "lunar-joint-od-clock"`).
// ---------------------------------------------------------------------------

/// A runnable joint-OD scenario. Maps directly to a [`LunarNetworkConfig`] and runs both the
/// with-VLBI and without-VLBI solves on the same seed/truth so the report carries the
/// fusion contrast (the headline result).
#[derive(Clone, Copy, Debug, serde::Deserialize)]
pub struct LunarCombinationScenario {
    /// Number of constellation satellites.
    #[serde(default = "d_n_sat")]
    pub n_sat: usize,
    /// Number of Earth ground stations.
    #[serde(default = "d_n_earth")]
    pub n_earth: usize,
    /// RNG seed.
    #[serde(default = "d_seed")]
    pub seed: u64,
    /// VLBI delay σ (s).
    #[serde(default = "d_sigma_vlbi_s")]
    pub sigma_vlbi_s: f64,
    /// Lunar-local range σ (m).
    #[serde(default = "d_sigma_range_m")]
    pub sigma_range_m: f64,
    /// Inter-satellite range σ (m).
    #[serde(default = "d_sigma_isl_m")]
    pub sigma_isl_m: f64,
    /// Station-clock sync (time-transfer) σ (s).
    #[serde(default = "d_sigma_clock_s")]
    pub sigma_clock_s: f64,
    /// Station selenographic latitude (deg).
    #[serde(default = "d_station_lat_deg")]
    pub station_lat_deg: f64,
    /// Station selenographic longitude (deg).
    #[serde(default = "d_station_lon_deg")]
    pub station_lon_deg: f64,
    /// Station altitude above the mean lunar sphere (m).
    #[serde(default = "d_station_alt_m")]
    pub station_alt_m: f64,
    /// Constellation orbit radius (km, MCI).
    #[serde(default = "d_orbit_radius_km")]
    pub orbit_radius_km: f64,
    /// Epoch UTC year.
    #[serde(default = "d_epoch_year")]
    pub epoch_year: i32,
    /// Epoch UTC month.
    #[serde(default = "d_epoch_month")]
    pub epoch_month: u32,
    /// Epoch UTC day.
    #[serde(default = "d_epoch_day")]
    pub epoch_day: u32,
}

impl Default for LunarCombinationScenario {
    fn default() -> Self {
        let c = LunarNetworkConfig::default();
        LunarCombinationScenario {
            n_sat: c.n_sat,
            n_earth: c.n_earth,
            seed: c.seed,
            sigma_vlbi_s: c.sigma_vlbi_s,
            sigma_range_m: c.sigma_range_m,
            sigma_isl_m: c.sigma_isl_m,
            sigma_clock_s: c.sigma_clock_s,
            station_lat_deg: c.station_lat_deg,
            station_lon_deg: c.station_lon_deg,
            station_alt_m: c.station_alt_m,
            orbit_radius_km: c.orbit_radius_km,
            epoch_year: c.epoch_year,
            epoch_month: c.epoch_month,
            epoch_day: c.epoch_day,
        }
    }
}

impl LunarCombinationScenario {
    fn config(&self, with_vlbi: bool) -> LunarNetworkConfig {
        LunarNetworkConfig {
            n_sat: self.n_sat,
            n_earth: self.n_earth,
            seed: self.seed,
            sigma_vlbi_s: self.sigma_vlbi_s,
            sigma_range_m: self.sigma_range_m,
            sigma_isl_m: self.sigma_isl_m,
            sigma_clock_s: self.sigma_clock_s,
            with_vlbi,
            epoch_year: self.epoch_year,
            epoch_month: self.epoch_month,
            epoch_day: self.epoch_day,
            station_lat_deg: self.station_lat_deg,
            station_lon_deg: self.station_lon_deg,
            station_alt_m: self.station_alt_m,
            orbit_radius_km: self.orbit_radius_km,
        }
    }

    /// Run both the with-VLBI and without-VLBI solves and assemble the report.
    pub fn run(&self) -> LunarCombinationReport {
        let with = estimate(&self.config(true));
        let without = estimate(&self.config(false));
        let improvement = if with.station_pos_err_m > 0.0 {
            without.station_pos_err_m / with.station_pos_err_m
        } else {
            f64::INFINITY
        };
        LunarCombinationReport {
            with_vlbi: with,
            without_vlbi: without,
            station_observability_improvement_factor: improvement,
            n_sat: self.n_sat,
            n_earth: self.n_earth,
        }
    }
}

/// The result of a [`LunarCombinationScenario`]: the with/without-VLBI joint solutions plus the
/// station-observability improvement factor (the headline fusion contrast).
#[derive(Clone, Copy, Debug, serde::Serialize)]
pub struct LunarCombinationReport {
    /// Joint solution with the Earth-baseline VLBI legs included.
    pub with_vlbi: JointSolution,
    /// Joint solution with lunar-local ranging only (no VLBI).
    pub without_vlbi: JointSolution,
    /// `station_pos_err_m(without) / station_pos_err_m(with)` — how much VLBI sharpens the
    /// station 3-D recovery.
    pub station_observability_improvement_factor: f64,
    /// Number of constellation satellites.
    pub n_sat: usize,
    /// Number of Earth ground stations.
    pub n_earth: usize,
}

/// Render a [`LunarCombinationReport`] as a self-contained SVG: a two-bar comparison of the
/// station 3-D position error with and without VLBI (log10 m).
pub fn lunar_combination_svg(r: &LunarCombinationReport) -> String {
    let (w, h) = (820.0_f64, 360.0_f64);
    let (ml, mr, mt, mb) = (70.0_f64, 20.0_f64, 50.0_f64, 56.0_f64);
    let (pw, ph) = (w - ml - mr, h - mt - mb);
    let log10 = |x: f64| (x.max(1e-6)).log10();
    let with = log10(r.with_vlbi.station_pos_err_m);
    let without = log10(r.without_vlbi.station_pos_err_m);
    let y_lo = with.min(without).min(0.0) - 0.5;
    let y_hi = with.max(without).max(1.0) + 0.5;
    let span = (y_hi - y_lo).max(1e-9);
    let yof = |v: f64| mt + ph - ((v - y_lo) / span) * ph;
    let bar_w = pw / 4.0;
    let x_with = ml + pw * 0.25 - bar_w / 2.0;
    let x_without = ml + pw * 0.75 - bar_w / 2.0;
    let base_y = mt + ph;

    let mut svg = String::new();
    svg.push_str(&format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"
    ));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    ));
    svg.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"20\" font-size=\"15\" font-weight=\"bold\">Lunar joint OD + clock — station 3-D position error (VLBI restores observability)</text>"
    ));
    svg.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"38\" font-size=\"11\">{} sats, {} Earth stations · improvement factor {:.1}×</text>",
        r.n_sat, r.n_earth, r.station_observability_improvement_factor
    ));
    // With-VLBI bar.
    let yw = yof(with);
    svg.push_str(&format!(
        "<rect x=\"{x_with:.1}\" y=\"{yw:.1}\" width=\"{bar_w:.1}\" height=\"{:.1}\" fill=\"#7fbf7f\"/>",
        (base_y - yw).max(0.0)
    ));
    svg.push_str(&format!(
        "<text x=\"{:.1}\" y=\"{:.1}\" text-anchor=\"middle\" font-size=\"11\">with VLBI: {:.2} m</text>",
        x_with + bar_w / 2.0,
        base_y + 16.0,
        r.with_vlbi.station_pos_err_m
    ));
    // Without-VLBI bar.
    let ywo = yof(without);
    svg.push_str(&format!(
        "<rect x=\"{x_without:.1}\" y=\"{ywo:.1}\" width=\"{bar_w:.1}\" height=\"{:.1}\" fill=\"#bf7f7f\"/>",
        (base_y - ywo).max(0.0)
    ));
    svg.push_str(&format!(
        "<text x=\"{:.1}\" y=\"{:.1}\" text-anchor=\"middle\" font-size=\"11\">range-only: {:.2} m</text>",
        x_without + bar_w / 2.0,
        base_y + 16.0,
        r.without_vlbi.station_pos_err_m
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{base_y:.0}\" x2=\"{:.0}\" y2=\"{base_y:.0}\" stroke=\"#342c21\"/>",
        ml + pw
    ));
    svg.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"{:.0}\" font-size=\"11\">log10 station error (m); converged with/without = {}/{}</text>",
        h - 12.0,
        r.with_vlbi.converged,
        r.without_vlbi.converged
    ));
    svg.push_str("</svg>");
    svg
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn parameter_count_matches_the_layout() {
        let cfg = LunarNetworkConfig::default();
        // 3 (station) + 3·n_sat (sats) + 1 (station clk) + n_sat (sat clks).
        assert_eq!(n_params(&cfg), 3 + 3 * 3 + 1 + 3);
        assert_eq!(estimate(&cfg).n_params, 3 + 3 * 3 + 1 + 3);
    }

    #[test]
    fn observable_count_is_consistent() {
        let cfg = LunarNetworkConfig::default();
        // With VLBI: 1 clock sync + C(n_earth,2) station-VLBI delays + n_sat·n_earth Earth→sat
        // ranges + n_sat station↔sat ranges + C(n_sat,2) ISL. Without VLBI drops the VLBI delays.
        let n_base = cfg.n_earth * (cfg.n_earth - 1) / 2;
        let n_isl = cfg.n_sat * (cfg.n_sat - 1) / 2;
        let base = 1 + cfg.n_sat * cfg.n_earth + cfg.n_sat + n_isl;
        let with = estimate(&cfg);
        assert_eq!(with.n_obs, base + n_base);
        let mut cfg_no = cfg;
        cfg_no.with_vlbi = false;
        let without = estimate(&cfg_no);
        assert_eq!(without.n_obs, base);
        // The σ ordering must match the observable ordering.
        assert_eq!(sigmas(&cfg).len(), with.n_obs);
        assert_eq!(sigmas(&cfg_no).len(), without.n_obs);
    }

    #[test]
    fn recovers_truth_with_full_fusion() {
        let cfg = LunarNetworkConfig::default();
        let s = estimate(&cfg);
        assert!(s.converged, "full-fusion solve did not converge");
        // All numbers finite (NaN/inf guard).
        assert!(s.station_pos_err_m.is_finite() && s.sat_pos_rms_m.is_finite());
        assert!(s.station_clock_err_s.is_finite() && s.sat_clock_rms_s.is_finite());
        // Tolerances are a modest multiple of the expected formal σ for the default network
        // (VLBI σ = 1e-11 s ≈ 3 mm, range/ISL σ = 0.1 m): metre-level positions, sub-10-ns clocks.
        assert!(
            s.station_pos_err_m < 8.0,
            "station pos err {} m too large",
            s.station_pos_err_m
        );
        assert!(
            s.sat_pos_rms_m < 8.0,
            "sat pos rms {} m too large",
            s.sat_pos_rms_m
        );
        assert!(
            s.station_clock_err_s < 1.0e-8,
            "station clock err {} s too large",
            s.station_clock_err_s
        );
        assert!(
            s.sat_clock_rms_s < 2.0e-8,
            "sat clock rms {} s too large",
            s.sat_clock_rms_s
        );
    }

    #[test]
    fn vlbi_restores_station_observability() {
        let cfg = LunarNetworkConfig::default();
        let with = estimate(&cfg);
        let mut cfg_no = cfg;
        cfg_no.with_vlbi = false;
        let without = estimate(&cfg_no);
        // Same seed ⇒ same injected truth; the ONLY difference is the VLBI legs.
        assert!(with.station_pos_err_m.is_finite() && without.station_pos_err_m.is_finite());
        assert!(
            without.station_pos_err_m > 5.0 * with.station_pos_err_m,
            "VLBI should sharpen station 3-D recovery by ≥5×: with={} m without={} m",
            with.station_pos_err_m,
            without.station_pos_err_m
        );
        // With VLBI the station is recovered at the metre level (the headline). Without it, the
        // station's weakly-observed look direction blows the error up by the margin asserted above.
        assert!(
            with.station_pos_err_m < 8.0,
            "with-VLBI station error {} m not metre-level",
            with.station_pos_err_m
        );
    }

    #[test]
    fn deterministic_same_seed() {
        let cfg = LunarNetworkConfig::default();
        let a = estimate(&cfg);
        let b = estimate(&cfg);
        // Identical seed ⇒ bit-identical solution.
        assert_eq!(a.station_pos_err_m, b.station_pos_err_m);
        assert_eq!(a.sat_pos_rms_m, b.sat_pos_rms_m);
        assert_eq!(a.station_clock_err_s, b.station_clock_err_s);
        assert_eq!(a.sat_clock_rms_s, b.sat_clock_rms_s);
        assert_eq!(a.iterations, b.iterations);

        // Different seed ⇒ a different (but still recovered) solution.
        let mut cfg2 = cfg;
        cfg2.seed = 7;
        let c = estimate(&cfg2);
        assert_ne!(a.station_pos_err_m, c.station_pos_err_m);
        assert!(c.converged && c.station_pos_err_m < 8.0 && c.sat_pos_rms_m < 8.0);
    }

    #[test]
    fn nees_is_consistent() {
        // Monte-Carlo mean NEES over seeds should sit near n_params (loose band) for the
        // well-conditioned full-fusion network — a covariance-realism check.
        let base = LunarNetworkConfig::default();
        let np = n_params(&base) as f64;
        let mut acc = 0.0;
        let mut count = 0usize;
        for seed in 0..40u64 {
            let mut cfg = base;
            cfg.seed = seed;
            if let Some(nees) = formal_covariance_nees(&cfg) {
                assert!(nees.is_finite() && nees > 0.0, "NEES seed {seed}: {nees}");
                acc += nees;
                count += 1;
            }
        }
        assert!(count >= 30, "too few finite NEES samples: {count}");
        let mean = acc / count as f64;
        // A generous band around n_params (chi-square with np dof has mean np). The finite-
        // difference Jacobian + Gauss-Newton linearisation make this approximate, so the band
        // is deliberately loose.
        assert!(
            mean > 0.4 * np && mean < 2.5 * np,
            "mean NEES {mean} not within a loose band around n_params {np}"
        );
    }

    #[test]
    fn without_vlbi_numbers_are_finite() {
        // Even when the range-only geometry is ill-conditioned, every reported number must be
        // finite (the NaN/inf guard), so the contrast test never compares against a NaN.
        let cfg = LunarNetworkConfig {
            with_vlbi: false,
            ..LunarNetworkConfig::default()
        };
        let s = estimate(&cfg);
        assert!(s.station_pos_err_m.is_finite());
        assert!(s.sat_pos_rms_m.is_finite());
        assert!(s.station_clock_err_s.is_finite());
        assert!(s.sat_clock_rms_s.is_finite());
        assert!(s.rms_residual.is_finite());
    }

    #[test]
    fn scenario_run_carries_the_contrast() {
        let r = LunarCombinationScenario::default().run();
        assert!(r.with_vlbi.converged);
        assert!(r.with_vlbi.station_pos_err_m < 8.0);
        assert!(
            r.station_observability_improvement_factor > 5.0,
            "improvement factor {} too small",
            r.station_observability_improvement_factor
        );
    }

    #[test]
    fn svg_is_self_contained() {
        let r = LunarCombinationScenario::default().run();
        let svg = lunar_combination_svg(&r);
        assert!(svg.starts_with("<svg"));
        assert!(svg.ends_with("</svg>"));
        assert!(svg.contains("Lunar joint OD"));
    }

    #[test]
    fn run_toml_lunar_combination_dispatches() {
        let out = crate::api::run_toml("kind=\"lunar-joint-od-clock\"\n").unwrap();
        assert!(
            out.summary.contains("lunar-joint-od-clock"),
            "summary missing kind: {}",
            out.summary
        );
        let j: serde_json::Value = serde_json::from_str(&out.json).unwrap();
        assert!(j["with_vlbi"]["station_pos_err_m"].as_f64().unwrap() < 8.0);
        assert!(
            j["station_observability_improvement_factor"]
                .as_f64()
                .unwrap()
                > 5.0
        );
        assert!(out.svg.starts_with("<svg"));
    }

    #[test]
    fn station_nominal_is_at_lunar_surface() {
        // Sanity: the nominal station MCI position sits ~R_MOON from the Moon centre.
        let cfg = LunarNetworkConfig::default();
        let net = Network::build(&cfg);
        let mag = norm(net.station_nom_mci);
        let r_moon = crate::lunar::R_MOON_M;
        assert!(
            (r_moon - 1.0..r_moon + 1.0).contains(&mag),
            "station magnitude {mag} m not at lunar surface"
        );
        // The beacon mapping puts the station at lunar distance in geocentric inertial.
        let geo = net.station_geocentric(net.station_nom_mci);
        let range_km = norm(geo) / 1e3;
        assert!(
            (354_000.0..409_000.0).contains(&range_km),
            "station geocentric range {range_km} km not at lunar distance"
        );
    }
}
