//! Golden byte-identity regression guard for the registry dispatch refactor.
//!
//! The expected values below are LITERALS captured from the pre-refactor baseline
//! (clean commit 4c07fed) by running `kshana::api::run_toml` on four representative
//! scenarios. They are hard-coded — NOT recomputed and compared to themselves — so
//! this test fails loudly if routing dispatch through `PackRegistry::with_builtins`
//! changes the produced output for any of these packs.
//!
//! Each case pins two independent fingerprints of the result:
//!   * `summary`  — the human-readable one-liner (contains the 12-hex `scenario_hash`
//!                  for the packs that carry one);
//!   * `fnv64`    — an FNV-1a/64 hash of the full result JSON, i.e. a whole-document
//!                  byte-identity check.

use std::fs;

/// FNV-1a 64-bit hash — a tiny, dependency-free byte-identity fingerprint.
fn fnv64(s: &str) -> u64 {
    let mut h: u64 = 0xcbf2_9ce4_8422_2325;
    for b in s.as_bytes() {
        h ^= *b as u64;
        h = h.wrapping_mul(0x0000_0100_0000_01b3);
    }
    h
}

struct Golden {
    path: &'static str,
    expect_summary: &'static str,
    expect_json_fnv: u64,
}

fn check(g: &Golden) {
    let src = fs::read_to_string(g.path)
        .unwrap_or_else(|e| panic!("read {}: {e}", g.path));
    let out = kshana::api::run_toml(&src)
        .unwrap_or_else(|e| panic!("run_toml {} failed: {e}", g.path));
    assert_eq!(
        out.summary, g.expect_summary,
        "summary drift for {}",
        g.path
    );
    assert_eq!(
        fnv64(&out.json),
        g.expect_json_fnv,
        "result-JSON byte drift for {} (fnv64 mismatch)",
        g.path
    );
}

#[test]
fn golden_clock() {
    check(&Golden {
        path: "scenarios/clock-holdover.toml",
        expect_summary: "scenario 5ba83a232b94 | quantum holdover 6600s p95 0.0ns integrity 1.000 security 0.997 | classical holdover 2610s p95 19.7ns integrity 1.000 security 0.000",
        expect_json_fnv: 0xce42_e321_a840_a575,
    });
}

#[test]
fn golden_jamming() {
    check(&Golden {
        path: "scenarios/jamming-demo.toml",
        expect_summary: "scenario 5aac34b045c7 | jamming ON | availability under jamming 0.00 (nominal 1.00) | min tracking 0 | mean J/S 72.2 dB",
        expect_json_fnv: 0x8c1b_3a64_c0a1_d011,
    });
}

#[test]
fn golden_orbit() {
    check(&Golden {
        path: "scenarios/orbit-multignss.toml",
        expect_summary: "scenario 6fd3fe9f1ff5 | 1441/1441 samples GNSS-nominal | best PDOP 1.32 pos 1.32m | quantum holdover 0s p95 0.0ns integrity n/a security 0.968 | classical holdover 0s p95 0.0ns integrity n/a security 0.000",
        expect_json_fnv: 0x7089_4b91_b45f_8425,
    });
}

#[test]
fn golden_lunar_time_offset() {
    // This pack carries no `scenario_hash` in its JSON; the summary + full-JSON FNV
    // still pin its output exactly.
    check(&Golden {
        path: "scenarios/lunar-time-offset.toml",
        expect_summary: "lunar-time-offset | secular LTC−TT rate 57.04 µs/day (band 56–59) | self-pot 57.50 kinetic -0.46 | offset @ 1.00 d = 57.04 µs",
        expect_json_fnv: 0xefbd_8ea8_5e12_1844,
    });
}
