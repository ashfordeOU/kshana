// SPDX-License-Identifier: AGPL-3.0-only
//! IQ capture through SoapySDR (roadmap 0.42 I4; docs/SDR-SIMULATORS.md), behind the optional
//! `soapy` feature, Unix only. Part of the binary, not the library, which forbids `unsafe`.
//!
//! The SoapySDR library and its device modules are the user's own installation: they are opened
//! at run time with `dlopen` (`libSoapySDR.so.0.8`, `libSoapySDR.so`, or `libSoapySDR.dylib`), so
//! the crate gains no build or link dependency. Only the receive direction is used (stream format
//! `CS16`, one channel); nothing is ever transmitted. Calls follow the SoapySDR 0.8 C API
//! (`SoapySDR/Device.h`); another ABI version is refused.

use std::ffi::{c_char, c_int, c_long, c_void, CStr, CString};

type Dev = *mut c_void;

fn fail(why: impl std::fmt::Display) -> String {
    kshana::terr!(
        "e-connect-ops-failed",
        proto = "soapysdr",
        why = why.to_string()
    )
}

struct Lib(*mut c_void);

impl Lib {
    fn open() -> Result<Lib, String> {
        for name in ["libSoapySDR.so.0.8", "libSoapySDR.so", "libSoapySDR.dylib"] {
            let c = CString::new(name).map_err(fail)?;
            // SAFETY: dlopen with a valid C string; a null result is handled.
            let h = unsafe { libc::dlopen(c.as_ptr(), libc::RTLD_NOW) };
            if !h.is_null() {
                return Ok(Lib(h));
            }
        }
        Err(fail("library"))
    }
    fn sym<T: Copy>(&self, name: &str) -> Result<T, String> {
        let c = CString::new(name).map_err(fail)?;
        // SAFETY: dlsym on an open handle; the caller names the C signature of the symbol.
        let p = unsafe { libc::dlsym(self.0, c.as_ptr()) };
        if p.is_null() {
            return Err(fail(name));
        }
        // SAFETY: `T` is a function pointer type of the same size as a data pointer.
        Ok(unsafe { std::mem::transmute_copy::<*mut c_void, T>(&p) })
    }
}

impl Drop for Lib {
    fn drop(&mut self) {
        // SAFETY: the handle came from dlopen and is closed once.
        unsafe { libc::dlclose(self.0) };
    }
}

/// Capture `n` complex samples from the device named by `args` (SoapySDR key=value arguments,
/// for example `driver=rtlsdr`), tuned to `freq_hz` at `rate_hz`, with gain `gain_db` when given.
/// Returns interleaved I/Q as 16-bit integers.
pub fn capture(
    args: &str,
    freq_hz: f64,
    rate_hz: f64,
    gain_db: Option<f64>,
    n: usize,
) -> Result<Vec<i16>, String> {
    let lib = Lib::open()?;
    let abi: extern "C" fn() -> *const c_char = lib.sym("SoapySDR_getABIVersion")?;
    // SAFETY: the library returns a static NUL-terminated string.
    let v = unsafe { CStr::from_ptr(abi()) }
        .to_string_lossy()
        .into_owned();
    if !v.starts_with("0.8") {
        return Err(fail(format!("abi {v}")));
    }
    let make: extern "C" fn(*const c_char) -> Dev = lib.sym("SoapySDRDevice_makeStrArgs")?;
    let unmake: extern "C" fn(Dev) -> c_int = lib.sym("SoapySDRDevice_unmake")?;
    let last: extern "C" fn() -> *const c_char = lib.sym("SoapySDRDevice_lastError")?;
    let set_rate: extern "C" fn(Dev, c_int, usize, f64) -> c_int =
        lib.sym("SoapySDRDevice_setSampleRate")?;
    let set_freq: extern "C" fn(Dev, c_int, usize, f64, *const c_void) -> c_int =
        lib.sym("SoapySDRDevice_setFrequency")?;
    let set_gain: extern "C" fn(Dev, c_int, usize, f64) -> c_int =
        lib.sym("SoapySDRDevice_setGain")?;
    let setup: extern "C" fn(
        Dev,
        c_int,
        *const c_char,
        *const usize,
        usize,
        *const c_void,
    ) -> *mut c_void = lib.sym("SoapySDRDevice_setupStream")?;
    let activate: extern "C" fn(Dev, *mut c_void, c_int, i64, usize) -> c_int =
        lib.sym("SoapySDRDevice_activateStream")?;
    let read: extern "C" fn(
        Dev,
        *mut c_void,
        *const *mut c_void,
        usize,
        *mut c_int,
        *mut i64,
        c_long,
    ) -> c_int = lib.sym("SoapySDRDevice_readStream")?;
    let deactivate: extern "C" fn(Dev, *mut c_void, c_int, i64) -> c_int =
        lib.sym("SoapySDRDevice_deactivateStream")?;
    let close: extern "C" fn(Dev, *mut c_void) -> c_int = lib.sym("SoapySDRDevice_closeStream")?;
    // SAFETY: lastError returns a thread-local NUL-terminated string.
    let err = || fail(unsafe { CStr::from_ptr(last()) }.to_string_lossy());

    let cargs = CString::new(args).map_err(fail)?;
    let dev = make(cargs.as_ptr());
    if dev.is_null() {
        return Err(err());
    }
    const RX: c_int = 1;
    let mut out = Vec::with_capacity(2 * n);
    let r = (|| {
        if set_rate(dev, RX, 0, rate_hz) != 0
            || set_freq(dev, RX, 0, freq_hz, std::ptr::null()) != 0
        {
            return Err(err());
        }
        if let Some(g) = gain_db {
            if set_gain(dev, RX, 0, g) != 0 {
                return Err(err());
            }
        }
        let fmt = CString::new("CS16").map_err(fail)?;
        let ch = [0usize];
        let st = setup(dev, RX, fmt.as_ptr(), ch.as_ptr(), 1, std::ptr::null());
        if st.is_null() || activate(dev, st, 0, 0, 0) != 0 {
            return Err(err());
        }
        let mut buf = vec![0i16; 2 * 16_384];
        let mut errors = 0;
        while out.len() < 2 * n {
            let ptrs = [buf.as_mut_ptr() as *mut c_void];
            let (mut flags, mut t) = (0, 0i64);
            let k = read(
                dev,
                st,
                ptrs.as_ptr(),
                buf.len() / 2,
                &mut flags,
                &mut t,
                1_000_000,
            );
            if k < 0 {
                // Timeouts and overflows (negative codes) are tolerated a few times.
                errors += 1;
                if errors > 10 {
                    break;
                }
                continue;
            }
            let take = (k as usize).min(n - out.len() / 2);
            out.extend_from_slice(&buf[..2 * take]);
        }
        deactivate(dev, st, 0, 0);
        close(dev, st);
        if out.len() < 2 * n {
            return Err(fail("short"));
        }
        Ok(())
    })();
    unmake(dev);
    r.map(|_| out)
}

/// `kshana connect sdr-capture --args <a> --freq <Hz> --rate <Hz> --samples <n> --out <base>
/// [--gain <dB>]`: writes `<base>.sigmf-data` (ci16_le) and `<base>.sigmf-meta`, the samples as
/// received.
pub fn run(args: &[String]) -> Result<(), String> {
    use kshana::connect_ops::{flag, num, usage};
    let need = |n: &str| flag(args, n).ok_or_else(usage);
    let (freq, rate): (f64, f64) = (num(args, "--freq", 0.0)?, num(args, "--rate", 0.0)?);
    let n: usize = num(args, "--samples", 0)?;
    if !(freq > 0.0 && rate > 0.0 && n > 0) {
        return Err(usage());
    }
    let gain = flag(args, "--gain")
        .map(|g| g.parse().map_err(|_| usage()))
        .transpose()?;
    let iq = capture(need("--args")?, freq, rate, gain, n)?;
    let base = need("--out")?;
    let meta = kshana::sigmf::Meta::new(
        kshana::sigmf::DataType::Ci16Le,
        rate,
        freq,
        "SoapySDR capture",
    );
    let data: Vec<u8> = iq.iter().flat_map(|v| v.to_le_bytes()).collect();
    std::fs::write(format!("{base}.sigmf-data"), data).map_err(|e| format!("{base}: {e}"))?;
    std::fs::write(
        format!("{base}.sigmf-meta"),
        kshana::sigmf::meta_to_json(&meta)?,
    )
    .map_err(|e| format!("{base}: {e}"))
}
