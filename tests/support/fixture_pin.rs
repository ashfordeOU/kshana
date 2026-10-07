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

/// The tolerance for the lunar network's finite-difference measurement Jacobians, as a fraction
/// of the largest magnitude in the matrix (1e6, the parameter-scale column).
///
/// Those Jacobians are central differences with a step of 1e-6 (`fd_jacobian` in
/// `lunar_combination.rs` and `batch_ls.rs`), of a forward model that subtracts Earth-Moon
/// distances of about 4e8 m. One unit in the last place there is 5.96e-8 m, and the difference
/// quotient divides it by `2 × 1e-6`, so a last-bit change in the forward model moves a Jacobian
/// entry by 0.0298 whatever its size. That is exactly what macOS arm64 showed (issue #36): 0.0298
/// and 0.0596, one and two such units, on entries of 1.6e4 to 6.5e5. The bar, 2e-7 of 1e6 = 0.2,
/// is about seven units; a 1e-6 relative change of the matrix moves its largest entry by 1.0
/// and fails.
pub const FD_CANCELLATION: f64 = 2e-7;

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

/// Every entry of `now` within `k * max|fixture|`, the scale taken over the whole matrix.
pub fn check_matrix_scaled(
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
    let scale = fixture.iter().fold(0.0_f64, |m, r| m.max(max_abs(r)));
    for (i, (a, b)) in now.iter().zip(fixture).enumerate() {
        if a.len() != b.len() {
            return Err(format!(
                "{what}[{i}]: length {} vs fixture {}",
                a.len(),
                b.len()
            ));
        }
        for (j, (&x, &y)) in a.iter().zip(b).enumerate() {
            if !within(x, y, k * scale) {
                return Err(format!(
                    "{what}[{i}][{j}]: {x:e} vs fixture {y:e}, |Δ| {:e} > {k:e} × matrix scale {scale:e}",
                    (x - y).abs()
                ));
            }
        }
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
