// SPDX-License-Identifier: AGPL-3.0-only
//! Library comparison (SPICE geometry, binding) plus independent-library comparison (policy P2,
//! NumPy) for the lunar-surface-point coordinate covariance a VLBI (very long baseline
//! interferometry) delay schedule buys, on the engine's KERNEL path: the `lunar-vlbi-fim`
//! scenario with `datum = "all-stations-fixed"`, `estimate_beacon = true` and
//! `planetary_kernel_path` set, so the beacon sits on the JPL (Jet Propulsion Laboratory) DE440
//! Moon read by the engine's own NAIF (Navigation and Ancillary Information Facility) kernel
//! reader.
//!
//! This is a NEW comparison for a NEW method. The existing row "Lunar-surface-point coordinate
//! covariance from a VLBI delay schedule, kept distinct from the Earth-station one" runs on the
//! analytic Moon series and stays MODELLED whatever happens here; a pass here supports a separate
//! kernel-path row, as "Lunar geodetic VLBI, kernel path" stands beside "Lunar geodetic VLBI".
//!
//! ## Pre-registration (written and published before the fixture was generated or the oracle run)
//!
//! ### Why the kernel path, and what was run before this was written (engine side only)
//!
//! A delay from a fixed baseline constrains the beacon's direction, so the beacon covariance is
//! extremely anisotropic (default schedule: condition about 1.3e5) and its small sigmas are
//! sensitive to the direction of each line of sight. Engine-side, before this file: the same
//! scenario with the analytic Moon series and with the kernel Moon differ by 3.9 % in the beacon
//! y sigma (0.0782 m against 0.0812 m) and by up to 0.09 % in the eigenvalues. The analytic
//! series' few-hundred-kilometre error therefore cannot pass a 1 % bar on this quantity, which is
//! why the comparison is made on the kernel path. No oracle value existed when this was written.
//!
//! ### Remaining model differences, estimated now
//!
//! With the Moon centre from DE440 on both sides, the engine still differs from the oracle in:
//! the lunar orientation (engine IAU 2015 rotation model, oracle MOON_ME, the DE440 realisation of
//! the same mean-Earth axes; their difference is a few 1e-5 rad, and rotating a covariance with
//! a 12.7 m and a 0.078 m axis by delta adds about `(delta x 12.7 m)^2` to the small variance:
//! below 0.1 % for delta = 5e-5 rad); the instantaneous geometry of `lunar-vlbi-fim` against the
//! oracle's converged light time (the Moon moves about 1.3 km in 1.28 s, a 3.4e-6 rad direction
//! change, below 0.03 % on the scale the 3.9 % above implies for 5.8e-4 rad); and UT1 and polar
//! motion (engine none, oracle the ITRF93 kernel; about 1e-6 rad). The 1 % bars below sit above
//! all of these.
//!
//! ### Quantity
//!
//! For the scenario above at its defaults (stations, beacon at selenographic 0 N 0 E on the
//! 1737.4 km sphere, 2024-01-01 00:00 UTC, 24 h at 30 min, elevation mask 10 deg, delay sigma
//! 1e-11 s, relative eigenvalue threshold 1e-9), the kernel being the committed cut of
//! `de440s.bsp` in `tests/fixtures/lunar_vlbi_anise_oracle/kernels/de440s_2024-01-01.bsp`:
//! the observation set; the rank and defect of the 3 x 3 beacon information matrix; its three
//! eigenvalues and condition number; the three body-fixed beacon sigmas
//! (`station_covariance.sigma_m`, whose only columns are the beacon's here) and their RMS
//! (`beacon_link.computed_per_coordinate_sigma_m`); the lever arm range/baseline and the ratio of
//! the computed to the equipartition beacon sigma.
//!
//! ### Oracle
//!
//! `tests/fixtures/lunar_vlbi_surface_point_spice_oracle/gen_reference.py`, run once as a
//! separate program, calling no Kshana code. It reuses, by import, the SPICE light-time and
//! linear-algebra functions of the M069 oracle (`tests/fixtures/lunar_vlbi_campaign_spice_oracle/
//! gen_reference.py`, itself oracle code that calls only SPICE and NumPy):
//! * **SPICE** (CSPICE N0067 through spiceypy 8.2.0, MIT licence; the toolkit and kernels are
//!   NAIF's, United States government work): `naif0012.tls`, `de440s.bsp` (Earth and Moon),
//!   `earth_latest_high_prec.bpc` (ITRF93 with UT1 and polar motion), `moon_pa_de440_200625.bpc`
//!   and `moon_de440_250416.tf` (the MOON_ME frame). The beacon is fixed in MOON_ME, because its
//!   coordinates are the estimated parameters and the engine's body axes are mean-Earth axes.
//! * Each Jacobian row is a central difference, 3 km steps along each MOON_ME axis, of the delay
//!   `LT(station 2) - LT(station 1)`, each `LT` the converged Newtonian light time from the beacon
//!   at emission to the station at reception (the M069 `delay_row`). No partial-derivative formula
//!   of Kshana's is used.
//! * Visibility, built independently: the beacon's geometric elevation above each station's
//!   WGS-84 (World Geodetic System 1984) normal at least 10 deg at both ends of a baseline.
//! * NumPy 2.3.5 (BSD-3-Clause; LAPACK) `eigh` and `inv` for the information matrix, its spectrum
//!   and its inverse; the lever arm from the SPICE beacon range at the first epoch and the longest
//!   station chord; the equipartition sigma `c sigma_tau (rho / B) sqrt(3 / N)`.
//!
//! ### Inputs
//!
//! `inputs.json`, written after this commit by the ignored emitter below: the stated scenario
//! inputs, the engine's observation set, and the engine's Jacobian and weights (for the P2 leg).
//! The strict test also asserts the engine still builds exactly that Jacobian.
//!
//! ### Tolerances (fixed now)
//!
//! SPICE leg (binding): observation set **identical**; rank and defect **equal**; each of the
//! three eigenvalues, the condition number, each of the three beacon sigmas and their RMS within
//! **1 %**; the lever arm within **1e-4** relative; the computed-over-equipartition ratio within
//! **1 %**.
//!
//! P2 leg (NumPy on the engine's committed Jacobian): rank and defect **equal**; eigenvalues
//! within **1e-9 of the largest**; the three sigmas within **1e-9** relative (condition about
//! 1.3e5, so `kappa epsilon` is about 3e-11).
//!
//! Both legs must pass to propose the kernel-path row. A failure on either is published as a
//! finding, the strict test stays ignored with the measured gap, and a gated test pins it.
//!
//! ### Mutation check, planned now
//!
//! After the comparison, the beacon partial in `lunar_vlbi_fim::jacobian_row` is perturbed (its
//! body-frame rotation transposed); the strict test must turn red; the edit is then reverted.
//!
//! ### What this does not validate
//!
//! A real campaign's surface-point accuracy: clocks, troposphere and Earth orientation are held
//! fixed on both sides, the stations and beacon site are illustrative, and the bound is a
//! Cramér-Rao bound for the beacon alone. Both sides read DE440, so agreement validates the
//! engine's geometry and linear algebra on DE440, not DE440 itself.
//!
//! ## Result (run after the pre-registration commit 4a51256 was published)
//!
//! **Both legs AGREE.** SPICE leg: the 16 observations identical; rank 3 and defect 0 on both
//! sides; eigenvalues within 5.9e-5 (6.1799e-3, 145.526 and 805.724 per square metre);
//! condition 130378 against 130386 (5.9e-5); beacon sigmas 12.6929, 0.081211 and 0.84104 m
//! against 12.6932, 0.081351 and 0.84159 m, the worst 1.7e-3 (the y sigma, bar 1e-2); RMS
//! 7.34445 against 7.34467 m (2.9e-5); lever arm 32.1974 (1.4e-8); computed over equipartition
//! 175.718 against 175.724 (2.9e-5). P2 leg: eigenvalues within 7.1e-16 of the largest, sigmas
//! within 3.9e-14. The Earth orientation kernel was the 2026-10-02 copy (SHA-256 54cdfdd1...);
//! the oracle toolchain was rebuilt on Python 3.12 with NumPy 2.3.5 and SciPy 1.18.1, the
//! versions the M069 generator pins, before this run.
//!
//! Mutation: transposing the body-frame rotation of the beacon partial in
//! `lunar_vlbi_fim::jacobian_row` fails the committed-Jacobian guard and, with that guard
//! removed for the experiment, the SPICE leg (y sigma 1.868 m against 0.0814 m, condition 1.42e4
//! against 1.30e5) and the P2 leg; reverted.
//!
//! Information only, not a pre-registered comparison: the same scenario on the analytic Moon
//! gives a y sigma of 0.078174 m, 3.9 % below this oracle, which is why the analytic row stays
//! MODELLED.

#[path = "support/fixture_pin.rs"]
mod fixture_pin;

use kshana::lunar_vlbi_fim::{schedule_jacobian, Datum, LunarVlbiFimScenario, StateLayout};

type J = serde_json::Value;

const DIR: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/lunar_vlbi_surface_point_spice_oracle/"
);
const KERNEL: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/lunar_vlbi_anise_oracle/kernels/de440s_2024-01-01.bsp"
);

fn scenario() -> LunarVlbiFimScenario {
    LunarVlbiFimScenario {
        datum: Some(Datum::AllStationsFixed.as_str().to_string()),
        estimate_beacon: Some(true),
        planetary_kernel_path: Some(KERNEL.to_string()),
        ..Default::default()
    }
}

fn fixture(name: &str) -> J {
    let path = format!("{DIR}{name}");
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

fn rel(a: f64, b: f64) -> f64 {
    (a - b).abs() / b.abs()
}

fn report() -> J {
    let (json, _) = scenario()
        .run_json()
        .expect("the kernel-path scenario runs");
    serde_json::from_str(&json).expect("report json")
}

/// The engine's observation set as `[epoch, station1, station2]` triples, and its Jacobian.
fn engine_schedule() -> (Vec<[usize; 3]>, Vec<Vec<f64>>) {
    let scn = scenario();
    let (geoms, obs) = scn.schedule().expect("schedule");
    let n_st = geoms[0].stations_inertial.len();
    let layout = StateLayout::new(n_st, &Datum::AllStationsFixed.held_fixed(n_st), true);
    let jac = schedule_jacobian(&geoms, &obs, &layout);
    (
        obs.iter()
            .map(|o| [o.epoch, o.station1, o.station2])
            .collect(),
        jac,
    )
}

/// Writes `inputs.json` for the oracle generator (run once, after pre-registration).
#[test]
#[ignore = "emitter, not a check: writes tests/fixtures/lunar_vlbi_surface_point_spice_oracle/inputs.json"]
fn zzz_emit_inputs() {
    let (obs, jac) = engine_schedule();
    let scn = scenario();
    let sigma = 1.0e-11;
    let v = serde_json::json!({
        "name": "all_stations_fixed_beacon_kernel",
        "epoch_utc": "2024-01-01T00:00:00",
        "n_epochs": 49,
        "step_min": 30.0,
        "elevation_mask_deg": 10.0,
        "delay_sigma_s": sigma,
        "rel_tol": 1.0e-9,
        "stations": kshana::lunar_vlbi_fim::DEFAULT_STATIONS
            .iter()
            .map(|&(_, lat, lon, alt)| [lat, lon, alt])
            .collect::<Vec<_>>(),
        "beacon_selenographic_deg_deg_m": [0.0, 0.0, 0.0],
        "engine_observations": obs,
        "engine_jacobian": jac,
        "weights": vec![1.0 / (sigma * sigma); obs.len()],
        "engine_kernel": "tests/fixtures/lunar_vlbi_anise_oracle/kernels/de440s_2024-01-01.bsp",
        "engine_kernel_sha256": scn.kernel().unwrap().unwrap().kernel_sha256(),
    });
    std::fs::create_dir_all(DIR).unwrap();
    std::fs::write(
        format!("{DIR}inputs.json"),
        serde_json::to_string_pretty(&v).unwrap() + "\n",
    )
    .unwrap();
}

/// The strict, pre-registered comparison: the binding SPICE leg and the P2 leg.
#[test]
fn surface_point_covariance_kernel_path_matches_spice_geometry_and_numpy() {
    let inputs = fixture("inputs.json");
    let reference = fixture("reference.json");
    let v = report();
    assert_eq!(
        v.pointer("/moon_ephemeris/source").and_then(J::as_str),
        Some("kernel")
    );

    // The engine still builds the committed inputs.
    let (obs, jac) = engine_schedule();
    let committed: Vec<Vec<f64>> = inputs["engine_jacobian"]
        .as_array()
        .unwrap()
        .iter()
        .map(fv)
        .collect();
    // Within 1e-12 of each row's scale: the Jacobian moves in the last bits between hosts'
    // libms (issue #36). See `support/fixture_pin.rs`.
    if let Err(e) =
        fixture_pin::check_rows_scaled(&jac, &committed, fixture_pin::NEAR_BIT, "engine_jacobian")
    {
        panic!("the engine no longer builds the committed Jacobian: {e}");
    }

    // SPICE leg (binding).
    let s = &reference["spice"];
    let spice_obs: Vec<[usize; 3]> = s["observations"]
        .as_array()
        .unwrap()
        .iter()
        .map(|o| {
            let a = fv(o);
            [a[0] as usize, a[1] as usize, a[2] as usize]
        })
        .collect();
    assert_eq!(obs, spice_obs, "observation sets differ");
    let fim = &v["fim"];
    assert_eq!(f(&fim["rank"]), f(&s["rank"]), "rank");
    assert_eq!(f(&fim["defect"]), f(&s["defect"]), "defect");
    let mut worst: Vec<(String, f64, f64)> = Vec::new();
    let check =
        |worst: &mut Vec<(String, f64, f64)>, label: &str, got: f64, want: f64, tol: f64| {
            let r = rel(got, want);
            println!("{label:<34} engine {got:.6e}  oracle {want:.6e}  rel {r:.3e}  bar {tol:.0e}");
            worst.push((label.to_string(), r, tol));
        };
    for (k, (g, w)) in fv(&fim["eigenvalues_per_m2"])
        .iter()
        .zip(fv(&s["eigenvalues"]))
        .enumerate()
    {
        check(&mut worst, &format!("eigenvalue {k}"), *g, w, 1e-2);
    }
    check(
        &mut worst,
        "condition number",
        f(&fim["condition_number"]),
        f(&s["condition"]),
        1e-2,
    );
    for (k, (g, w)) in fv(&v["station_covariance"]["sigma_m"])
        .iter()
        .zip(fv(&s["sigma"]))
        .enumerate()
    {
        check(&mut worst, &format!("beacon sigma {k}"), *g, w, 1e-2);
    }
    let bl = &v["beacon_link"];
    check(
        &mut worst,
        "beacon RMS sigma",
        f(&bl["computed_per_coordinate_sigma_m"]),
        f(&s["rms_beacon_sigma_m"]),
        1e-2,
    );
    check(
        &mut worst,
        "lever arm range/baseline",
        f(&bl["lever_arm_range_over_baseline"]),
        f(&s["lever_arm"]),
        1e-4,
    );
    check(
        &mut worst,
        "computed/equipartition",
        f(&bl["ratio_computed_over_equipartition"]),
        f(&s["ratio_computed_over_equipartition"]),
        1e-2,
    );

    // P2 leg.
    let p = &reference["p2"];
    assert_eq!(f(&fim["rank"]), f(&p["rank"]), "P2 rank");
    assert_eq!(f(&fim["defect"]), f(&p["defect"]), "P2 defect");
    let lam = fv(&fim["eigenvalues_per_m2"]);
    let lmax = lam.iter().cloned().fold(0.0_f64, f64::max);
    for (k, (g, w)) in lam.iter().zip(fv(&p["eigenvalues"])).enumerate() {
        let r = (g - w).abs() / lmax;
        println!("P2 eigenvalue {k:<20} rel-to-largest {r:.3e}  bar 1e-9");
        worst.push((format!("P2 eigenvalue {k}"), r, 1e-9));
    }
    for (k, (g, w)) in fv(&v["station_covariance"]["sigma_m"])
        .iter()
        .zip(fv(&p["sigma"]))
        .enumerate()
    {
        check(&mut worst, &format!("P2 beacon sigma {k}"), *g, w, 1e-9);
    }
    let bad: Vec<_> = worst.iter().filter(|(_, r, t)| r > t).collect();
    assert!(bad.is_empty(), "outside the bar: {bad:?}");
}
