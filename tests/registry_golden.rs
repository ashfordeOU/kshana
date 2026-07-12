//! Golden byte-identity regression guard for the registry dispatch refactor.
//!
//! The expected values below are LITERALS captured by running `kshana::api::run_toml`
//! on four representative scenarios. They are hard-coded — NOT recomputed and compared
//! to themselves — so this test fails loudly if routing dispatch through
//! `PackRegistry::with_builtins` changes the produced output for any of these packs.
//!
//! Each case pins the result with three layers, strongest last:
//!
//! * `summary` — the human-readable one-liner (contains the 12-hex `scenario_hash`
//!   for the packs that carry one). Rounded, so it is identical on every platform.
//! * `fnv64` of the *canonical* JSON — a whole-document fingerprint over a form in
//!   which every float is pinned to 6 significant figures, so the last-digit
//!   differences that x86-64 and ARM libm produce for the *same* computation
//!   collapse to identical text. Asserted on every platform: it moves the instant a
//!   produced value changes by more than ~1e-6, which is what a dispatch bug does.
//! * `fnv64` of the *raw* pretty JSON — exact, full-precision byte-identity. Because
//!   raw floats differ in their last digits across targets, this is pinned to and
//!   asserted only on the x86-64 Linux CI runner, where it restores the resolution
//!   the canonical layer gives up to stay portable.
//!
//! The `engine_version` value is normalized before hashing, so all fingerprints are
//! stable across crate version bumps; only a genuine change to produced output moves
//! them. To re-baseline, run `cargo test -p kshana --test registry_golden
//! zzz_emit_goldens -- --ignored --nocapture` (the raw hash must be regenerated on
//! x86-64 Linux).

use serde_json::Value;
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

/// Render a parsed result document into a platform-stable canonical string.
///
/// Every floating-point number is emitted at 6 significant figures (`{:.5e}`), so
/// the last-digit disagreements that different libm implementations produce for the
/// same computation round to identical text; `-0.0` is folded to `0.0` for the same
/// reason. Integers and strings pass through verbatim, and object keys are walked in
/// serde_json's own deterministic order. Hashing this string therefore yields the
/// same fingerprint on every target, while still moving if any value changes by more
/// than ~1e-6 — the resolution a routing-dispatch bug would blow straight past.
fn canonicalize(v: &Value, out: &mut String) {
    match v {
        Value::Null => out.push_str("null"),
        Value::Bool(b) => out.push_str(if *b { "true" } else { "false" }),
        Value::Number(n) => {
            if let Some(i) = n.as_i64() {
                out.push_str(&i.to_string());
            } else if let Some(u) = n.as_u64() {
                out.push_str(&u.to_string());
            } else {
                // serde_json never yields NaN/Inf, so this f64 is finite. Fold signed
                // zero (0.0 == -0.0) so a stray sign bit cannot fork the hash.
                let f = n.as_f64().unwrap();
                let f = if f == 0.0 { 0.0 } else { f };
                out.push_str(&format!("{f:.5e}"));
            }
        }
        Value::String(s) => {
            out.push('"');
            out.push_str(s);
            out.push('"');
        }
        Value::Array(a) => {
            out.push('[');
            for (i, e) in a.iter().enumerate() {
                if i > 0 {
                    out.push(',');
                }
                canonicalize(e, out);
            }
            out.push(']');
        }
        Value::Object(m) => {
            out.push('{');
            for (i, (k, val)) in m.iter().enumerate() {
                if i > 0 {
                    out.push(',');
                }
                out.push('"');
                out.push_str(k);
                out.push_str("\":");
                canonicalize(val, out);
            }
            out.push('}');
        }
    }
}

/// Portable whole-document fingerprint: version-normalize, parse, canonicalize the
/// floats to 6 significant figures, then FNV. Identical on every platform.
fn canonical_fnv(json: &str) -> u64 {
    let normalized = normalize_volatile(json);
    let value: Value = serde_json::from_str(&normalized)
        .unwrap_or_else(|e| panic!("golden result JSON did not parse: {e}"));
    let mut canon = String::new();
    canonicalize(&value, &mut canon);
    fnv64(&canon)
}

/// Exact, full-precision whole-document fingerprint over the raw pretty JSON.
/// Platform floats differ in their last digits, so callers assert this only on the
/// x86-64 Linux CI runner.
fn raw_fnv(json: &str) -> u64 {
    fnv64(&normalize_volatile(json))
}

struct Golden {
    path: &'static str,
    expect_summary: &'static str,
    /// Portable whole-document fingerprint over the 6-sig-fig canonical form.
    /// Identical on every platform; asserted everywhere.
    expect_fnv_canonical: u64,
    /// Exact whole-document fingerprint over the raw pretty JSON. Platform floats
    /// differ in their last digits, so this is pinned to — and only asserted on —
    /// the x86-64 Linux CI runner. Regenerate it there after an intentional output
    /// change. A raw mismatch while the canonical hash still matches means only
    /// sub-1e-6 runner FP drift: re-baseline this one value.
    ///
    /// `None` means the exact byte-pin was baselined on a non-Linux-x86-64 host, so
    /// only the portable `expect_fnv_canonical` layer guards this scenario. That
    /// layer already moves on any >~1e-6 output change; the raw layer only restores
    /// last-digit resolution on the one canonical CI runner. To add it, run
    /// `zzz_emit_goldens --ignored` on x86-64 Linux and paste the `raw(local)` value
    /// here as `Some(0x…)`.
    expect_fnv_raw_linux_x64: Option<u64>,
}

/// Replace the build-dependent `engine_version` value (always
/// `env!("CARGO_PKG_VERSION")` in the engine) with a fixed token, so the
/// whole-document byte-identity hash is stable across crate version bumps.
/// Every OTHER byte of the result JSON is still pinned exactly — this guards
/// against the registry refactor changing produced output, not against the
/// expected, orthogonal change of the crate version string.
fn normalize_volatile(json: &str) -> String {
    let v = env!("CARGO_PKG_VERSION");
    json.replace(
        &format!("\"engine_version\":\"{v}\""),
        "\"engine_version\":\"X\"",
    )
    .replace(
        &format!("\"engine_version\": \"{v}\""),
        "\"engine_version\": \"X\"",
    )
}

fn check(g: &Golden) {
    let src = fs::read_to_string(g.path).unwrap_or_else(|e| panic!("read {}: {e}", g.path));
    let out =
        kshana::api::run_toml(&src).unwrap_or_else(|e| panic!("run_toml {} failed: {e}", g.path));

    // Layer 1 — rounded, human-meaningful, portable.
    assert_eq!(
        out.summary, g.expect_summary,
        "summary drift for {}",
        g.path
    );

    // Layer 2 — portable whole-document byte-identity (floats pinned to 6 sig figs).
    assert_eq!(
        canonical_fnv(&out.json),
        g.expect_fnv_canonical,
        "canonical result-JSON drift for {} (portable fnv64 mismatch)",
        g.path
    );

    // Layer 3 — exact, full-precision byte-identity, only on the x86-64 Linux CI
    // runner (other targets round their trailing float digits differently), and only
    // for scenarios whose raw hash was baselined there (`Some`).
    #[cfg(all(target_os = "linux", target_arch = "x86_64"))]
    if let Some(expect_raw) = g.expect_fnv_raw_linux_x64 {
        assert_eq!(
            raw_fnv(&out.json),
            expect_raw,
            "raw result-JSON byte drift for {} on x86-64 Linux (exact fnv64 mismatch)",
            g.path
        );
    }
    // Read the field on every other target so it never trips dead-code lints.
    #[cfg(not(all(target_os = "linux", target_arch = "x86_64")))]
    let _ = g.expect_fnv_raw_linux_x64;
}

/// Literal emitter — run with `--ignored --nocapture` to recompute the golden
/// fnv64s. `canonical` is portable (capture on any platform); `raw(local)` is this
/// host's exact hash — it is the `expect_fnv_raw_linux_x64` literal only when run on
/// the x86-64 Linux CI runner.
#[test]
#[ignore]
fn zzz_emit_goldens() {
    for path in [
        "scenarios/clock-holdover.toml",
        "scenarios/jamming-demo.toml",
        "scenarios/orbit-multignss.toml",
        "scenarios/lunar-time-offset.toml",
        "scenarios/hybrid-optical-rf.toml",
        "scenarios/cislunar-observability.toml",
        "scenarios/conflict-resilience.toml",
    ] {
        let src = fs::read_to_string(path).unwrap();
        let out = kshana::api::run_toml(&src).unwrap();
        println!(
            "EMIT {path}\n  summary    = {}\n  canonical  = 0x{:016x}\n  raw(local) = 0x{:016x}",
            out.summary,
            canonical_fnv(&out.json),
            raw_fnv(&out.json),
        );
    }
}

#[test]
fn golden_clock() {
    check(&Golden {
        path: "scenarios/clock-holdover.toml",
        expect_summary: "scenario 5ba83a232b94 | quantum holdover 6600s p95 0.0ns integrity 1.000 security 0.997 | classical holdover 2610s p95 19.7ns integrity 1.000 security 0.000",
        expect_fnv_canonical: 0x8c8b_bb4b_75e2_c862,
        expect_fnv_raw_linux_x64: Some(0x49cf_2055_e294_17a2),
    });
}

#[test]
fn golden_jamming() {
    check(&Golden {
        path: "scenarios/jamming-demo.toml",
        expect_summary: "scenario 5aac34b045c7 | jamming ON | availability under jamming 0.00 (nominal 1.00) | min tracking 0 | mean J/S 72.2 dB",
        expect_fnv_canonical: 0xd732_8840_d904_043c,
        expect_fnv_raw_linux_x64: Some(0xbc8c_8400_d3b4_a740),
    });
}

#[test]
fn golden_orbit() {
    check(&Golden {
        path: "scenarios/orbit-multignss.toml",
        expect_summary: "scenario 6fd3fe9f1ff5 | 1441/1441 samples GNSS-nominal | best PDOP 1.32 pos 1.32m | quantum holdover 0s p95 0.0ns integrity n/a security 0.968 | classical holdover 0s p95 0.0ns integrity n/a security 0.000",
        expect_fnv_canonical: 0xdcbd_ef0d_1b62_c63d,
        expect_fnv_raw_linux_x64: Some(0x19ae_2ba2_ce0f_6a1a),
    });
}

#[test]
fn golden_lunar_time_offset() {
    // This pack carries no `scenario_hash` in its JSON; the summary + full-JSON FNV
    // still pin its output exactly.
    check(&Golden {
        path: "scenarios/lunar-time-offset.toml",
        expect_summary: "lunar-time-offset | secular LTC−TT rate 57.04 µs/day (band 56–59) | self-pot 57.50 kinetic -0.46 | offset @ 1.00 d = 57.04 µs",
        // Re-baselined after the L16 LunarTimeReport gained the topographic-spread and
        // TCG−TCL secular-rate fields. Canonical (portable, 6-sig-fig) is confirmed equal
        // to the value CI computes on Linux; the raw x86-64-Linux hash is re-pinned there.
        expect_fnv_canonical: 0xff26_8d1a_fb3b_0021,
        expect_fnv_raw_linux_x64: Some(0x2fe9_e730_c025_36e8),
    });
}

#[test]
fn golden_hybrid_optical_rf() {
    // P5 optical/RF hybrid: photon-limited ranging CRLB + diffraction footprint,
    // cross-modality RAIM protection levels, N-station union availability, a
    // bit-continuous handoff with a NEES χ² gate, and the joint availability ∧
    // precision ∧ integrity figure of merit. Canonical (portable) hash only; the
    // exact x86-64-Linux raw pin can be added later from a Linux emit run.
    check(&Golden {
        path: "scenarios/hybrid-optical-rf.toml",
        expect_summary: "hybrid-optical-rf | optical footprint 700 m, 1489 photons -> ranging σ 0.194 mm, timing σ 1.30 ps | cross-RAIM HPL 6.2 m / VPL 6.6 m / TPL 13.3 ns (protected) | availability 99.5% (5 sites) | handoff no-jump OK NEES 3.34∈[0.48,11.14] in-gate | joint FoM 0.993 (A 0.995 · P 0.995 · I 1.000) | Validated CRLB/χ²-PL/union/handoff, Modelled σ/climatology",
        expect_fnv_canonical: 0x184c_5616_64c9_3035,
        expect_fnv_raw_linux_x64: None,
    });
}

#[test]
fn golden_cislunar_observability() {
    // P6 cislunar observability: the observability Gramian over a tracking arc of a
    // differentially-corrected DRO constellation — rank growth, eigen-spectrum and
    // condition, range-only vs range+rate observability, DRO periodicity closure,
    // and a rank-conditioned SRIF posterior. Canonical (portable) hash only.
    check(&Golden {
        path: "scenarios/cislunar-observability.toml",
        expect_summary: "cislunar-observability | 4 s/c (3 refs) | 6.0 h arc, 24 epochs | rank 1 → 4 of 4 over arc | Gramian λ [2.92e-11…5.98e-2] cond 2.76e5 | instantaneous rank range-only 2 → range+rate 4 (3 links) | GDOP range-only undefined range+rate 6.353 | DRO ICs (max periodicity residual 4.7e-9) | SRIF posterior finite at rank-4 epoch 8 (Validated rank/STM/DRO-closure/SRIF, Modelled design)",
        expect_fnv_canonical: 0x5d5a_9d65_5d81_aebd,
        expect_fnv_raw_linux_x64: None,
    });
}

#[test]
fn golden_conflict_resilience() {
    // P7 layered-PNT conflict resilience: the Monte-Carlo resilience ratio of a
    // layered architecture vs a single layer, cross-checked against the closed-form
    // product, the correlation sweep that erodes layering, and the prior CI — every
    // headline magnitude Modelled, the identities (MC→closed-form, inverse-variance
    // fuse, ρ=0 copula==independent, per-vector survival MC→closed-form) Validated, plus
    // the §4.2 per-vector graceful-degradation breakdown (jamming sharpest). Canonical
    // (portable) hash only.
    check(&Golden {
        path: "scenarios/conflict-resilience.toml",
        expect_summary: "conflict-resilience | 4 layers (0 baseline) | reference intensity 1.00 | resilience ratio closed-form 6.73x MC 6.19x (layered vs single-layer) | correlation defeats layering: ratio 7.50x @ rho 0.00 -> 1.21x @ rho 0.95 | prior CI [5.51-8.48]x | per-vector survival @ ref jam 26% spoof 80% kinetic 100% cyber 99% (sharpest jamming) | ~7x headline MODELLED, VALIDATED MC->closed-form / fuse-identity / copula-marginals / per-vector-survival",
        expect_fnv_canonical: 0xfdd7_e3e5_f9c3_abcf,
        expect_fnv_raw_linux_x64: None,
    });
}
