// SPDX-License-Identifier: AGPL-3.0-only
//! Engine-side sensitivity of the lunar-VLBI station covariance (`lunar-vlbi-fim`) and the
//! campaign-driven Helmert datum (`lunar-frame-campaign`) to the engine's KNOWN geometry model
//! errors, run before the SPICE comparison is pre-registered so the tolerance can be shown to sit
//! above them.
//!
//! The known model errors, measured in `tests/lunar_vlbi_anise_oracle.rs` against DE440: the
//! analytic Moon centre is 194 to 223 km from DE440 (about 5.8e-4 rad at the lunar distance), the
//! engine's mean-Earth body frame puts a beacon about 850 m from its principal-axis placement
//! (about 4.9e-4 rad), the light time is not iterated (3.6e-6 s of delay) and polar motion is
//! dropped (station positions about 7 m). Each is applied here as a perturbation of the frozen
//! epoch geometry and the compared quantities recomputed; a 0.1 deg tilt (1.7e-3 rad, three times
//! the largest) is applied as a stress case.
//!
//! Run: `cargo run --example lunar_vlbi_model_error_sensitivity`

use kshana::fim::{information_matrix, sym_eig};
use kshana::lunar_frame_campaign::{
    campaign_jacobian_row, helmert_design, solve_datum, LunarFrameCampaignScenario,
};
use kshana::lunar_vlbi_fim::{
    schedule_jacobian, solve_covariance, EpochGeometry, LunarVlbiFimScenario, StateLayout,
};
use kshana::precession::{mat_vec, Mat3, Vec3};

fn rot(axis: Vec3, angle: f64) -> Mat3 {
    let n = (axis[0] * axis[0] + axis[1] * axis[1] + axis[2] * axis[2]).sqrt();
    let (x, y, z) = (axis[0] / n, axis[1] / n, axis[2] / n);
    let (s, c) = angle.sin_cos();
    let t = 1.0 - c;
    [
        [t * x * x + c, t * x * y - s * z, t * x * z + s * y],
        [t * x * y + s * z, t * y * y + c, t * y * z - s * x],
        [t * x * z - s * y, t * y * z + s * x, t * z * z + c],
    ]
}

fn matmul3(a: &Mat3, b: &Mat3) -> Mat3 {
    let mut m = [[0.0; 3]; 3];
    for i in 0..3 {
        for j in 0..3 {
            m[i][j] = (0..3).map(|k| a[i][k] * b[k][j]).sum();
        }
    }
    m
}

fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

/// The perturbations: name and a function applied to one epoch geometry.
type Perturb = (&'static str, Box<dyn Fn(&mut EpochGeometry)>);

fn perturbations() -> Vec<Perturb> {
    let moon_shift = |dir: usize, km: f64| -> Box<dyn Fn(&mut EpochGeometry)> {
        Box::new(move |g: &mut EpochGeometry| {
            // Shift the Moon centre (and so the beacon) by `km` along the radial (0),
            // along-track-like (1, perpendicular to radial in the equator plane) or
            // cross (2) direction of the instantaneous Earth-Moon vector.
            let r = g.moon_inertial;
            let rn = (r[0] * r[0] + r[1] * r[1] + r[2] * r[2]).sqrt();
            let u = [r[0] / rn, r[1] / rn, r[2] / rn];
            let a = cross([0.0, 0.0, 1.0], u);
            let an = (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt();
            let a = [a[0] / an, a[1] / an, a[2] / an];
            let c = cross(u, a);
            let d = [u, a, c][dir];
            for k in 0..3 {
                g.moon_inertial[k] += km * 1e3 * d[k];
                g.beacon_inertial[k] += km * 1e3 * d[k];
            }
        })
    };
    let frame_tilt = |axis: usize, rad: f64| -> Box<dyn Fn(&mut EpochGeometry)> {
        Box::new(move |g: &mut EpochGeometry| {
            // Rotate the Moon body frame by `rad` about body axis `axis`, keeping the beacon's
            // body-fixed coordinates: the beacon's inertial position moves with the frame.
            let mut ax = [0.0; 3];
            ax[axis] = 1.0;
            let mcmf = g.beacon_mcmf();
            g.icrf_to_moon = matmul3(&rot(ax, rad), &g.icrf_to_moon);
            let bt = kshana::precession::transpose(&g.icrf_to_moon);
            let off = mat_vec(&bt, mcmf);
            for k in 0..3 {
                g.beacon_inertial[k] = g.moon_inertial[k] + off[k];
            }
        })
    };
    let earth_tilt = |rad: f64| -> Box<dyn Fn(&mut EpochGeometry)> {
        Box::new(move |g: &mut EpochGeometry| {
            // A polar-motion-like tilt of the Earth-fixed frame about the GCRS x axis.
            g.gcrs_to_itrs = matmul3(&g.gcrs_to_itrs, &rot([1.0, 0.0, 0.0], rad));
            for s in g.stations_inertial.iter_mut() {
                *s = mat_vec(&rot([1.0, 0.0, 0.0], -rad), *s);
            }
        })
    };
    vec![
        ("moon 223 km radial", moon_shift(0, 223.0)),
        ("moon 223 km along", moon_shift(1, 223.0)),
        ("moon 223 km cross", moon_shift(2, 223.0)),
        ("body frame 4.9e-4 rad about x", frame_tilt(0, 4.9e-4)),
        ("body frame 4.9e-4 rad about y", frame_tilt(1, 4.9e-4)),
        ("body frame 4.9e-4 rad about z", frame_tilt(2, 4.9e-4)),
        ("earth frame 1.5e-6 rad (polar motion)", earth_tilt(1.5e-6)),
        (
            "STRESS body frame 0.1 deg about y",
            frame_tilt(1, 0.1_f64.to_radians()),
        ),
        ("STRESS moon 650 km along (0.1 deg)", moon_shift(1, 650.0)),
    ]
}

fn rel(a: f64, b: f64) -> f64 {
    (a - b).abs() / b.abs()
}

fn vlbi_fim(sc: &LunarVlbiFimScenario, label: &str) {
    let (geoms, obs) = sc.schedule().expect("schedule");
    let n_st = geoms[0].stations_inertial.len();
    let w = vec![1.0 / (1e-11 * 1e-11); obs.len()];
    let used = StateLayout::new(n_st, &[0], sc.estimate_beacon.unwrap_or(false));
    let free = StateLayout::new(n_st, &[], sc.estimate_beacon.unwrap_or(false));
    let solve = |g: &[EpochGeometry], l: &StateLayout| {
        solve_covariance(
            &information_matrix(&schedule_jacobian(g, &obs, l), &w),
            1e-9,
        )
    };
    let base = solve(&geoms, &used);
    let base_free = solve(&geoms, &free);
    println!(
        "[{label}] n_obs {} used rank {}/{} cond {:.4e} sigma {:?}",
        obs.len(),
        base.rank,
        base.dim,
        base.condition,
        base.sigma
    );
    let lmax = base_free
        .eigenvalues
        .iter()
        .cloned()
        .fold(0.0_f64, f64::max);
    println!(
        "[{label}] free rank {}/{} eig/lmax {:?}",
        base_free.rank,
        base_free.dim,
        base_free
            .eigenvalues
            .iter()
            .map(|e| e / lmax)
            .collect::<Vec<_>>()
    );
    // Elevation margin to the mask over every station-epoch.
    let mask = sc.elevation_mask_deg.unwrap_or(10.0);
    let st = [
        (40.4256_f64, -116.8893_f64, 1000.0),
        (-35.4014, 148.9819, 688.0),
        (40.4314, -4.2481, 837.0),
    ];
    let mut margin = f64::INFINITY;
    for g in &geoms {
        for &(la, lo, h) in &st {
            let geo = kshana::frames::Geodetic {
                lat_rad: la.to_radians(),
                lon_rad: lo.to_radians(),
                alt_m: h,
            };
            let el = kshana::frames::elevation(geo, g.beacon_itrs()).to_degrees();
            margin = margin.min((el - mask).abs());
        }
    }
    println!("[{label}] smallest |elevation - mask| over all station-epochs: {margin:.4} deg");
    for (name, f) in perturbations() {
        let pg: Vec<EpochGeometry> = geoms
            .iter()
            .map(|g| {
                let mut g = g.clone();
                f(&mut g);
                g
            })
            .collect();
        let p = solve(&pg, &used);
        let pf = solve(&pg, &free);
        let ds = base
            .sigma
            .iter()
            .zip(&p.sigma)
            .map(|(a, b)| rel(*b, *a))
            .fold(0.0_f64, f64::max);
        let pl = pf.eigenvalues.iter().cloned().fold(0.0_f64, f64::max);
        let dmin = rel(pf.eigenvalues[0] / pl, base_free.eigenvalues[0] / lmax);
        let dspec: Vec<String> = pf
            .eigenvalues
            .iter()
            .zip(&base_free.eigenvalues)
            .map(|(a, b)| format!("{:.1e}", rel(*a, *b)))
            .collect();
        let duspec: Vec<String> = p
            .eigenvalues
            .iter()
            .zip(&base.eigenvalues)
            .map(|(a, b)| format!("{:.1e}", rel(*a, *b)))
            .collect();
        println!("[{label}]     free spectrum rel changes {dspec:?}; used spectrum {duspec:?}");
        println!(
            "[{label}]   {name}: max sigma change {ds:.3e}; cond change {:.3e}; trace change {:.3e}; free rank {}; free smallest eig/lmax change {dmin:.3e}",
            rel(p.condition, base.condition),
            rel(p.trace_information, base.trace_information),
            pf.rank
        );
    }
}

fn campaign(sc: &LunarFrameCampaignScenario, label: &str) {
    let sched = sc.schedule().expect("schedule");
    let n_b = sched.geoms.len();
    let dim = 3 * n_b;
    let w = vec![1.0 / (1e-11 * 1e-11); sched.observations.len()];
    let pts: Vec<Vec3> = kshana::lunar::NAMED_SITES
        .iter()
        .map(|s| s.mcmf())
        .collect();
    let a = helmert_design(&pts);
    let datum = |geoms: &[Vec<EpochGeometry>]| {
        let jac: Vec<Vec<f64>> = sched
            .observations
            .iter()
            .map(|&o| campaign_jacobian_row(&geoms[o.beacon][o.epoch], 0, o, dim))
            .collect();
        solve_datum(&information_matrix(&jac, &w), &a, 1e-9).1
    };
    let base = datum(&sched.geoms);
    {
        let st = [
            (40.4256_f64, -116.8893_f64, 1000.0),
            (-35.4014, 148.9819, 688.0),
            (40.4314, -4.2481, 837.0),
        ];
        let (mut m_e, mut m_l) = (f64::INFINITY, f64::INFINITY);
        for per in &sched.geoms {
            for g in per {
                let bm = g.beacon_mcmf();
                for (s, &(la, lo, h)) in st.iter().enumerate() {
                    let geo = kshana::frames::Geodetic {
                        lat_rad: la.to_radians(),
                        lon_rad: lo.to_radians(),
                        alt_m: h,
                    };
                    let el = kshana::frames::elevation(geo, g.beacon_itrs()).to_degrees();
                    m_e = m_e.min((el - 10.0).abs());
                    let d = [
                        g.stations_inertial[s][0] - g.moon_inertial[0],
                        g.stations_inertial[s][1] - g.moon_inertial[1],
                        g.stations_inertial[s][2] - g.moon_inertial[2],
                    ];
                    let sm = mat_vec(&g.icrf_to_moon, d);
                    let le = kshana::lunar::lunar_look_angle(bm, sm).el_deg;
                    m_l = m_l.min(le.abs());
                }
            }
        }
        println!("[{label}] smallest |Earth-side elevation - 10| {m_e:.4} deg; smallest |lunar-side elevation - 0| {m_l:.4} deg");
    }
    // The estimated-anchor-first variant, marginalised by a Schur complement.
    let estimated = |geoms: &[Vec<EpochGeometry>]| {
        let ns = 6;
        let dimj = ns + dim;
        let jac: Vec<Vec<f64>> = sched
            .observations
            .iter()
            .map(|&o| campaign_jacobian_row(&geoms[o.beacon][o.epoch], ns, o, dimj))
            .collect();
        let j = information_matrix(&jac, &w);
        let blk = |r0: usize, c0: usize, nr: usize, nc: usize| -> Vec<Vec<f64>> {
            (0..nr)
                .map(|i| (0..nc).map(|k| j[r0 + i][c0 + k]).collect())
                .collect()
        };
        let mss_inv = kshana::fim::crlb(&blk(0, 0, ns, ns), 1e-9).pseudo_covariance;
        let msb = blk(0, ns, ns, dim);
        let mut info_b = blk(ns, ns, dim, dim);
        for r in 0..dim {
            for c in 0..dim {
                let mut acc = 0.0;
                for p in 0..ns {
                    for q in 0..ns {
                        acc += msb[p][r] * mss_inv[p][q] * msb[q][c];
                    }
                }
                info_b[r][c] -= acc;
            }
        }
        let cov = kshana::fim::crlb(&info_b, 1e-9).pseudo_covariance;
        let mut corr = 0.0_f64;
        for r in 0..dim {
            for c in 0..dim {
                if r / 3 != c / 3 {
                    corr = corr.max((cov[r][c] / (cov[r][r] * cov[c][c]).sqrt()).abs());
                }
            }
        }
        let d = solve_datum(&info_b, &a, 1e-9).1;
        let mut cov_ind = vec![vec![0.0; dim]; dim];
        for r in 0..dim {
            for c in 0..dim {
                if r / 3 == c / 3 {
                    cov_ind[r][c] = cov[r][c];
                }
            }
        }
        let info_ind = kshana::fim::crlb(&cov_ind, 1e-9).pseudo_covariance;
        let di = solve_datum(&info_ind, &a, 1e-9).1;
        (
            corr,
            d.translation_sigma_norm_m(),
            di.translation_sigma_norm_m(),
            d.sigma,
        )
    };
    let eb = estimated(&sched.geoms);
    println!("[{label}] estimated stations: max corr {:.4e}, translation {:.6} m, independence-discarded {:.6} m, sigma {:?}", eb.0, eb.1, eb.2, eb.3);
    println!(
        "[{label}] n_obs {} rank {} cond {:.4e} sigma {:?} weakest {:?}",
        sched.observations.len(),
        base.rank,
        base.condition,
        base.sigma,
        base.weakest_direction
    );
    let ev = sym_eig(&kshana::fim::information_matrix(&a, &vec![1.0; a.len()])).values;
    println!("[{label}] (A^T A eigenvalues, geometry only: {ev:?})");
    for (name, f) in perturbations() {
        let pg: Vec<Vec<EpochGeometry>> = sched
            .geoms
            .iter()
            .map(|per| {
                per.iter()
                    .map(|g| {
                        let mut g = g.clone();
                        f(&mut g);
                        g
                    })
                    .collect()
            })
            .collect();
        let p = datum(&pg);
        let ds = base
            .sigma
            .iter()
            .zip(&p.sigma)
            .map(|(x, y)| rel(*y, *x))
            .fold(0.0_f64, f64::max);
        let dot: f64 = base
            .weakest_direction
            .iter()
            .zip(&p.weakest_direction)
            .map(|(x, y)| x * y)
            .sum();
        println!(
            "[{label}]   {name}: max datum sigma change {ds:.3e}; cond change {:.3e}; weakest-direction angle {:.4} deg",
            rel(p.condition, base.condition),
            dot.abs().min(1.0).acos().to_degrees()
        );
        let pe = estimated(&pg);
        let dse =
            eb.3.iter()
                .zip(&pe.3)
                .map(|(x, y)| rel(*y, *x))
                .fold(0.0_f64, f64::max);
        println!(
            "[{label}]     estimated: corr change {:.3e} (abs {:.3e}); translation change {:.3e}; discarded change {:.3e}; max sigma change {dse:.3e}",
            rel(pe.0, eb.0),
            (pe.0 - eb.0).abs(),
            rel(pe.1, eb.1),
            rel(pe.2, eb.2)
        );
    }
}

fn main() {
    let d = LunarVlbiFimScenario::default();
    let (json, summary) = d.run_json().expect("run");
    println!("{summary}");
    let v: serde_json::Value = serde_json::from_str(&json).expect("json");
    println!(
        "los sweep {} max {} declination {}",
        v["schedule"]["los_itrs_sweep_deg"],
        v["schedule"]["los_itrs_max_sweep_deg"],
        v["schedule"]["beacon_declination_deg"]
    );
    vlbi_fim(&d, "vlbi-fim default");
    let with_beacon = LunarVlbiFimScenario {
        estimate_beacon: Some(true),
        ..Default::default()
    };
    vlbi_fim(&with_beacon, "vlbi-fim with beacon");

    let c = LunarFrameCampaignScenario::default();
    let (json, summary) = c.run_json().expect("run");
    println!("{summary}");
    let v: serde_json::Value = serde_json::from_str(&json).expect("json");
    println!(
        "sub-earth sweep {} ; beacons {}",
        v["campaign"]["sub_earth_direction_sweep_deg"], v["campaign"]["beacons"]
    );
    campaign(&c, "campaign default");
    for arc in [16.0, 48.0] {
        let s = LunarFrameCampaignScenario {
            arc_hours: Some(arc),
            ..Default::default()
        };
        let (json, _) = s.run_json().expect("run");
        let v: serde_json::Value = serde_json::from_str(&json).expect("json");
        println!(
            "arc {arc} h: translation norm {} sweep {}",
            v["datum_accuracy"]["translation_sigma_norm_m"],
            v["campaign"]["sub_earth_direction_sweep_deg"]
        );
        campaign(&s, &format!("campaign {arc} h"));
    }
}
