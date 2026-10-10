// SPDX-License-Identifier: AGPL-3.0-only
//! The fixture-pin tolerances of issue #36 (`support/fixture_pin.rs`) still catch a real change.
//!
//! Each oracle test that pins the engine's inputs to a committed fixture now compares within
//! 1e-12 of a scale taken from the fixture, instead of bit for bit. On the committed fixtures
//! themselves, this test shows three things:
//!
//! 1. a host difference of the size macOS arm64 showed (up to 5e-15 of the scale) is accepted,
//!    here simulated at twice that on every float;
//! 2. a 1e-6 relative change of one entry is rejected, made at the loosest point of the
//!    fixture: the entry with the smallest |entry| / row scale, where a row-scaled bar admits the
//!    largest relative change. An entry below 1e-6 of its row's scale is effectively unpinned
//!    (a 1e-6 change of it is at most the 1e-12 bar); none of the committed fixtures has one;
//! 3. a change to an integer, a key or a length is rejected exactly as before.

#[path = "support/fixture_pin.rs"]
mod fixture_pin;

use fixture_pin::{check_json, check_rows_scaled, max_abs, NEAR_BIT};
use serde_json::Value;

/// The size of the host difference simulated in (1), as a fraction of the row scale.
const HOST_NOISE: f64 = 1e-14;

fn load(path: &str) -> Value {
    serde_json::from_str(
        &std::fs::read_to_string(path).unwrap_or_else(|e| panic!("read {path}: {e}")),
    )
    .unwrap_or_else(|e| panic!("parse {path}: {e}"))
}

/// Calls `f` on every innermost array of non-integer numbers in `v` (a row), in document order.
fn for_each_row(v: &mut Value, f: &mut dyn FnMut(&mut Vec<Value>)) {
    match v {
        Value::Array(a) => {
            let numeric = !a.is_empty()
                && a.iter().all(Value::is_number)
                && !a.iter().all(|x| x.is_i64() || x.is_u64());
            if numeric {
                f(a);
            } else {
                for x in a {
                    for_each_row(x, f);
                }
            }
        }
        Value::Object(o) => {
            for x in o.values_mut() {
                for_each_row(x, f);
            }
        }
        _ => {}
    }
}

fn row_floats(row: &[Value]) -> Vec<f64> {
    row.iter().map(|x| x.as_f64().expect("f64")).collect()
}

/// (1): every float moved by `HOST_NOISE` of its row's scale, alternating in sign.
fn with_host_noise(v: &Value) -> Value {
    let mut out = v.clone();
    for_each_row(&mut out, &mut |row| {
        let scale = max_abs(&row_floats(row));
        for (i, x) in row.iter_mut().enumerate() {
            let s = if i % 2 == 0 { 1.0 } else { -1.0 };
            *x = Value::from(x.as_f64().expect("f64") + s * HOST_NOISE * scale);
        }
    });
    out
}

/// (2): the loosest point of the document, times `1 + 1e-6`. A point is loosest when its
/// |entry| / row scale is smallest over every nonzero entry of every row with a nonzero scale:
/// there a row-scaled bar admits the largest relative change.
fn with_one_real_change(v: &Value) -> Value {
    let mut out = v.clone();
    let mut loosest: Option<(usize, usize, f64)> = None;
    let mut r = 0;
    for_each_row(&mut out, &mut |row| {
        let xs = row_floats(row);
        let scale = max_abs(&xs);
        if scale > 0.0 {
            for (i, x) in xs.iter().enumerate().filter(|(_, x)| **x != 0.0) {
                let rel = x.abs() / scale;
                if loosest.is_none_or(|(_, _, best)| rel < best) {
                    loosest = Some((r, i, rel));
                }
            }
        }
        r += 1;
    });
    let (target, idx, _) = loosest.expect("a nonzero entry in a nonzero row");
    let mut n = 0;
    for_each_row(&mut out, &mut |row| {
        if n == target {
            let x = row[idx].as_f64().expect("f64");
            row[idx] = Value::from(x * (1.0 + 1e-6));
        }
        n += 1;
    });
    out
}

fn assert_tolerance_discriminates(name: &str, fixture: &Value) {
    check_json(fixture, fixture, NEAR_BIT, name).expect("identical");
    check_json(&with_host_noise(fixture), fixture, NEAR_BIT, name)
        .unwrap_or_else(|e| panic!("{name}: host-sized noise rejected: {e}"));
    assert!(
        check_json(&with_one_real_change(fixture), fixture, NEAR_BIT, name).is_err(),
        "{name}: a 1e-6 relative change of one entry was accepted"
    );
}

/// The three frame-campaign `engine_inputs_match_the_committed_fixture` pins (`check_json`).
#[test]
fn frame_campaign_input_pins_reject_a_real_change() {
    for t in [
        "lunar_frame_campaign_mpmath_oracle",
        "lunar_frame_campaign_rank_mpmath_oracle",
        "lunar_frame_campaign_srif_mpmath_oracle",
    ] {
        let doc = load(&format!("tests/fixtures/{t}/inputs.json"));
        let scenarios = &doc["scenarios"];
        assert_tolerance_discriminates(t, scenarios);

        // (3) Structure still compares exactly.
        let mut renamed = scenarios.clone();
        let first = renamed[0].as_object_mut().expect("scenario object");
        let key = first.keys().next().expect("a key").clone();
        let v = first.remove(&key).expect("value");
        first.insert(format!("{key}_renamed"), v);
        assert!(check_json(&renamed, scenarios, NEAR_BIT, t).is_err());
        let mut shorter = scenarios.clone();
        shorter.as_array_mut().expect("scenarios").pop();
        assert!(check_json(&shorter, scenarios, NEAR_BIT, t).is_err());
    }
}

/// The VLBI Jacobian pins (`check_rows_scaled`), on every committed engine Jacobian.
#[test]
fn vlbi_jacobian_pins_reject_a_real_change() {
    fn jacobians(v: &Value, out: &mut Vec<Value>) {
        match v {
            Value::Object(o) => {
                for (k, x) in o {
                    if k == "engine_jacobian" {
                        out.push(x.clone());
                    } else {
                        jacobians(x, out);
                    }
                }
            }
            Value::Array(a) => a.iter().for_each(|x| jacobians(x, out)),
            _ => {}
        }
    }
    fn mat(v: &Value) -> Vec<Vec<f64>> {
        v.as_array()
            .expect("rows")
            .iter()
            .map(|r| row_floats(r.as_array().expect("row")))
            .collect()
    }
    let mut found = 0;
    for path in [
        "tests/fixtures/lunar_vlbi_campaign_spice_oracle/inputs.json",
        "tests/fixtures/lunar_vlbi_surface_point_spice_oracle/inputs.json",
    ] {
        let mut js = Vec::new();
        jacobians(&load(path), &mut js);
        for j in js {
            found += 1;
            let committed = mat(&j);
            check_rows_scaled(&mat(&with_host_noise(&j)), &committed, NEAR_BIT, path)
                .unwrap_or_else(|e| panic!("{path}: host-sized noise rejected: {e}"));
            assert!(
                check_rows_scaled(&mat(&with_one_real_change(&j)), &committed, NEAR_BIT, path)
                    .is_err(),
                "{path}: a 1e-6 relative change of one entry was accepted"
            );
            let mut short = committed.clone();
            short[0].pop();
            assert!(check_rows_scaled(&short, &committed, NEAR_BIT, path).is_err());
        }
    }
    assert_eq!(found, 9, "the committed VLBI Jacobians");
}

/// The launch-azimuth pin (`check_azimuths`): a host-sized difference is accepted, including the
/// 3.18e-9 rad one the ill-conditioned tangent row showed on macOS; a 1e-6 change, an
/// ascending/descending swap and a quadrant error on a non-tangent row are rejected.
#[test]
fn launch_azimuth_pin_rejects_a_real_change() {
    use fixture_pin::check_azimuths;
    let fed = [2.0943951023931957, 1.0471975511965976]; // asc, desc at lat 0, i 60 deg: not tangent
    let noisy = [fed[0] + 4.0 * f64::EPSILON, fed[1] - 4.0 * f64::EPSILON];
    check_azimuths(&noisy, &fed, NEAR_BIT, "az").expect("host-sized noise");
    let changed = [fed[0], fed[1] * (1.0 + 1e-6)];
    assert!(check_azimuths(&changed, &fed, NEAR_BIT, "az").is_err());
    let swapped = [fed[1], fed[0]];
    assert!(check_azimuths(&swapped, &fed, NEAR_BIT, "az").is_err());
    let reflected = [std::f64::consts::TAU - fed[0], fed[1]];
    assert!(check_azimuths(&reflected, &fed, NEAR_BIT, "az").is_err());
    let wrapped = [fed[0] + std::f64::consts::TAU, fed[1]];
    assert!(check_azimuths(&wrapped, &fed, NEAR_BIT, "az").is_err());
    assert!(check_azimuths(&fed[..1], &fed, NEAR_BIT, "az").is_err());

    // The tangent row of issue #36 (lat -60, i 120): the Linux fixture and the macOS values.
    let linux = [4.712389016884931, 4.712388943884449];
    let mac = [4.7123890137046995, 4.71238894706468];
    check_azimuths(&mac, &linux, NEAR_BIT, "tangent").expect("one ulp of s on a tangent row");
}

/// Over every committed `INC` row: the engine-free parts of the pin. Each fixture pair is
/// accepted against itself and against 4 ulp of noise; a swapped pair is rejected exactly where
/// the branches differ (|cos az| above the branch threshold); a 1e-6 rad change of an
/// azimuth is rejected wherever it changes `sin az` by more than the bar (|cos az| above 1e-5).
#[test]
fn launch_azimuth_pin_on_every_committed_row() {
    use fixture_pin::{check_azimuths, BRANCH_COS_MIN};
    let text = std::fs::read_to_string(
        "tests/fixtures/launch_geometry_orekit_oracle/launch_geometry_orekit_oracle.txt",
    )
    .expect("fixture");
    let (mut rows, mut swap_checked, mut tangent) = (0, 0, 0);
    for line in text.lines().filter(|l| l.starts_with("INC ")) {
        let az: Vec<f64> = line
            .split('|')
            .nth(1)
            .expect("azimuth field")
            .split_whitespace()
            .map(|t| t.parse().expect("f64"))
            .collect();
        let fed = [az[0], az[1]];
        rows += 1;
        check_azimuths(&fed, &fed, NEAR_BIT, "row").expect("identical");
        let noisy = [fed[0] + 4.0 * f64::EPSILON, fed[1] - 4.0 * f64::EPSILON];
        check_azimuths(&noisy, &fed, NEAR_BIT, "row").expect("host-sized noise");
        let swapped = [fed[1], fed[0]];
        let branches_differ = fed[0].cos().abs() > BRANCH_COS_MIN;
        if branches_differ {
            swap_checked += 1;
            assert!(
                check_azimuths(&swapped, &fed, NEAR_BIT, "row").is_err(),
                "swapped asc/desc accepted: {line}"
            );
            // sin is shared by az and pi - az, so only the branch check can reject this.
            assert!((swapped[0].sin() - fed[0].sin()).abs() < 1e-12);
            if fed[0].cos().abs() > 1e-5 {
                // 1e-6 rad moves sin az by cos az * 1e-6, above the 1e-12 bar from |cos az| = 1e-5.
                let changed = [fed[0] + 1e-6, fed[1]];
                assert!(
                    check_azimuths(&changed, &fed, NEAR_BIT, "row").is_err(),
                    "1e-6 rad change accepted: {line}"
                );
            }
        } else {
            tangent += 1;
        }
    }
    assert!(rows > 100, "rows {rows}");
    assert!(swap_checked > 0 && tangent > 0, "{swap_checked} {tangent}");
}
