// SPDX-License-Identifier: AGPL-3.0-only
//! Comparison for the "the engine still builds the committed fixture" pins of the oracle tests.
//!
//! An oracle test feeds the oracle inputs that Kshana built (a Jacobian, a state table, an
//! azimuth) and commits them with the oracle's reference. A pin then checks that the engine
//! still builds those inputs, so the fixture cannot drift from the code. That pin is a drift
//! guard, not the oracle comparison: the pre-registered bars compare the engine's results with
//! the oracle's and are not touched by anything here.
//!
//! Pinned bit for bit, those inputs fail on a host whose libm rounds a transcendental
//! differently (issue #36: ten pins on macOS arm64, against fixtures written on Linux x86-64,
//! by 2 to a few thousand units in the last place; see `support/mod.rs` for why that happens).
//! These helpers compare within a stated tolerance instead. Every tolerance is a fraction of a
//! scale taken from the committed fixture, never of the value being checked, so a quantity
//! cannot widen its own bar by growing. Integers and every non-numeric value still compare
//! exactly, as do array lengths and object keys.
//!
//! `tests/fixture_pin_tolerance.rs` mutates the committed fixtures to show that a real change
//! still fails each pin.
#![allow(dead_code)]

use serde_json::Value;

/// The near-bit tolerance: 1e-12 of the scale, about 4500 units in the last place. The largest
/// platform difference issue #36 measured on these pins is 5e-15 of the scale.
pub const NEAR_BIT: f64 = 1e-12;

/// The largest magnitude in `xs`.
pub fn max_abs(xs: &[f64]) -> f64 {
    xs.iter().fold(0.0_f64, |m, x| m.max(x.abs()))
}

/// Is `now` within `tol` of `fixture`? Equal values (both NaN included) always are.
fn within(now: f64, fixture: f64, tol: f64) -> bool {
    if now.is_nan() || fixture.is_nan() {
        return now.is_nan() && fixture.is_nan();
    }
    now == fixture || (now - fixture).abs() <= tol
}

/// Every entry of `now` within `k * max|fixture|` of the fixture's, the scale taken over the
/// whole slice (a row or a vector).
pub fn check_scaled(now: &[f64], fixture: &[f64], k: f64, what: &str) -> Result<(), String> {
    if now.len() != fixture.len() {
        return Err(format!(
            "{what}: length {} vs fixture {}",
            now.len(),
            fixture.len()
        ));
    }
    let tol = k * max_abs(fixture);
    for (i, (&a, &b)) in now.iter().zip(fixture).enumerate() {
        if !within(a, b, tol) {
            return Err(format!(
                "{what}[{i}]: {a:e} vs fixture {b:e}, |Δ| {:e} > {k:e} × scale {:e}",
                (a - b).abs(),
                max_abs(fixture)
            ));
        }
    }
    Ok(())
}

/// An azimuth with `|cos az|` at or below this in the fixture is tangent (az near 90 or 270 deg),
/// where the ascending and descending branches coincide and the sign of the cosine is not a
/// property of the azimuth.
pub const BRANCH_COS_MIN: f64 = 1e-6;

/// Launch azimuths (rad, in `[0, 2π)`) from `asin(cos i / cos lat)` against the fixture's.
///
/// An azimuth is not compared directly. `asin` has slope `1 / sqrt(1 - s²)`, so where
/// `s = cos i / cos lat` is within a few ulps of ±1 (an inclination equal to the site's
/// colatitude, az = 90 or 270 deg) one ulp of `s`, from a host's libm, moves the azimuth by
/// about 3e-9 rad (issue #36: lat -60, i 120). The pin therefore compares what the formula
/// defines, `sin az`, within `k` (the sine is bounded by 1, so `k` is also its relative scale),
/// and the branch separately: wherever the fixture has `|cos az| > BRANCH_COS_MIN`, the sign of
/// `cos az` must match, which tells an ascending azimuth from a descending one and catches a
/// quadrant error that `sin az` alone cannot. Each azimuth must also lie in `[0, 2π)`.
pub fn check_azimuths(now: &[f64], fixture: &[f64], k: f64, what: &str) -> Result<(), String> {
    if now.len() != fixture.len() {
        return Err(format!(
            "{what}: length {} vs fixture {}",
            now.len(),
            fixture.len()
        ));
    }
    for (i, (&a, &b)) in now.iter().zip(fixture).enumerate() {
        if !(0.0..std::f64::consts::TAU).contains(&a) {
            return Err(format!("{what}[{i}]: {a:e} is outside [0, 2π)"));
        }
        let (sa, sb) = (a.sin(), b.sin());
        if !within(sa, sb, k) {
            return Err(format!(
                "{what}[{i}]: sin az {sa:e} vs fixture {sb:e}, |Δ| {:e} > {k:e}",
                (sa - sb).abs()
            ));
        }
        let (ca, cb) = (a.cos(), b.cos());
        if cb.abs() > BRANCH_COS_MIN && ca.signum() != cb.signum() {
            return Err(format!(
                "{what}[{i}]: cos az {ca:e} has the opposite sign to the fixture's {cb:e} (branch)"
            ));
        }
    }
    Ok(())
}

/// Every row of `now` within `k` of the fixture's row scale ([`check_scaled`] per row).
pub fn check_rows_scaled(
    now: &[Vec<f64>],
    fixture: &[Vec<f64>],
    k: f64,
    what: &str,
) -> Result<(), String> {
    if now.len() != fixture.len() {
        return Err(format!(
            "{what}: {} rows vs fixture {}",
            now.len(),
            fixture.len()
        ));
    }
    for (i, (a, b)) in now.iter().zip(fixture).enumerate() {
        check_scaled(a, b, k, &format!("{what}[{i}]"))?;
    }
    Ok(())
}

/// The floats of a JSON array whose every element is a non-integer number, if it is one.
fn float_row(v: &[Value]) -> Option<Vec<f64>> {
    if v.is_empty() || !v.iter().all(|x| x.is_number()) || v.iter().all(is_integer) {
        return None;
    }
    v.iter().map(Value::as_f64).collect()
}

fn is_integer(v: &Value) -> bool {
    v.is_i64() || v.is_u64()
}

/// Two JSON documents the same, except that the numbers of each innermost numeric array (a row)
/// may differ by `k` times that row's largest fixture magnitude, and a lone number by `k` times
/// its own fixture magnitude. Structure, keys, strings, booleans, nulls, integers and lengths
/// compare exactly.
pub fn check_json(now: &Value, fixture: &Value, k: f64, path: &str) -> Result<(), String> {
    match (now, fixture) {
        (Value::Object(a), Value::Object(b)) => {
            let (ka, kb): (Vec<_>, Vec<_>) = (a.keys().collect(), b.keys().collect());
            if ka != kb {
                return Err(format!("{path}: keys {ka:?} vs fixture {kb:?}"));
            }
            for (key, x) in a {
                check_json(x, &b[key], k, &format!("{path}.{key}"))?;
            }
            Ok(())
        }
        (Value::Array(a), Value::Array(b)) => {
            if a.len() != b.len() {
                return Err(format!("{path}: length {} vs fixture {}", a.len(), b.len()));
            }
            if let (Some(x), Some(y)) = (float_row(a), float_row(b)) {
                return check_scaled(&x, &y, k, path);
            }
            for (i, (x, y)) in a.iter().zip(b).enumerate() {
                check_json(x, y, k, &format!("{path}[{i}]"))?;
            }
            Ok(())
        }
        (Value::Number(_), Value::Number(_)) if !(is_integer(now) || is_integer(fixture)) => {
            check_scaled(
                &[now.as_f64().expect("f64")],
                &[fixture.as_f64().expect("f64")],
                k,
                path,
            )
        }
        _ if now == fixture => Ok(()),
        _ => Err(format!("{path}: {now} vs fixture {fixture}")),
    }
}
