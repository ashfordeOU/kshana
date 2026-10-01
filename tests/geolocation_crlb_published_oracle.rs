// SPDX-License-Identifier: AGPL-3.0-only
//! Passive emitter geolocation by time difference of arrival (TDOA) and frequency difference
//! of arrival (FDOA) against the numbers Ho and Chan (1993) and Ho and Xu (2004) print.
//!
//! PRE-REGISTRATION (row M058, written 2026-10-01 before any Kshana value below was computed
//! and before the figure-reading script was run; the engine functions it calls were committed
//! in d5adea18 with unit tests on other geometries only).
//!
//! DISCLOSURE: while choosing the cases, the two Ho and Xu figures were looked at as page
//! renders (about 110 dots per inch) and as a one-third-scale view of the Fig. 7 image, to
//! identify which embedded image is which figure and where the dashed curves leave the solid
//! line. No value was read off them; the reading is the script's.
//!
//! ORACLES (Reference, P1 of docs/VALIDATION.md: numbers the publications computed and printed;
//! the papers are reading copies outside the repository, numbers cited by page and figure):
//! - Ho, K. C. and Chan, Y. T., "Solution and performance analysis of geolocation by TDOA",
//!   IEEE Transactions on Aerospace and Electronic Systems 29(4), 1993, pp. 1311-1322,
//!   doi 10.1109/7.259534 (copy SHA-256 61d010a6...aeb82781).
//! - Ho, K. C. and Xu, W., "An accurate algebraic solution for moving source location using
//!   TDOA and FDOA measurements", IEEE Transactions on Signal Processing 52(9), 2004,
//!   pp. 2453-2463, doi 10.1109/TSP.2004.831921 (copy SHA-256 5f657bc1...e910bd8).
//!
//! TOLERANCE (fixed before reading, the bar the round-1 record of this row set): 1 % of each
//! printed value where it is printed as a number; where only a plot exists, the reading
//! uncertainty is stated here as 1 %, at most the same bar, and the reading procedure must
//! prove its calibration (below) or the comparison is void, not passed. The one geometric
//! value (the 19.64 ms maximum TDOA) uses half a unit of its last printed digit, 0.005 ms,
//! which is tighter. For the Monte Carlo estimator check (D) the bar is the 1 % reading
//! uncertainty plus three standard errors of a Monte Carlo root-mean-square error (RMSE),
//! 3/sqrt(2N) for N trials: 0.01 + 3/sqrt(40 000) = 0.025 with N = 20 000.
//!
//! A. Ho and Chan 1993, geometric factor G_e of Eq. (31), RMSE / (c sigma_D), for three
//!    geostationary receivers (orbit radius 42 164 km, latitude 0) and an emitter on a
//!    spherical Earth of radius 6 378 km (Section II), TDOAs D21 and D32 with covariance
//!    Q = sigma_D^2 [[1, -1/2], [-1/2, 1]] (Eq. 29). Kshana: receivers [s1, s2, s3], s1 the
//!    reference, so the reference differences (D21, D31 = D21 + D32) have covariance
//!    sigma_D^2 [[1, 1/2], [1/2, 1]]; with c sigma_D = 1 m,
//!    G_e = sqrt(trace(`tdoa_crlb_on_sphere`)). Longitudes east-positive, x axis at Greenwich.
//!    - p. 1318, Fig. 5(a) text: emitter at Ottawa, 45.35 deg N 75.90 deg W; s2 at 70 deg W,
//!      s1 and s3 at 70 deg W -/+ the spacing. "with 5 deg separation, G_e is 251. When the
//!      separation is increased to 30 deg, it drops to 7.1."
//!    - pp. 1319-1320, Figs. 7 and 9 text: s2 at 0 deg longitude, spacing 2 deg: "to obtain a
//!      transmitter location at latitude greater than 40 deg with a root MSE of 2 km, we find
//!      from Fig. 7 that G_e should be smaller than 1718"; spacing 30 deg: "a TDOA standard
//!      deviation of 0.832 us is sufficient". The bound over latitude >= 40 deg and the plotted
//!      longitudes (0, 20, 40, 60 deg W) is the worst case, latitude 40 deg at longitude 0
//!      (G_e falls with latitude and longitude, p. 1319), so the emitter is at 40 deg N, 0 deg.
//!      Compared: G_e(2 deg) with 1718, and sigma_D = 2000 m / (G_e(30 deg) x 3e5 km/s), the
//!      paper's c (Appendix A), with 0.832 us.
//! B. Ho and Chan 1993, Appendix A, Eq. (42), p. 1320: emitter on the equator under s1,
//!    s2 at eta = acos(6378 / 42164) = 81.3 deg from s1: maximum TDOA "19.64 ms" with
//!    c = 3 x 10^5 km/s. Kshana: `tdoa_predict` converted to the paper's c (x 299 792 458 /
//!    3e8); tolerance 0.005 ms.
//! C. Ho and Xu 2004, Figs. 6 and 7 (p. 2460-2461), solid lines: the CRLB of position and of
//!    velocity, as RMSE, for receivers of Table I (p. 2460), TDOA and FDOA (range and
//!    range-rate difference) covariances c^2 sigma_d^2 R and 0.1 c^2 sigma_d^2 R, R with 1 on
//!    the diagonal and 0.5 elsewhere, the two uncorrelated (Section V-B). Fig. 6: far-field
//!    source u = [2000, 2500, 3000] m, u_dot = [-20, 15, 40] m/s; Fig. 7: near-field
//!    u = [300, 325, 275] m, same velocity. Kshana: sqrt of the trace of the position and
//!    velocity blocks of `tdoa_fdoa_crlb` at c^2 sigma_d^2 = 1 m^2 (0 dB on the plotted axis).
//!    Reading: `tests/fixtures/geolocation_crlb_published_oracle/read_ho_xu_figures.py`
//!    (procedure in its header, committed with this file) writes the value of each solid line at
//!    0 dB from a fixed-slope fit; a panel the script marks void is not compared and the test
//!    fails on it.
//! D. Ho and Xu 2004, Section V-B and Fig. 6/7: at low noise the published estimator "reaches
//!    the CRLB". Kshana's covariance-weighted maximum-likelihood Gauss-Newton solver
//!    `solve_tdoa_fdoa_cov`, seeded at the true state, over N = 20 000 seeded Gaussian trials:
//!    position and velocity RMSE at 10 log10(c^2 sigma_d^2) = -30 dB (far field) and -20 dB
//!    (near field), the low-noise ends of the two figures, against the read solid line there
//!    (value at 0 dB x 10^(0.05 x)), bar 0.025 relative. Trials where the solver does not
//!    converge count as failures of this check.
//!
//! Each block is its own strict test so that one failing does not hide the others.

use kshana::geolocation::{
    fdoa_predict, solve_tdoa_fdoa_cov, tdoa_crlb_on_sphere, tdoa_fdoa_crlb, tdoa_predict, Vec3, C,
};
use rand::SeedableRng;
use rand_chacha::ChaCha20Rng;
use rand_distr::{Distribution, StandardNormal};

const RE_M: f64 = 6_378_000.0;
const RS_M: f64 = 42_164_000.0;
const C_PAPER: f64 = 3.0e8;

fn ll(lat_deg: f64, lon_deg: f64, r: f64) -> Vec3 {
    let (la, lo) = (lat_deg.to_radians(), lon_deg.to_radians());
    [
        r * la.cos() * lo.cos(),
        r * la.cos() * lo.sin(),
        r * la.sin(),
    ]
}

/// G_e of Ho and Chan Eq. (31) for s2 at `lon2` (deg east), s1 and s3 at lon2 -/+ spacing.
fn geometric_factor(lat: f64, lon: f64, lon2: f64, spacing: f64) -> f64 {
    let rx = [
        ll(0.0, lon2 - spacing, RS_M),
        ll(0.0, lon2, RS_M),
        ll(0.0, lon2 + spacing, RS_M),
    ];
    let q = vec![vec![1.0, 0.5], vec![0.5, 1.0]];
    let c = tdoa_crlb_on_sphere(&rx, ll(lat, lon, RE_M), &q).expect("non-degenerate geometry");
    (c[0][0] + c[1][1] + c[2][2]).sqrt()
}

struct Check {
    failures: Vec<String>,
}

impl Check {
    fn new() -> Self {
        Self {
            failures: Vec::new(),
        }
    }
    fn rel(&mut self, what: &str, got: f64, printed: f64, tol: f64) {
        let r = got / printed - 1.0;
        let ok = r.abs() <= tol;
        println!(
            "{what:<62} printed {printed:>12.5}  kshana {got:>14.6}  rel {r:>+9.5}  {}",
            if ok { "ok" } else { "FAIL" }
        );
        if !ok {
            self.failures.push(format!("{what}: {got} vs {printed}"));
        }
    }
    fn abs(&mut self, what: &str, got: f64, printed: f64, tol: f64) {
        let ok = (got - printed).abs() <= tol;
        println!(
            "{what:<62} printed {printed:>12.5}  kshana {got:>14.6}  {}",
            if ok { "ok" } else { "FAIL" }
        );
        if !ok {
            self.failures.push(format!("{what}: {got} vs {printed}"));
        }
    }
    fn fail(&mut self, what: String) {
        println!("{what}  FAIL");
        self.failures.push(what);
    }
    fn finish(self) {
        assert!(
            self.failures.is_empty(),
            "outside tolerance: {:#?}",
            self.failures
        );
    }
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn ho_chan_1993_geometric_factors() {
    let mut ck = Check::new();
    let (ott_lat, ott_lon) = (45.35, -75.90);
    ck.rel(
        "Ottawa, 5 deg spacing, G_e (p. 1318)",
        geometric_factor(ott_lat, ott_lon, -70.0, 5.0),
        251.0,
        0.01,
    );
    ck.rel(
        "Ottawa, 30 deg spacing, G_e (p. 1318)",
        geometric_factor(ott_lat, ott_lon, -70.0, 30.0),
        7.1,
        0.01,
    );
    ck.rel(
        "40 N 0 E, 2 deg spacing, G_e (p. 1320)",
        geometric_factor(40.0, 0.0, 0.0, 2.0),
        1718.0,
        0.01,
    );
    let g30 = geometric_factor(40.0, 0.0, 0.0, 30.0);
    ck.rel(
        "40 N 0 E, 30 deg spacing, sigma_D for 2 km (us, p. 1320)",
        2000.0 / (g30 * C_PAPER) * 1e6,
        0.832,
        0.01,
    );
    ck.finish();
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn ho_chan_1993_maximum_tdoa() {
    let mut ck = Check::new();
    let eta = (RE_M / RS_M).acos().to_degrees();
    let emitter = ll(0.0, 0.0, RE_M);
    let rx = [ll(0.0, 0.0, RS_M), ll(0.0, eta, RS_M)];
    let tdoa_s = tdoa_predict(emitter, &rx)[0];
    ck.abs(
        "maximum TDOA, paper's c (ms, Eq. 42)",
        tdoa_s * C / C_PAPER * 1e3,
        19.64,
        0.005,
    );
    ck.finish();
}

/// Receivers of Ho and Xu Table I: positions (m) and velocities (m/s).
fn table_1() -> ([Vec3; 5], [Vec3; 5]) {
    (
        [
            [300.0, 100.0, 150.0],
            [400.0, 150.0, 100.0],
            [300.0, 500.0, 200.0],
            [350.0, 200.0, 100.0],
            [-100.0, -100.0, -100.0],
        ],
        [
            [30.0, -20.0, 20.0],
            [-30.0, 10.0, 20.0],
            [10.0, -20.0, 10.0],
            [10.0, 20.0, 30.0],
            [-20.0, 10.0, 10.0],
        ],
    )
}

fn r_matrix(scale: f64) -> Vec<Vec<f64>> {
    (0..4)
        .map(|i| {
            (0..4)
                .map(|j| if i == j { scale } else { 0.5 * scale })
                .collect()
        })
        .collect()
}

const FAR: (Vec3, Vec3) = ([2000.0, 2500.0, 3000.0], [-20.0, 15.0, 40.0]);
const NEAR: (Vec3, Vec3) = ([300.0, 325.0, 275.0], [-20.0, 15.0, 40.0]);

/// (position RMSE bound m, velocity RMSE bound m/s) at c^2 sigma_d^2 = `noise` m^2.
fn crlb_rmse(source: (Vec3, Vec3), noise: f64) -> (f64, f64) {
    let (s, sd) = table_1();
    let c = tdoa_fdoa_crlb(
        &s,
        &sd,
        source.0,
        source.1,
        &r_matrix(noise),
        &r_matrix(0.1 * noise),
    )
    .expect("non-degenerate geometry");
    (
        (c[0][0] + c[1][1] + c[2][2]).sqrt(),
        (c[3][3] + c[4][4] + c[5][5]).sqrt(),
    )
}

/// The script's reading of one solid line at 0 dB, or the reason it is void.
fn reading(figure: &str, panel: &str) -> Result<f64, String> {
    let path = concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/tests/fixtures/geolocation_crlb_published_oracle/ho_xu_2004_readings.json"
    );
    let text = std::fs::read_to_string(path).map_err(|e| format!("{path}: {e}"))?;
    let v: serde_json::Value = serde_json::from_str(&text).map_err(|e| e.to_string())?;
    let p = &v["figures"][figure][panel];
    if let Some(reason) = p.get("void") {
        return Err(format!("{figure}/{panel} void: {reason}"));
    }
    p["value_at_0_db"]
        .as_f64()
        .ok_or_else(|| format!("{figure}/{panel}: no reading"))
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn ho_xu_2004_crlb_lines() {
    let mut ck = Check::new();
    for (figure, source) in [("fig6_far_field", FAR), ("fig7_near_field", NEAR)] {
        let (pos, vel) = crlb_rmse(source, 1.0);
        for (panel, got) in [("position_m", pos), ("velocity_m_per_s", vel)] {
            match reading(figure, panel) {
                Ok(read) => ck.rel(&format!("{figure} {panel} CRLB at 0 dB"), got, read, 0.01),
                Err(e) => ck.fail(e),
            }
        }
    }
    ck.finish();
}

/// Monte Carlo RMSE (position, velocity) of the covariance-weighted solver, or the number of
/// non-converged trials.
fn monte_carlo_rmse(source: (Vec3, Vec3), noise: f64, n: usize, seed: u64) -> (f64, f64, usize) {
    let (s, sd) = table_1();
    let (p, v) = source;
    let q_rd = r_matrix(noise);
    let q_rrd = r_matrix(0.1 * noise);
    // Cholesky factor of R (unit scale) for correlated draws.
    let l = {
        let r = r_matrix(1.0);
        let mut l = vec![vec![0.0; 4]; 4];
        for i in 0..4 {
            for j in 0..=i {
                let mut acc = r[i][j];
                for k in 0..j {
                    acc -= l[i][k] * l[j][k];
                }
                l[i][j] = if i == j { acc.sqrt() } else { acc / l[j][j] };
            }
        }
        l
    };
    let rd0: Vec<f64> = tdoa_predict(p, &s).iter().map(|t| t * C).collect();
    let rrd0 = fdoa_predict(p, v, &s, &sd);
    let mut rng = ChaCha20Rng::seed_from_u64(seed);
    let mut draw = |scale: f64| -> Vec<f64> {
        let z: Vec<f64> = (0..4).map(|_| StandardNormal.sample(&mut rng)).collect();
        (0..4)
            .map(|i| scale * (0..=i).map(|k| l[i][k] * z[k]).sum::<f64>())
            .collect()
    };
    let (mut sp, mut sv, mut bad) = (0.0, 0.0, 0usize);
    let x0 = [p[0], p[1], p[2], v[0], v[1], v[2]];
    for _ in 0..n {
        let nt = draw(noise.sqrt());
        let nf = draw((0.1 * noise).sqrt());
        let tdoa: Vec<f64> = (0..4).map(|i| (rd0[i] + nt[i]) / C).collect();
        let fdoa: Vec<f64> = (0..4).map(|i| rrd0[i] + nf[i]).collect();
        match solve_tdoa_fdoa_cov(&s, &sd, &tdoa, &fdoa, &q_rd, &q_rrd, x0) {
            Some(x) => {
                sp += (0..3).map(|k| (x[k] - p[k]).powi(2)).sum::<f64>();
                sv += (0..3).map(|k| (x[k + 3] - v[k]).powi(2)).sum::<f64>();
            }
            None => bad += 1,
        }
    }
    let ok = (n - bad).max(1) as f64;
    ((sp / ok).sqrt(), (sv / ok).sqrt(), bad)
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn ho_xu_2004_ml_estimator_attains_the_printed_bound() {
    const N: usize = 20_000;
    let tol = 0.01 + 3.0 / (2.0 * N as f64).sqrt();
    let mut ck = Check::new();
    for (figure, source, x_db, seed) in [
        ("fig6_far_field", FAR, -30.0, 2004_06u64),
        ("fig7_near_field", NEAR, -20.0, 2004_07u64),
    ] {
        let noise = 10f64.powf(x_db / 10.0);
        let (rp, rv, bad) = monte_carlo_rmse(source, noise, N, seed);
        if bad > 0 {
            ck.fail(format!("{figure}: {bad} of {N} trials did not converge"));
        }
        let scale = 10f64.powf(0.05 * x_db);
        for (panel, got) in [("position_m", rp), ("velocity_m_per_s", rv)] {
            match reading(figure, panel) {
                Ok(read) => ck.rel(
                    &format!("{figure} {panel} Monte Carlo RMSE at {x_db} dB"),
                    got,
                    read * scale,
                    tol,
                ),
                Err(e) => ck.fail(e),
            }
        }
    }
    ck.finish();
}
