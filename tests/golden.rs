use std::fs;

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
