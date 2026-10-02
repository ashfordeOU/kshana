// SPDX-License-Identifier: AGPL-3.0-only
//! Library comparison (SPICE geometry, binding) plus independent-library comparison (policy P2,
//! NumPy) for two verification rows that share one geometry harness:
//!
//! * "Lunar-VLBI station-coordinate covariance from a tracking schedule" (`lunar-vlbi-fim`);
//! * "Lunar frame datum from an observing campaign" (`lunar-frame-campaign`).
//!
//! ## Pre-registration (written 2026-10-01, before the oracle was run)
//!
//! ### Why two legs
//!
//! The P2 leg alone (NumPy on the engine's own committed Jacobian) re-checks the Fisher kernel
//! that `tests/fim_observability_reference.rs` already validates and cannot catch a wrong
//! Jacobian, which is these rows' real content. The **SPICE leg is therefore the binding
//! acceptance criterion**: every Jacobian row is rebuilt by central finite differences of
//! converged Newtonian light-time differences computed from SPICE geometry, never from a typed
//! partial-derivative formula. Both legs must pass to promote.
//!
//! ### Oracle
//!
//! `tests/fixtures/lunar_vlbi_campaign_spice_oracle/gen_reference.py`, run once, never linked in:
//! * **SPICE** (NASA/JPL NAIF CSPICE N0067 through spiceypy 8.2.0, MIT licence; NAIF kernels are
//!   public-domain data): `naif0012.tls`; `de440s.bsp` (Earth and Moon); `earth_latest_high_prec.bpc`
//!   (ITRF93 to J2000: precession, nutation, Earth rotation with real UT1 and polar motion);
//!   `moon_pa_de440_200625.bpc` and `moon_de440_250416.tf` (MOON_PA and MOON_ME body frames).
//!   Kernel SHA-256 in the reference header.
//! * For a station fixed in ITRF93 receiving at UTC epoch `t` (converted by SPICE), the light time
//!   solves `c LT = | E(t) - E(t-LT) + S(t) - M(t-LT) - B(t-LT) |` with `E` the Earth's barycentric
//!   position (difference formed from its SPICE velocity and acceleration at `t`, as in the
//!   existing ANISE harness), `S` the station in J2000, `M` the geocentric Moon and `B` the beacon's
//!   body-fixed offset rotated to J2000 at emission. The delay is `LT(station 2) - LT(station 1)`.
//!   Station partials: central difference of `LT_i` over a 3 km step of each ITRF93 coordinate;
//!   beacon partials: central difference of the delay over a 3 km step of each body-fixed
//!   coordinate. (Finite-difference noise about 2e-11 relative, truncation about 1e-11.)
//! * Body frames: the `lunar-vlbi-fim` beacon is placed in **MOON_PA** (as the route review
//!   specified; its beacon is not estimated, and the 850 m PA/ME offset moves the station
//!   partials by about 2e-6 rad). The `lunar-frame-campaign` beacons are placed in **MOON_ME**,
//!   the DE440 realisation of the mean-Earth frame the engine's IAU model approximates, because
//!   the Helmert parameters are expressed in the body frame (route-review condition).
//! * Visibility, built independently: the beacon's geometric elevation above the WGS-84 normal of
//!   each station at least the stated mask at both ends of a baseline; for the campaign also each
//!   station's elevation above the beacon's spherical local horizon at least the stated lunar
//!   mask.
//! * NumPy 2.3.5 / SciPy 1.18.1 (BSD-3-Clause): `numpy.linalg.eigh`, `inv`, `pinv`,
//!   `scipy.linalg.null_space` (LAPACK) for every linear-algebra step of both legs. Kshana uses a
//!   cyclic-Jacobi eigensolver and spectral (pseudo-)inverse.
//!
//! ### Inputs
//!
//! `inputs.json` (written by `examples/gen_lunar_vlbi_spice_fixture.rs`): the stated scenario
//! inputs, the engine's schedule and the engine's Jacobian and weights for `lunar-vlbi-fim`
//! default (three stations, beacon at selenographic 0, 0; 2024-01-01, 24 h at 30 min; mask 10 deg;
//! 1e-11 s; station 1 anchored) and its free network; and `lunar-frame-campaign` default (the four
//! named sites, the same stations and schedule, stations held fixed), 16 h and 48 h arcs, stations
//! estimated (anchor first), delay sigma 3e-11 s, and three collinear beacons (a design defect).
//! The test asserts the engine still builds exactly these Jacobians.
//!
//! ### Model-error budget (engine-side, run before this pre-registration)
//!
//! `examples/lunar_vlbi_model_error_sensitivity.rs` perturbs the engine's own geometry by its
//! known errors against DE440 (Moon centre 223 km radial / along / cross, body frame 4.9e-4 rad,
//! polar motion 1.5e-6 rad) and a 0.1 deg stress tilt. Largest realistic effects:
//! `lunar-vlbi-fim` default station sigma 3.2e-3, eigenvalues and condition 6.3e-3 (Moon cross);
//! campaign datum sigma 7.6e-3 (Moon cross) and 7.1e-3 (body frame about y, removed here by
//! placing the beacons in MOON_ME; the IAU-to-DE440 ME difference is several times smaller);
//! condition 7.9e-4; weakest direction 0.032 deg; stations-estimated sigma 1.5e-3, inter-beacon
//! correlation 2e-8. Elevation margins to the masks: 1.31 deg (vlbi-fim), 1.23 deg Earth-side and
//! 2.52 deg lunar-side (campaign 24 h), 0.21 and 1.32 deg (48 h), against an expected geometry
//! error of about 0.03 deg. The 1 % bars below therefore sit above every known model error, by a
//! factor of only about 1.3 for the campaign datum sigmas; a failure there would be a finding
//! about the engine's analytic Moon, stated as such.
//!
//! ### Tolerances (fixed now, before the first comparison)
//!
//! SPICE leg, `lunar-vlbi-fim` (both scenarios):
//! * the observation set (epoch, station pair) **identical**;
//! * rank and defect **equal**; every information eigenvalue above the rank threshold within
//!   **1 %**; condition number within **1 %**;
//! * default (full rank): every station-coordinate sigma within **1 %**; the headline RMS station
//!   sigma, the isotropic trace bound `sqrt(p / trace M)` and the ratios computed/equipartition and
//!   computed/trace-bound within **1 %**; the equipartition value equal to **1e-12** relative;
//! * free network (rank-deficient): the engine publishes a null headline with a RANK-DEFICIENT
//!   status, and the principal angle between the engine's and SPICE's null spaces at most
//!   **1 deg**;
//! * the Earth-fixed line-of-sight sweep (first to last epoch and maximum) and the beacon
//!   declination within **0.1 deg**.
//!
//! SPICE leg, `lunar-frame-campaign` (every scenario):
//! * the observation set (beacon, epoch, station pair) **identical**;
//! * Helmert rank and defect **equal**;
//! * full-rank scenarios: each of the seven datum sigmas, the translation sigma norm, each Helmert
//!   eigenvalue and the condition number within **1 %**; the weakest direction within **0.2 deg**;
//! * the translation sigma norm falls strictly 16 h > 24 h > 48 h in the SPICE leg; the sub-Earth
//!   (libration) sweep within **0.05 deg** per arc and increasing with the arc in both;
//! * stations fixed: the SPICE beacon information is exactly block-diagonal (off-block fraction
//!   0) and the engine emits 0; stations estimated: the largest inter-beacon correlation within
//!   **1e-4** absolute and the independence-discarded translation norm within **1 %**;
//! * collinear beacons: the engine publishes null datum sigmas and the principal angle between the
//!   engine's and SPICE's null spaces at most **0.2 deg**.
//!
//! P2 leg (NumPy on the engine's committed Jacobian, every scenario of both rows): rank and defect
//! **equal**; eigenvalues within **1e-9 of the largest**; covariance entries (vlbi-fim) within
//! **1e-9 of sqrt(C_ii C_jj)** and datum sigmas within **1e-9** relative where full rank (the
//! largest condition number is 4e5, so `κ ε` < 1e-10); the free network's pseudo-inverse sigmas
//! within **1e-6** relative and condition numbers within **1e-6** relative (smallest kept
//! eigenvalue 2.3e-9 of the largest, so `κ ε` is about 1e-7); null spaces and weakest directions
//! within **1e-6 rad**; correlations within **1e-9** absolute.
//!
//! ### What this validates
//!
//! The station covariance and the campaign datum covariance as Cramér–Rao bounds for the stated
//! reduced parameter sets on the stated, illustrative inputs, with the delay Jacobians reproduced
//! from independent ephemeris, Earth-orientation and lunar-orientation geometry. Not a real
//! campaign's accuracy: clocks, troposphere and Earth orientation are held fixed in both legs.
//!
//! ## Result (recorded 2026-10-01, not tuned)
//!
//! **`lunar-vlbi-fim`: AGREES on both legs.** Observation sets identical (16 of 147 scheduled
//! baseline-epochs clear the mask). Default: rank 6/6 both; station sigmas within 2.2e-3
//! (largest 0.1616 m against SPICE 0.1614 m); eigenvalues within 2.3e-3; condition 22093 against
//! 22039 (2.4e-3); headline 0.092635 against 0.092540 m (1.0e-3); trace bound 8.8e-5; equipartition
//! equal; ratios 71.36 against 71.29 and 50.46 against 50.40. Free network: rank 8/9 both, headline
//! null with RANK-DEFICIENT status, kept eigenvalues within 2.1e-3, condition 9.0e-5, null space
//! 0.006 deg apart. Line-of-sight sweep 10.965 against 10.961 deg, maximum 157.305 against 157.288
//! deg, beacon declination 12.762 against 12.770 deg. P2 leg: covariance within 2.0e-13, sigma
//! 1.0e-13 (free network 2.1e-7), eigenvalues 2.8e-16 of the largest, null space 1.5e-8 rad.
//!
//! **`lunar-frame-campaign`: the SPICE leg AGREES on all six scenarios; the P2 leg FAILS its bar on
//! one, so the row is not promoted.** SPICE leg: observation sets identical (64, 52, 120, 64, 64,
//! 48); datum sigmas within 3.2e-3, 4.7e-3, 1.4e-3, 6.0e-4 and 3.2e-3; condition within 2.6e-3;
//! weakest direction within 0.07 deg; collinear-beacon null space 0.031 deg apart (rank 5 both);
//! inter-beacon correlation 0.99999975 with stations estimated (gap 5.2e-9) and
//! independence-discarded translation within 3.8e-3; translation norm 7.568 > 6.401 > 0.817 m over
//! 16, 24 and 48 h; libration sweep 1.131, 1.723, 3.561 deg against the engine's 1.130, 1.722,
//! 3.564. P2 leg: within 3e-14 on the five stations-fixed scenarios, but on `stations_estimated`
//! the datum sigmas differ by up to 6.8e-6, the condition number by 9.1e-6 and the weakest
//! direction by 1.1e-3 deg, against bars of 1e-9, 1e-6 and 5.7e-5 deg. The bars rested on a
//! premise the pre-registration stated wrongly (largest condition number 4e5): with the stations
//! estimated the Helmert matrix has condition 2.1e8 and the joint information matrix eigenvalues
//! down to 6.4e-13 of the largest, so the marginal beacon information is formed with cancellation.
//! Three NumPy routes to the same Schur complement (`inv`, Cholesky `solve`, `eigh`, a QR
//! projection) themselves disagree by 2.9e-6 to 3.4e-6, so no double-precision algorithm meets
//! the 1e-9 bar there. The bar is not loosened after the fact: the strict test stays ignored and
//! `lunar_frame_campaign_finding_stations_estimated_p2_precision` pins the gap.

use kshana::lunar_frame_campaign::{BeaconInput, LunarFrameCampaignScenario};
use kshana::lunar_vlbi_fim::{schedule_jacobian, LunarVlbiFimScenario, StateLayout};

type J = serde_json::Value;

fn fixture(name: &str) -> J {
    let path = format!(
        "{}/tests/fixtures/lunar_vlbi_campaign_spice_oracle/{name}",
        env!("CARGO_MANIFEST_DIR")
    );
    let text = std::fs::read_to_string(&path).unwrap_or_else(|e| panic!("read {path}: {e}"));
    serde_json::from_str(&text).expect("json")
}

fn f(v: &J) -> f64 {
    v.as_f64()
        .unwrap_or_else(|| panic!("expected a number, got {v}"))
}

fn fv(v: &J) -> Vec<f64> {
    v.as_array()
        .unwrap_or_else(|| panic!("expected an array, got {v}"))
        .iter()
        .map(f)
        .collect()
}

fn mat(v: &J) -> Vec<Vec<f64>> {
    v.as_array().expect("matrix").iter().map(fv).collect()
}

fn u(v: &J) -> usize {
    v.as_u64()
        .unwrap_or_else(|| panic!("expected an integer, got {v}")) as usize
}

fn rel(a: f64, b: f64) -> f64 {
    (a - b).abs() / b.abs()
}

fn within(label: &str, got: f64, want: f64, tol: f64) {
    let r = rel(got, want);
    assert!(
        r <= tol,
        "{label}: engine {got} vs oracle {want} (relative {r:.3e} > {tol:.0e})"
    );
}

fn vec_within(label: &str, got: &[f64], want: &[f64], tol: f64) {
    assert_eq!(got.len(), want.len(), "{label}: length");
    for (k, (g, w)) in got.iter().zip(want).enumerate() {
        within(&format!("{label}[{k}]"), *g, *w, tol);
    }
}

/// Largest principal angle (deg) between the column spaces of two orthonormal bases given as
/// lists of column vectors.
fn principal_angle_deg(a: &[Vec<f64>], b: &[Vec<f64>]) -> f64 {
    assert_eq!(a.len(), b.len(), "null-space dimensions differ");
    // For each column of a, the norm of its projection onto span(b); the smallest such norm
    // bounds the cosine of the largest principal angle when both are orthonormal.
    let mut worst = 1.0_f64;
    for x in a {
        let mut p2 = 0.0;
        for y in b {
            let d: f64 = x.iter().zip(y).map(|(p, q)| p * q).sum();
            p2 += d * d;
        }
        worst = worst.min(p2.sqrt());
    }
    worst.min(1.0).acos().to_degrees()
}

fn null_columns(rows: &J) -> Vec<Vec<f64>> {
    rows.as_array()
        .expect("null rows")
        .iter()
        .map(|r| fv(&r["direction"]))
        .collect()
}

fn vlbi_scenario(name: &str) -> LunarVlbiFimScenario {
    match name {
        "default" => LunarVlbiFimScenario::default(),
        "free_network" => LunarVlbiFimScenario {
            datum: Some("free-network".to_string()),
            ..Default::default()
        },
        other => panic!("unknown scenario {other}"),
    }
}

fn campaign_scenario(name: &str) -> LunarFrameCampaignScenario {
    let b = |n: &str, alt: f64| BeaconInput {
        name: Some(n.to_string()),
        lat_deg: 0.0,
        lon_deg: 0.0,
        alt_m: Some(alt),
    };
    let d = LunarFrameCampaignScenario::default;
    match name {
        "default" => d(),
        "arc_16h" => LunarFrameCampaignScenario {
            arc_hours: Some(16.0),
            ..d()
        },
        "arc_48h" => LunarFrameCampaignScenario {
            arc_hours: Some(48.0),
            ..d()
        },
        "stations_estimated" => LunarFrameCampaignScenario {
            station_datum: Some("estimated-anchor-first".to_string()),
            ..d()
        },
        "delay_sigma_3x" => LunarFrameCampaignScenario {
            delay_sigma_s: Some(3.0e-11),
            ..d()
        },
        "collinear_beacons" => LunarFrameCampaignScenario {
            beacons: Some(vec![b("a", 0.0), b("b", 1000.0), b("c", 2000.0)]),
            ..d()
        },
        other => panic!("unknown scenario {other}"),
    }
}

fn run(json: Result<(String, String), String>) -> J {
    serde_json::from_str(&json.expect("scenario runs").0).expect("report json")
}

#[test]
fn lunar_vlbi_fim_matches_spice_geometry_and_numpy() {
    let inputs = fixture("inputs.json");
    let reference = fixture("reference.json");
    let ins = inputs["lunar_vlbi_fim"].as_array().expect("inputs");
    let refs = reference["lunar_vlbi_fim"].as_array().expect("reference");
    assert_eq!(ins.len(), 2);
    assert_eq!(ins.len(), refs.len());
    for (inp, r) in ins.iter().zip(refs) {
        let name = inp["name"].as_str().expect("name");
        assert_eq!(r["name"].as_str(), Some(name));
        let sc = vlbi_scenario(name);
        let v = run(sc.run_json());

        let (geoms, obs) = sc.schedule().expect("schedule");

        // ---- SPICE leg (binding). ----
        let s = &r["spice"];
        let engine_obs: Vec<Vec<usize>> = obs
            .iter()
            .map(|o| vec![o.epoch, o.station1, o.station2])
            .collect();
        let spice_obs: Vec<Vec<usize>> = s["observations"]
            .as_array()
            .unwrap()
            .iter()
            .map(|o| o.as_array().unwrap().iter().map(u).collect())
            .collect();
        assert_eq!(engine_obs, spice_obs, "{name}: observation sets differ");
        let fim = &v["fim"];
        assert_eq!(u(&fim["rank"]), u(&s["rank"]), "{name}: rank");
        assert_eq!(u(&fim["defect"]), u(&s["defect"]), "{name}: defect");
        let rank = u(&s["rank"]);
        let ev = fv(&fim["eigenvalues_per_m2"]);
        let sev = fv(&s["eigenvalues"]);
        let p = ev.len();
        vec_within(
            &format!("{name}: SPICE eigenvalues above threshold"),
            &ev[p - rank..],
            &sev[p - rank..],
            1e-2,
        );
        within(
            &format!("{name}: SPICE condition"),
            f(&fim["condition_number"]),
            f(&s["condition"]),
            1e-2,
        );
        let sched = &v["schedule"];
        for (k, key) in [
            "los_itrs_sweep_deg",
            "los_itrs_max_sweep_deg",
            "beacon_declination_deg",
        ]
        .iter()
        .enumerate()
        {
            let d = (f(&sched[key]) - f(&s[*key])).abs();
            assert!(
                d <= 0.1,
                "{name}: {key} engine {} vs SPICE {} ({k})",
                sched[key],
                s[*key]
            );
        }
        let head = &v["headline"];
        if rank == p {
            vec_within(
                &format!("{name}: SPICE station sigma"),
                &fv(&v["station_covariance"]["sigma_m"]),
                &fv(&s["sigma"]),
                1e-2,
            );
            within(
                &format!("{name}: SPICE headline sigma"),
                f(&head["computed_per_coordinate_sigma_m"]),
                f(&s["rms_station_sigma_m"]),
                1e-2,
            );
            within(
                &format!("{name}: SPICE trace bound"),
                f(&head["isotropic_trace_bound_m"]),
                f(&s["trace_bound_m"]),
                1e-2,
            );
            within(
                &format!("{name}: equipartition"),
                f(&head["equipartition_per_coordinate_sigma_m"]),
                f(&s["equipartition_m"]),
                1e-12,
            );
            within(
                &format!("{name}: SPICE ratio computed/equipartition"),
                f(&head["ratio_computed_over_equipartition"]),
                f(&s["ratio_computed_over_equipartition"]),
                1e-2,
            );
            within(
                &format!("{name}: SPICE ratio computed/trace bound"),
                f(&head["ratio_computed_over_trace_bound"]),
                f(&s["ratio_computed_over_trace_bound"]),
                1e-2,
            );
        } else {
            assert!(
                head["computed_per_coordinate_sigma_m"].is_null(),
                "{name}: rank-deficient headline must be null"
            );
            assert!(head["status"]
                .as_str()
                .unwrap()
                .starts_with("RANK-DEFICIENT"));
            let ang = principal_angle_deg(
                &null_columns(&fim["unobservable_directions"]),
                &mat(&s["null_space_columns"]),
            );
            assert!(
                ang <= 1.0,
                "{name}: SPICE null-space angle {ang} deg > 1 deg"
            );
        }

        // ---- P2 leg (NumPy on the committed engine Jacobian). ----
        let q = &r["p2"];
        assert_eq!(u(&fim["rank"]), u(&q["rank"]), "{name}: P2 rank");
        assert_eq!(u(&fim["defect"]), u(&q["defect"]), "{name}: P2 defect");
        let qev = fv(&q["eigenvalues"]);
        let lmax = qev.iter().cloned().fold(0.0_f64, f64::max);
        for (k, (a, b)) in ev.iter().zip(&qev).enumerate() {
            assert!(
                (a - b).abs() <= 1e-9 * lmax,
                "{name}: P2 eigenvalue {k}: {a} vs {b}"
            );
        }
        within(
            &format!("{name}: P2 condition"),
            f(&fim["condition_number"]),
            f(&q["condition"]),
            1e-6,
        );
        let sig_tol = if rank == p { 1e-9 } else { 1e-6 };
        vec_within(
            &format!("{name}: P2 sigma"),
            &fv(&v["station_covariance"]["sigma_m"]),
            &fv(&q["sigma"]),
            sig_tol,
        );
        if rank == p {
            let c = mat(&v["station_covariance"]["matrix_m2"]);
            let qc = mat(&q["covariance"]);
            for i in 0..p {
                for j in 0..p {
                    let scale = (qc[i][i] * qc[j][j]).sqrt();
                    assert!(
                        (c[i][j] - qc[i][j]).abs() <= 1e-9 * scale,
                        "{name}: P2 covariance [{i}][{j}] {} vs {}",
                        c[i][j],
                        qc[i][j]
                    );
                }
            }
        } else {
            let ang = principal_angle_deg(
                &null_columns(&fim["unobservable_directions"]),
                &mat(&q["null_space_columns"]),
            );
            assert!(
                ang.to_radians() <= 1e-6,
                "{name}: P2 null-space angle {ang} deg"
            );
        }

        // Last, so a changed Jacobian is reported through the comparisons first: the committed
        // Jacobian is what the engine builds now.
        let held: Vec<usize> = inp["held_fixed"]
            .as_array()
            .unwrap()
            .iter()
            .map(u)
            .collect();
        let layout = StateLayout::new(geoms[0].stations_inertial.len(), &held, false);
        assert_eq!(
            schedule_jacobian(&geoms, &obs, &layout),
            mat(&inp["engine_jacobian"]),
            "{name}: Jacobian drifted from the fixture"
        );
    }
}

#[test]
#[ignore = "FINDING 2026-10-01: SPICE leg agrees on all six scenarios; P2 leg on stations_estimated \
            differs by 6.8e-6 (datum sigma) against a pre-registered 1e-9 whose condition-number \
            premise was wrong (Helmert condition 2.1e8, Schur cancellation; NumPy routes disagree \
            among themselves by 3e-6). Not loosened; see the finding test."]
fn lunar_frame_campaign_matches_spice_geometry_and_numpy() {
    campaign_checks(&[]);
}

/// The finding, pinned: every pre-registered check passes except the P2 leg of the
/// stations-estimated scenario, whose datum-sigma gap stays between 1e-6 and 1e-4 (it fails if
/// the gap closes, so the row is re-examined, or moves, so the record is stale).
#[test]
fn lunar_frame_campaign_finding_stations_estimated_p2_precision() {
    campaign_checks(&["stations_estimated"]);
    let inputs = fixture("inputs.json");
    let reference = fixture("reference.json");
    let k = inputs["lunar_frame_campaign"]
        .as_array()
        .unwrap()
        .iter()
        .position(|c| c["name"] == "stations_estimated")
        .expect("scenario");
    let v = run(campaign_scenario("stations_estimated").run_json());
    let acc = &v["datum_accuracy"];
    let mut engine = fv(&acc["translation_sigma_m"]);
    engine.extend(fv(&acc["rotation_sigma_urad"]));
    engine.push(f(&acc["scale_sigma_ppb"]) / 1e3);
    let p2 = fv(&reference["lunar_frame_campaign"][k]["p2"]["sigma"]);
    let gap = engine
        .iter()
        .zip(&p2)
        .map(|(a, b)| rel(*a, *b))
        .fold(0.0_f64, f64::max);
    assert!(
        (1e-6..=1e-4).contains(&gap),
        "stations_estimated P2 datum-sigma gap {gap:.3e} left the pinned band [1e-6, 1e-4]"
    );
}

fn campaign_checks(p2_exempt: &[&str]) {
    let inputs = fixture("inputs.json");
    let reference = fixture("reference.json");
    let ins = inputs["lunar_frame_campaign"].as_array().expect("inputs");
    let refs = reference["lunar_frame_campaign"]
        .as_array()
        .expect("reference");
    assert_eq!(ins.len(), 6);
    assert_eq!(ins.len(), refs.len());
    let mut by_name = std::collections::BTreeMap::new();
    for (inp, r) in ins.iter().zip(refs) {
        let name = inp["name"].as_str().expect("name");
        assert_eq!(r["name"].as_str(), Some(name));
        let sc = campaign_scenario(name);
        let v = run(sc.run_json());
        let sched = sc.schedule().expect("schedule");
        let n_sc = u(&inp["n_station_columns"]);
        let dim = n_sc + 3 * sched.geoms.len();
        let jac: Vec<Vec<f64>> = sched
            .observations
            .iter()
            .map(|&o| {
                kshana::lunar_frame_campaign::campaign_jacobian_row(
                    &sched.geoms[o.beacon][o.epoch],
                    n_sc,
                    o,
                    dim,
                )
            })
            .collect();
        let helm = &v["helmert"];
        let acc = &v["datum_accuracy"];
        let full = u(&helm["defect"]) == 0;
        let engine_sigma: Vec<f64> = if full {
            let mut s = fv(&acc["translation_sigma_m"]);
            s.extend(fv(&acc["rotation_sigma_urad"]));
            s.push(f(&acc["scale_sigma_ppb"]) / 1e3);
            s
        } else {
            vec![]
        };

        for leg in ["spice", "p2"] {
            if leg == "p2" && p2_exempt.contains(&name) {
                continue;
            }
            let s = &r[leg];
            let spice = leg == "spice";
            assert_eq!(u(&helm["rank"]), u(&s["rank"]), "{name} {leg}: rank");
            assert_eq!(u(&helm["defect"]), u(&s["defect"]), "{name} {leg}: defect");
            if full {
                let tol = if spice { 1e-2 } else { 1e-9 };
                vec_within(
                    &format!("{name} {leg}: datum sigma"),
                    &engine_sigma,
                    &fv(&s["sigma"]),
                    tol,
                );
                within(
                    &format!("{name} {leg}: translation norm"),
                    f(&acc["translation_sigma_norm_m"]),
                    f(&s["translation_norm_m"]),
                    tol,
                );
                let ev = fv(&helm["eigenvalues"]);
                let sev = fv(&s["eigenvalues"]);
                if spice {
                    vec_within(&format!("{name} spice: eigenvalues"), &ev, &sev, 1e-2);
                } else {
                    let lmax = sev.iter().cloned().fold(0.0_f64, f64::max);
                    for (a, b) in ev.iter().zip(&sev) {
                        assert!(
                            (a - b).abs() <= 1e-9 * lmax,
                            "{name} p2: eigenvalue {a} vs {b}"
                        );
                    }
                }
                within(
                    &format!("{name} {leg}: condition"),
                    f(&helm["condition_number"]),
                    f(&s["condition"]),
                    if spice { 1e-2 } else { 1e-6 },
                );
                let ang = principal_angle_deg(
                    &[fv(&helm["weakest_direction"]["direction"])],
                    &[fv(&s["weakest_direction"])],
                );
                let bar = if spice { 0.2 } else { 1e-6_f64.to_degrees() };
                assert!(
                    ang <= bar,
                    "{name} {leg}: weakest direction {ang} deg > {bar}"
                );
            } else {
                assert!(acc["translation_sigma_norm_m"].is_null());
                assert!(acc["scale_sigma_ppb"].is_null());
                let ang = principal_angle_deg(
                    &null_columns(&helm["unobservable_directions"]),
                    &mat(&s["null_space_columns"]),
                );
                let bar = if spice { 0.2 } else { 1e-6_f64.to_degrees() };
                assert!(ang <= bar, "{name} {leg}: null-space angle {ang} deg");
            }
            let bi = &v["beacon_information"];
            if n_sc == 0 {
                assert_eq!(f(&bi["offblock_fraction"]), 0.0, "{name}: engine off-block");
                assert_eq!(f(&s["offblock_fraction"]), 0.0, "{name} {leg}: off-block");
            } else {
                let d = (f(&bi["max_interbeacon_correlation"])
                    - f(&s["max_interbeacon_correlation"]))
                .abs();
                assert!(
                    d <= if spice { 1e-4 } else { 1e-9 },
                    "{name} {leg}: correlation gap {d}"
                );
                within(
                    &format!("{name} {leg}: independence-discarded translation"),
                    f(&v["comparison"]["independence_discarded"]["translation_sigma_norm_m"]),
                    f(&s["independence_discarded_translation_norm_m"]),
                    if spice { 1e-2 } else { 1e-9 },
                );
            }
        }

        // SPICE-only: the schedule and the libration sweep.
        let s = &r["spice"];
        let engine_obs: Vec<Vec<usize>> = sched
            .observations
            .iter()
            .map(|o| vec![o.beacon, o.epoch, o.station1, o.station2])
            .collect();
        let spice_obs: Vec<Vec<usize>> = s["observations"]
            .as_array()
            .unwrap()
            .iter()
            .map(|o| o.as_array().unwrap().iter().map(u).collect())
            .collect();
        assert_eq!(engine_obs, spice_obs, "{name}: observation sets differ");
        let sweep = f(&v["campaign"]["sub_earth_direction_sweep_deg"]);
        let d = (sweep - f(&s["sub_earth_sweep_deg"])).abs();
        assert!(
            d <= 0.05,
            "{name}: libration sweep engine {sweep} vs SPICE {}",
            s["sub_earth_sweep_deg"]
        );
        // Last, so a changed Jacobian is reported through the comparisons first.
        assert_eq!(
            jac,
            mat(&inp["engine_jacobian"]),
            "{name}: Jacobian drifted from the fixture"
        );
        by_name.insert(
            name.to_string(),
            (
                f(&s["translation_norm_m"]),
                f(&s["sub_earth_sweep_deg"]),
                sweep,
            ),
        );
    }
    let (t16, w16, e16) = by_name["arc_16h"];
    let (t24, w24, e24) = by_name["default"];
    let (t48, w48, e48) = by_name["arc_48h"];
    assert!(
        t16 > t24 && t24 > t48,
        "SPICE datum translation must fall with the arc: {t16} {t24} {t48}"
    );
    assert!(
        w16 < w24 && w24 < w48,
        "SPICE sweep must grow: {w16} {w24} {w48}"
    );
    assert!(
        e16 < e24 && e24 < e48,
        "engine sweep must grow: {e16} {e24} {e48}"
    );
}
