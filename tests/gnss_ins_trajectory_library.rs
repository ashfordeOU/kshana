// SPDX-License-Identifier: AGPL-3.0-only
//! The `gnss-ins` trajectory library (`fusion::trajectory`, RM-24): every profile runs in the
//! pack, flies the motion it names, and gives the loosely-coupled filter the observability its
//! motion should. MODELLED: synthetic profiles checked against their own kinematics and the
//! filter's own covariance.

use kshana::fusion::closed_loop::ClosedLoopInsGnss;
use kshana::fusion::gnss_ins_ekf::{EkfNoise, GnssInsEkf};
use kshana::fusion::pack::{run_gnss_ins, truth_trajectory, GnssInsScenario};
use kshana::fusion::trajectory::{quat_to_euler, TrajectoryCfg};

fn base() -> GnssInsScenario {
    let path = format!("{}/scenarios/gnss-ins.toml", env!("CARGO_MANIFEST_DIR"));
    toml::from_str(&std::fs::read_to_string(path).unwrap()).unwrap()
}

fn with(profile: &str, duration_s: f64) -> GnssInsScenario {
    let mut scn = base();
    scn.time.duration_s = duration_s;
    scn.trajectory = Some(toml::from_str(&format!("profile = \"{profile}\"")).unwrap());
    scn.gnss = toml::from_str(&format!(
        "windows = [ {{ t0 = 0.0, t1 = {a}, state = \"nominal\" }}, {{ t0 = {a}, t1 = {d}, state = \"denied\" }} ]",
        a = duration_s - 60.0,
        d = duration_s
    ))
    .unwrap();
    scn.validate().unwrap();
    scn
}

const PROFILES: [(&str, f64); 5] = [
    ("straight", 240.0),
    ("figure8", 240.0),
    ("stop_go", 300.0),
    ("aircraft", 300.0),
    ("uas", 300.0),
];

#[test]
fn every_profile_runs_and_fusion_beats_free_inertial_over_the_outage() {
    for (p, d) in PROFILES {
        let r = run_gnss_ins(&with(p, d));
        for run in [&r.quantum, &r.classical] {
            assert!(run.fused_outage_rms_m.is_finite(), "{p}");
            assert!(
                run.fused_outage_rms_m < run.free_outage_rms_m,
                "{p}: fused {} vs free {}",
                run.fused_outage_rms_m,
                run.free_outage_rms_m
            );
        }
    }
}

#[test]
fn profiles_fly_the_motion_they_name() {
    let tr = |p: &str, d: f64| truth_trajectory(&with(p, d));
    // straight: due north, no east motion.
    let s = tr("straight", 240.0);
    let last = s.last().unwrap().1;
    assert!(
        last.v_ned[0] > 14.9 && last.v_ned[1].abs() < 1e-3,
        "{:?}",
        last.v_ned
    );
    // figure8: heading swings both ways.
    let f8: Vec<f64> = tr("figure8", 240.0)
        .iter()
        .map(|(_, n)| quat_to_euler(&n.q).2)
        .collect();
    assert!(f8.iter().any(|&y| y > 1.5) && f8.iter().any(|&y| y < -1.5));
    // stop_go: the vehicle stops (speed near zero after it has moved).
    let sg = tr("stop_go", 300.0);
    let speeds: Vec<f64> = sg
        .iter()
        .map(|(_, n)| n.v_ned[0].hypot(n.v_ned[1]))
        .collect();
    let moved = speeds.iter().position(|&v| v > 11.0).unwrap();
    assert!(speeds[moved..].iter().any(|&v| v < 0.05));
    // aircraft: climbs and banks.
    let ac = tr("aircraft", 300.0);
    assert!(ac.iter().any(|(_, n)| n.p_llh.alt_m > 300.0));
    assert!(ac
        .iter()
        .any(|(_, n)| quat_to_euler(&n.q).0.to_degrees() > 20.0));
    // uas: altitude goes up and comes back down.
    let ua = tr("uas", 300.0);
    let alts: Vec<f64> = ua.iter().map(|(_, n)| n.p_llh.alt_m).collect();
    // Climbs above 55 m on a leg and later comes back below it on another.
    let up = alts.iter().position(|&a| a > 55.0).expect("climbs");
    assert!(
        alts[up..].iter().any(|&a| a < 52.0),
        "does not come back down"
    );
}

/// Yaw observability: with position and velocity fixes only, heading error is observable
/// through horizontal acceleration. A vehicle that never accelerates after reaching cruise
/// leaves it nearly unobserved; turning and stop-go motion observe it.
#[test]
fn turning_profiles_observe_heading_and_cruising_straight_does_not() {
    let yaw_sigma = |p: &str| {
        let traj = truth_trajectory(&with(p, 240.0));
        let start = traj[0].1;
        let mut nav = ClosedLoopInsGnss::new(
            start,
            GnssInsEkf::new(
                5.0,
                0.5,
                0.01,
                0.01,
                1e-4,
                EkfNoise {
                    vrw_psd: 1e-5,
                    arw_psd: 1e-10,
                    accel_bias_rw_psd: 1e-12,
                    gyro_bias_rw_psd: 1e-16,
                    accel_bias_tau: f64::INFINITY,
                    gyro_bias_tau: f64::INFINITY,
                },
            ),
        );
        let origin = start.p_llh;
        let dt = 0.1;
        for w in traj.windows(2) {
            let (a, b) = (w[0].1, w[1].1);
            // Feed the IMU that carries `a` to `b` (the truth's own increments).
            let (g, f) = imu_between(&a, &b, dt);
            nav.propagate(g, f, dt);
            if ((w[1].0 / dt).round() as i64) % 10 == 0 {
                let (rn, re) = kshana::inertial::mechanization::radii_of_curvature(origin.lat_rad);
                let p = [
                    (b.p_llh.lat_rad - origin.lat_rad) * (rn + origin.alt_m),
                    (b.p_llh.lon_rad - origin.lon_rad) * (re + origin.alt_m) * origin.lat_rad.cos(),
                    -(b.p_llh.alt_m - origin.alt_m),
                ];
                nav.fuse(p, b.v_ned, 1.0, 0.05);
            }
        }
        nav.covariance_diagonal()[8].sqrt().to_degrees()
    };
    let straight = yaw_sigma("straight");
    let fig8 = yaw_sigma("figure8");
    let stop_go = yaw_sigma("stop_go");
    eprintln!("yaw sigma after 240 s: straight {straight:.3} deg, figure8 {fig8:.4} deg, stop_go {stop_go:.4} deg");
    assert!(fig8 < 0.25 * straight && stop_go < 0.5 * straight);
}

/// The IMU the truth itself used between two consecutive states, recovered from the pack's
/// own trajectory by the library (so the filter is fed exactly the truth's motion).
fn imu_between(
    a: &kshana::inertial::mechanization::NavState,
    b: &kshana::inertial::mechanization::NavState,
    dt: f64,
) -> ([f64; 3], [f64; 3]) {
    let csv = format!(
        "t,lat_deg,lon_deg,alt_m,vn,ve,vd,roll_deg,pitch_deg,yaw_deg\n{}\n{}\n",
        row(0.0, a),
        row(dt, b)
    );
    let tr =
        kshana::fusion::trajectory::Trajectory::new(&TrajectoryCfg::Csv { csv }, a.p_llh, dt, 1)
            .unwrap();
    tr.imu(a, dt, 1)
}

fn row(t: f64, s: &kshana::inertial::mechanization::NavState) -> String {
    let (r, p, y) = quat_to_euler(&s.q);
    format!(
        "{t},{:.15},{:.15},{:.9},{:.12},{:.12},{:.12},{:.12},{:.12},{:.12}",
        s.p_llh.lat_rad.to_degrees(),
        s.p_llh.lon_rad.to_degrees(),
        s.p_llh.alt_m,
        s.v_ned[0],
        s.v_ned[1],
        s.v_ned[2],
        r.to_degrees(),
        p.to_degrees(),
        y.to_degrees()
    )
}
