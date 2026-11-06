// SPDX-License-Identifier: AGPL-3.0-only
//! # C ABI for the Kshana engine (roadmap A5b)
//!
//! A small, stable C interface over the `kshana` library, for C, C++, Go (cgo), Java (Panama/JNA),
//! MATLAB, LabVIEW and anything else that can call a C function. The header is
//! `include/kshana.h`; the safety argument is `SAFETY.md`.
//!
//! Rules every function keeps:
//! * Strings in are NUL-terminated UTF-8; a null pointer or invalid UTF-8 is refused with
//!   [`KSHANA_BAD_ARGUMENT`], never read past.
//! * Strings out are allocated here and freed only by [`kshana_string_free`]. An out-pointer is
//!   always written (null when there is nothing), so the caller can free unconditionally.
//! * No panic crosses the boundary: every call runs inside `catch_unwind`, and a panic is reported as
//!   [`KSHANA_INTERNAL`] with a message.
//! * Calls hold no global state and may run from many threads at once.
#![deny(unsafe_op_in_unsafe_fn)]
#![warn(missing_docs)]

use std::ffi::{c_char, c_int, CStr, CString};
use std::panic::{catch_unwind, AssertUnwindSafe};

/// The call succeeded.
pub const KSHANA_OK: c_int = 0;
/// The engine refused the input (the error string says why).
pub const KSHANA_ERROR: c_int = 1;
/// A null pointer, or a string that is not UTF-8.
pub const KSHANA_BAD_ARGUMENT: c_int = 2;
/// An internal failure (a panic was caught); please report it.
pub const KSHANA_INTERNAL: c_int = 3;

/// Inputs above this many bytes are refused (each string separately).
pub const KSHANA_MAX_INPUT_BYTES: usize = 64 << 20;

static VERSION: &str = concat!(env!("CARGO_PKG_VERSION"), "\0");

/// Read a C string. `None` for null, non-UTF-8, or more than the input cap.
///
/// # Safety
/// `p` is null or points to a NUL-terminated string that stays valid for the call.
unsafe fn arg<'a>(p: *const c_char) -> Option<&'a str> {
    if p.is_null() {
        return None;
    }
    // SAFETY: the caller promises a valid NUL-terminated string (see the function's contract).
    let s = unsafe { CStr::from_ptr(p) };
    if s.to_bytes().len() > KSHANA_MAX_INPUT_BYTES {
        return None;
    }
    s.to_str().ok()
}

/// Hand a Rust string to C. An interior NUL (never produced by the engine's JSON) is replaced.
fn out(s: String) -> *mut c_char {
    let s = if s.contains('\0') {
        s.replace('\0', "\u{FFFD}")
    } else {
        s
    };
    CString::new(s).map_or(std::ptr::null_mut(), CString::into_raw)
}

/// Write `v` through an out-pointer when the pointer is not null.
///
/// # Safety
/// `p` is null or valid for one write of a pointer.
unsafe fn set(p: *mut *mut c_char, v: *mut c_char) {
    if p.is_null() {
        if !v.is_null() {
            // SAFETY: `v` came from `out` (CString::into_raw) just above and was not handed out.
            drop(unsafe { CString::from_raw(v) });
        }
        return;
    }
    // SAFETY: the caller promises `p` is valid for a write.
    unsafe { *p = v };
}

/// Run `f`, turning its result into a status code and the two out strings.
///
/// # Safety
/// `ok_out` and `err_out` are null or valid for one write each.
unsafe fn call(
    ok_out: *mut *mut c_char,
    err_out: *mut *mut c_char,
    f: impl FnOnce() -> Result<String, (c_int, String)>,
) -> c_int {
    // SAFETY (both sets below): forwarded from this function's contract.
    unsafe {
        set(ok_out, std::ptr::null_mut());
        set(err_out, std::ptr::null_mut());
    }
    let r = catch_unwind(AssertUnwindSafe(f)).unwrap_or_else(|p| {
        let msg = p
            .downcast_ref::<&str>()
            .map(|s| s.to_string())
            .or_else(|| p.downcast_ref::<String>().cloned())
            .unwrap_or_else(|| "internal error".into());
        Err((KSHANA_INTERNAL, msg))
    });
    match r {
        Ok(s) => {
            unsafe { set(ok_out, out(s)) };
            KSHANA_OK
        }
        Err((code, e)) => {
            unsafe { set(err_out, out(e)) };
            code
        }
    }
}

fn bad() -> (c_int, String) {
    (
        KSHANA_BAD_ARGUMENT,
        "a required string is null, not UTF-8, or larger than KSHANA_MAX_INPUT_BYTES".into(),
    )
}

/// The engine version, as a static NUL-terminated string (never free it).
#[no_mangle]
pub extern "C" fn kshana_version() -> *const c_char {
    VERSION.as_ptr().cast()
}

/// Run one scenario (TOML text). On success `*out_json` is the result document (JSON) and the call
/// returns [`KSHANA_OK`]; otherwise `*out_err` says why.
///
/// # Safety
/// `scenario_toml` is null or a NUL-terminated string; `out_json` and `out_err` are null or valid
/// for one write. Free the strings written with [`kshana_string_free`].
#[no_mangle]
pub unsafe extern "C" fn kshana_run_scenario(
    scenario_toml: *const c_char,
    out_json: *mut *mut c_char,
    out_err: *mut *mut c_char,
) -> c_int {
    // SAFETY: the pointers are forwarded under this function's own contract.
    let src = unsafe { arg(scenario_toml) };
    unsafe {
        call(out_json, out_err, || {
            let src = src.ok_or_else(bad)?;
            kshana::api::run_toml(src)
                .map(|r| r.json)
                .map_err(|e| (KSHANA_ERROR, e))
        })
    }
}

/// Check one scenario without running it. `*out_json` is a JSON array of problem strings (empty
/// when the scenario is valid); the call returns [`KSHANA_OK`] either way, unless an argument is bad.
///
/// # Safety
/// As [`kshana_run_scenario`].
#[no_mangle]
pub unsafe extern "C" fn kshana_validate_scenario(
    scenario_toml: *const c_char,
    out_json: *mut *mut c_char,
    out_err: *mut *mut c_char,
) -> c_int {
    // SAFETY: as kshana_run_scenario.
    let src = unsafe { arg(scenario_toml) };
    unsafe {
        call(out_json, out_err, || {
            let src = src.ok_or_else(bad)?;
            Ok(serde_json::to_string(&kshana::api::validate_scenario(src)).unwrap_or_default())
        })
    }
}

/// Kshana Connect: apply a mapping (`kshana.connect/1` TOML) to a log's text for a station (TOML)
/// and return the `kshana.obs/1` records as JSON lines in `*out_jsonl`.
///
/// # Safety
/// The three inputs are null or NUL-terminated strings; the out-pointers are null or valid for
/// one write. Free the strings written with [`kshana_string_free`].
#[no_mangle]
pub unsafe extern "C" fn kshana_connect_map(
    mapping_toml: *const c_char,
    station_toml: *const c_char,
    log_text: *const c_char,
    out_jsonl: *mut *mut c_char,
    out_err: *mut *mut c_char,
) -> c_int {
    // SAFETY: as kshana_run_scenario.
    let (m, s, t) = unsafe { (arg(mapping_toml), arg(station_toml), arg(log_text)) };
    unsafe {
        call(out_jsonl, out_err, || {
            let (Some(m), Some(s), Some(t)) = (m, s, t) else {
                return Err(bad());
            };
            kshana::surface::connect_map(m, s, t, KSHANA_MAX_INPUT_BYTES)
                .map_err(|e| (KSHANA_ERROR, e))
        })
    }
}

/// Free a string returned by this library. Null is ignored.
///
/// # Safety
/// `s` is null or a pointer this library returned and that was not freed before.
#[no_mangle]
pub unsafe extern "C" fn kshana_string_free(s: *mut c_char) {
    if !s.is_null() {
        // SAFETY: the caller promises `s` came from `out` (CString::into_raw) and is freed once.
        drop(unsafe { CString::from_raw(s) });
    }
}
