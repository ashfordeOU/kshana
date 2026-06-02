use std::fs;

// ---------------------------------------------------------------------------
// Pinned golden numerics
//
// The engine is fully deterministic (ChaCha8 streams keyed by the scenario
// seed), so every figure of merit is reproducible to the bit on a given
// platform. These tests pin the EXACT values for the reference scenarios so a
// silent regression — a changed model coefficient, a reordered RNG draw, an
// off-by-one in a loop — is caught immediately, not just gross "quantum beats
// classical" inversions. The relative tolerance below absorbs only last-few-ULP
// libm divergence between platforms (sqrt/ln/exp on the noise path), which is
// ~1e-15; a real regression moves a value by whole percent and trips the gate.
// Cross-platform byte-identical hashing is a separate, CI-observed concern
// (see scripts/check-reproducible.sh and the reproducibility roadmap item).
// ---------------------------------------------------------------------------

/// Relative tolerance for noise-driven floating fields: tight enough to catch
/// any algorithmic regression, loose enough for cross-platform libm jitter.
const GOLDEN_REL: f64 = 1e-6;

#[track_caller]
fn assert_pinned(got: f64, want: f64, name: &str) {
    if want == 0.0 {
        assert!(got.abs() < 1e-12, "{name}: got {got:e}, pinned exactly 0");
        return;
    }
    let rel = (got - want).abs() / want.abs();
    assert!(
        rel < GOLDEN_REL,
        "{name}: got {got:.17e}, pinned {want:.17e}, rel={rel:.3e} (> {GOLDEN_REL:e})"
    );
}

#[test]
fn golden_clock_holdover_fom_is_pinned() {
    let src = fs::read_to_string("scenarios/clock-holdover.toml").unwrap();
    let scn: kshana::scenario::Scenario = toml::from_str(&src).unwrap();
    let r = kshana::run::run(&scn);

    // Scenario hash is content-addressed and platform-independent.
    assert_eq!(
        r.scenario_hash, "5ba83a232b94e902273fb6dcb71dd27d8109401dc8834d0a735eebf230ed5378",
        "scenario hash drifted"
    );

    let q = &r.quantum.fom;
    assert_pinned(
        q.timing_rms_ns,
        5.467_934_347_107_748e-5,
        "quantum.timing_rms_ns",
    );
    assert_pinned(
        q.timing_p95_ns,
        1.204_818_590_220_607_7e-4,
        "quantum.timing_p95_ns",
    );
    assert_eq!(q.holdover_s, 6600.0, "quantum.holdover_s"); // grid-bounded, exact
    assert_pinned(
        q.resilience_slope_ns_per_s,
        1.240_071_296_100_355_7e-8,
        "quantum.resilience_slope_ns_per_s",
    );
    assert_eq!(q.availability, 1.0, "quantum.availability");
    assert_pinned(q.integrity.unwrap(), 1.0, "quantum.integrity");
    assert_pinned(
        q.security.unwrap(),
        0.996_772_508_068_690_7,
        "quantum.security",
    );

    let c = &r.classical.fom;
    assert_pinned(
        c.timing_rms_ns,
        1.133_358_364_577_119_7e1,
        "classical.timing_rms_ns",
    );
    assert_pinned(
        c.timing_p95_ns,
        1.967_489_798_037_763_3e1,
        "classical.timing_p95_ns",
    );
    assert_eq!(c.holdover_s, 2610.0, "classical.holdover_s");
    assert_pinned(
        c.resilience_slope_ns_per_s,
        6.065_874_490_366_088e-4,
        "classical.resilience_slope_ns_per_s",
    );
    assert_pinned(
        c.availability,
        9.556_171_983_356_45e-1,
        "classical.availability",
    );
    assert_pinned(c.integrity.unwrap(), 1.0, "classical.integrity");
    assert_eq!(c.security.unwrap(), 0.0, "classical.security"); // no attack configured
}

#[test]
fn golden_imu_deadreckoning_fom_is_pinned() {
    let src = fs::read_to_string("scenarios/imu-deadreckoning.toml").unwrap();
    let scn: kshana::inertial::InertialScenario = toml::from_str(&src).unwrap();
    let r = kshana::inertial::run_inertial(&scn);

    let q = &r.quantum.fom;
    assert_pinned(
        q.pos_rms_m,
        2.070_176_094_508_318e1,
        "imu.quantum.pos_rms_m",
    );
    assert_pinned(
        q.pos_p95_m,
        4.138_527_497_987_895e1,
        "imu.quantum.pos_p95_m",
    );
    assert_eq!(q.holdover_s, 6600.0, "imu.quantum.holdover_s");

    let c = &r.classical.fom;
    assert_pinned(
        c.pos_rms_m,
        1.518_915_154_251_42e4,
        "imu.classical.pos_rms_m",
    );
    assert_pinned(
        c.pos_p95_m,
        3.062_985_274_202_147_4e4,
        "imu.classical.pos_p95_m",
    );
    assert_eq!(c.holdover_s, 350.0, "imu.classical.holdover_s");
}

#[test]
fn golden_timetransfer_fom_is_pinned() {
    let src = fs::read_to_string("scenarios/timetransfer.toml").unwrap();
    let scn: kshana::timetransfer::TimeTransferScenario = toml::from_str(&src).unwrap();
    let r = kshana::timetransfer::run_timetransfer(&scn);

    let q = &r.quantum.fom;
    assert_pinned(
        q.sync_p95_ps,
        1.894_345_167_131_458_8e0,
        "tt.quantum.sync_p95_ps",
    );
    assert_pinned(
        q.range_rms_mm,
        2.893_800_897_571_821_6e-1,
        "tt.quantum.range_rms_mm",
    );
    assert_eq!(
        q.within_spec_fraction, 1.0,
        "tt.quantum.within_spec_fraction"
    );

    let c = &r.classical.fom;
    assert_pinned(
        c.sync_p95_ps,
        9.655_879_350_991_686e2,
        "tt.classical.sync_p95_ps",
    );
    assert_pinned(
        c.range_rms_mm,
        1.524_906_480_921_621_6e2,
        "tt.classical.range_rms_mm",
    );
    assert_pinned(
        c.within_spec_fraction,
        5.833_333_333_333_334e-2,
        "tt.classical.within_spec_fraction",
    );
}

#[test]
fn golden_hybrid_pnt_fom_is_pinned() {
    let src = fs::read_to_string("scenarios/hybrid-pnt.toml").unwrap();
    let scn: kshana::hybrid::HybridScenario = toml::from_str(&src).unwrap();
    let r = kshana::hybrid::run_hybrid(&scn);

    let q = &r.quantum.fom;
    assert_eq!(q.pnt_holdover_s, 6600.0, "hyb.quantum.pnt_holdover_s");
    assert_eq!(q.pnt_availability, 1.0, "hyb.quantum.pnt_availability");
    assert_eq!(q.timing_holdover_s, 6600.0, "hyb.quantum.timing_holdover_s");
    assert_eq!(
        q.position_holdover_s, 6600.0,
        "hyb.quantum.position_holdover_s"
    );

    let c = &r.classical.fom;
    assert_eq!(c.pnt_holdover_s, 350.0, "hyb.classical.pnt_holdover_s");
    assert_pinned(
        c.pnt_availability,
        1.317_614_424_410_541e-1,
        "hyb.classical.pnt_availability",
    );
    assert_eq!(
        c.timing_holdover_s, 6600.0,
        "hyb.classical.timing_holdover_s"
    );
    assert_eq!(
        c.position_holdover_s, 350.0,
        "hyb.classical.position_holdover_s"
    );
}

#[test]
fn reference_scenario_quantum_beats_classical() {
    let src = fs::read_to_string("scenarios/clock-holdover.toml").unwrap();
    let scn: kshana::scenario::Scenario = toml::from_str(&src).unwrap();
    let r = kshana::run::run(&scn);
    assert!(r.quantum.fom.timing_p95_ns < r.classical.fom.timing_p95_ns);
    assert!(r.quantum.fom.holdover_s >= r.classical.fom.holdover_s);
}

#[test]
fn run_is_reproducible() {
    let src = fs::read_to_string("scenarios/clock-holdover.toml").unwrap();
    let scn: kshana::scenario::Scenario = toml::from_str(&src).unwrap();
    let a = serde_json::to_string(&kshana::run::run(&scn)).unwrap();
    let b = serde_json::to_string(&kshana::run::run(&scn)).unwrap();
    assert_eq!(a, b);
}

#[test]
fn imu_scenario_quantum_beats_classical() {
    let src = std::fs::read_to_string("scenarios/imu-deadreckoning.toml").unwrap();
    let scn: kshana::inertial::InertialScenario = toml::from_str(&src).unwrap();
    let r = kshana::inertial::run_inertial(&scn);
    assert!(r.quantum.fom.pos_p95_m < r.classical.fom.pos_p95_m);
    assert!(r.quantum.fom.holdover_s >= r.classical.fom.holdover_s);
}

#[test]
fn lab_sr_scenario_runs_and_beats_classical() {
    let src = std::fs::read_to_string("scenarios/clock-holdover-labsr.toml").unwrap();
    let scn: kshana::scenario::Scenario = toml::from_str(&src).unwrap();
    let r = kshana::run::run(&scn);
    assert!(r.quantum.fom.timing_p95_ns < r.classical.fom.timing_p95_ns);
    assert!(r.quantum.fom.holdover_s >= r.classical.fom.holdover_s);
}

#[test]
fn timetransfer_optical_beats_rf() {
    let src = std::fs::read_to_string("scenarios/timetransfer.toml").unwrap();
    let scn: kshana::timetransfer::TimeTransferScenario = toml::from_str(&src).unwrap();
    let r = kshana::timetransfer::run_timetransfer(&scn);
    assert!(r.quantum.fom.sync_p95_ps < r.classical.fom.sync_p95_ps);
    assert!(r.quantum.fom.range_rms_mm < r.classical.fom.range_rms_mm);
    assert!(r.quantum.fom.within_spec_fraction >= r.classical.fom.within_spec_fraction);
}

#[test]
fn hybrid_quantum_suite_outlasts_classical() {
    let src = std::fs::read_to_string("scenarios/hybrid-pnt.toml").unwrap();
    let scn: kshana::hybrid::HybridScenario = toml::from_str(&src).unwrap();
    let r = kshana::hybrid::run_hybrid(&scn);
    assert!(r.quantum.fom.pnt_holdover_s > r.classical.fom.pnt_holdover_s);
    assert!(r.quantum.fom.pnt_availability >= r.classical.fom.pnt_availability);
    // Fusion check: with optical ISL aiding, the classical clock's TIMING holds far
    // longer than its position (position is the classical suite's limiter).
    assert!(r.classical.fom.timing_holdover_s >= r.classical.fom.position_holdover_s);
}
