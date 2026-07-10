// SPDX-License-Identifier: AGPL-3.0-only
//! P4 (real-time frame / EOP) — external validation of **Table 2** (UT1 error → position
//! at the Moon → timing over prediction horizons) at the 5-day (and 10-day) horizon, from
//! a LONGER verbatim real IERS span.
//!
//! ## Two independent references (both non-circular)
//! 1. **UT1 curve vs NumPy oracle.** The per-horizon UT1 RMS/quantiles that Table 2 is
//!    built on are cross-checked against an INDEPENDENT NumPy re-implementation
//!    (`tests/fixtures/eop_prediction/eop_prediction_reference.csv`, produced by
//!    `generate_eop_prediction_reference.py` re-parsing the same verbatim finals2000A
//!    columns in Python and recomputing the persistence residual statistics with NumPy —
//!    a different language / separate code path). Match to `< 1e-6 s`. This closes the gap
//!    the shipped 5-row fixture left: the 5-day and 10-day horizons now populate from REAL
//!    data instead of being honestly omitted.
//! 2. **Lever-arm image vs published physical constants.** The position/timing mapping
//!    `Δr = D_EM · ω⊕ · ΔUT1`, `Δt = Δr/c` is checked against an INDEPENDENT recomputation
//!    of the lever arm from the *published* constants — the IERS/IAU nominal Earth-rotation
//!    rate `ω⊕ = 7.292115e-5 rad/s`, the DE440 mean Earth–Moon distance `D_EM = 384 400 km`,
//!    and the defining `c = 299 792 458 m/s` — assembled locally in this test rather than
//!    reusing the engine's own `LEVER_M_PER_S` (which is derived from the ERA turns
//!    constant). Agreement to `< 1e-4` relative confirms the two independent derivations of
//!    the same lever arm coincide, and the engine's exact-image identity is asserted to
//!    `1e-9 m`.
//!
//! ## Honesty note (what stays Modelled)
//! The Table-2 MAPPING (real UT1 curve → Moon position → timing) is Validated: the curve is
//! real IERS data cross-checked against NumPy, and the lever arm is checked against published
//! constants. The predictor CHOICE (persistence, not IERS's operational algorithm) remains
//! Modelled, so the specific magnitudes are the achievable-error envelope of persistence over
//! this real span, NOT a claim to reproduce the paper's exact headline `5-day → 0.66 ms →
//! 19 m → 62 ns` numbers (which correspond to a different/shorter sample). The test asserts
//! only what the real data + validated lever arm produce.

use kshana::frame_eop::{prediction_error_vs_horizon, ut1_error_to_lunar, Horizon, HorizonError};

const FIXTURE: &str =
    include_str!("fixtures/agency/eop/finals2000A_2022001_longspan.txt");
const REFERENCE_CSV: &str = include_str!("fixtures/eop_prediction/eop_prediction_reference.csv");

// ---- INDEPENDENT published physical constants (assembled locally, not from the engine) ----
/// IERS/IAU nominal mean Earth angular rotation rate, rad/s (Ω = 7.292115×10⁻⁵ rad/s;
/// IERS Conventions 2010, Table 1.1). Used to recompute the lever arm independently of the
/// engine's ERA-turns derivation.
const OMEGA_EARTH_PUBLISHED_RAD_S: f64 = 7.292_115e-5;
/// DE440 mean Earth–Moon distance, m (384 400 km).
const D_EM_PUBLISHED_M: f64 = 384_400_000.0;
/// Speed of light in vacuum, m/s (defining constant).
const C_PUBLISHED_M_S: f64 = 299_792_458.0;

/// Independent lever-arm image of a UT1 error (s): `(position_m, time_ns)` from published
/// constants — a second, self-contained derivation of `frame_eop::ut1_error_to_lunar`.
fn independent_lever_image(delta_ut1_s: f64) -> (f64, f64) {
    let pos_m = D_EM_PUBLISHED_M * OMEGA_EARTH_PUBLISHED_RAD_S * delta_ut1_s;
    let time_ns = pos_m / C_PUBLISHED_M_S * 1e9;
    (pos_m, time_ns)
}

/// Parse `rms_s` for a horizon out of the committed NumPy oracle CSV.
fn reference_rms_s(horizon: Horizon) -> f64 {
    let key = match horizon {
        Horizon::Final => "final".to_string(),
        Horizon::Days(d) => format!("d{d}"),
    };
    for line in REFERENCE_CSV.lines() {
        if line.trim_start().starts_with('#') || line.starts_with("horizon;") || line.trim().is_empty()
        {
            continue;
        }
        let f: Vec<&str> = line.split(';').collect();
        if f[0] == key {
            return f[2].parse().unwrap();
        }
    }
    panic!("reference CSV missing horizon {horizon:?}");
}

fn engine_curve() -> Vec<HorizonError> {
    prediction_error_vs_horizon(
        FIXTURE,
        &[
            Horizon::Final,
            Horizon::Days(1),
            Horizon::Days(2),
            Horizon::Days(3),
            Horizon::Days(5),
            Horizon::Days(10),
        ],
    )
}

fn find(curve: &[HorizonError], h: Horizon) -> HorizonError {
    *curve
        .iter()
        .find(|e| e.horizon == h)
        .unwrap_or_else(|| panic!("horizon {h:?} must populate from the extended real fixture"))
}

/// Table 2 at the 5-day horizon is now produced from REAL data, and its UT1 RMS equals the
/// independent NumPy oracle to `< 1e-6 s`.
#[test]
fn table2_five_day_ut1_matches_numpy_oracle() {
    let curve = engine_curve();
    for h in [Horizon::Days(1), Horizon::Days(5), Horizon::Days(10)] {
        let e = find(&curve, h);
        let ref_rms = reference_rms_s(h);
        assert!(
            (e.rms_s - ref_rms).abs() < 1e-6,
            "horizon {h:?}: engine UT1 RMS {} s vs NumPy oracle {} s",
            e.rms_s,
            ref_rms
        );
    }
    let d5 = find(&curve, Horizon::Days(5));
    eprintln!(
        "5-day UT1 RMS = {:.4} ms (n={}), matches NumPy oracle to < 1e-6 s",
        d5.rms_ms(),
        d5.n
    );
}

/// The Table-2 position/timing at every horizon equals the exact lever-arm image, and that
/// lever arm agrees with an INDEPENDENT recomputation from published constants (Ω, D_EM, c).
#[test]
fn table2_position_timing_is_the_independent_lever_arm_image() {
    let curve = engine_curve();
    for e in &curve {
        // (a) engine self-image exact to 1e-9 m (position = ut1_error_to_lunar(rms).0).
        let (engine_pos, engine_time_s) = ut1_error_to_lunar(e.rms_s);
        assert!(
            (e.rms_position_m() - engine_pos).abs() < 1e-9,
            "{:?}: rms_position_m accessor disagrees with ut1_error_to_lunar",
            e.horizon
        );
        // (b) that image agrees with the independent published-constant lever arm to < 1e-4
        //     relative (the two ω⊕ derivations — ERA turns vs IERS nominal — differ at the
        //     8th significant figure).
        let (ref_pos, ref_time_ns) = independent_lever_image(e.rms_s);
        if ref_pos > 0.0 {
            let rel_pos = (engine_pos - ref_pos).abs() / ref_pos;
            assert!(
                rel_pos < 1e-4,
                "{:?}: engine position {} m vs published-constant lever arm {} m (rel {:.2e})",
                e.horizon,
                engine_pos,
                ref_pos,
                rel_pos
            );
            let engine_time_ns = engine_time_s * 1e9;
            let rel_t = (engine_time_ns - ref_time_ns).abs() / ref_time_ns;
            assert!(
                rel_t < 1e-4,
                "{:?}: engine timing {} ns vs published-constant {} ns (rel {:.2e})",
                e.horizon,
                engine_time_ns,
                ref_time_ns,
                rel_t
            );
        }
    }
    // Concrete Table-2 rows from real data (position/timing at the Moon), for the record.
    let report = |h: Horizon| {
        let e = find(&curve, h);
        let (pos, t) = ut1_error_to_lunar(e.rms_s);
        eprintln!(
            "Table2 {:?}: UT1 {:.4} ms -> {:.2} m at Moon -> {:.2} ns",
            h,
            e.rms_ms(),
            pos,
            t * 1e9
        );
    };
    for h in [
        Horizon::Final,
        Horizon::Days(1),
        Horizon::Days(2),
        Horizon::Days(3),
        Horizon::Days(5),
        Horizon::Days(10),
    ] {
        report(h);
    }
}

/// Sanity anchor for the independent lever arm: 1 ms of UT1 error → ~28.03 m → ~93.5 ns,
/// the published lunar-PNT frame-budget figure, recomputed here from published constants
/// only (no engine constants involved). This pins the lever arm to an external anchor.
#[test]
fn independent_lever_arm_reproduces_published_1ms_anchor() {
    let (pos, t_ns) = independent_lever_image(1e-3);
    assert!(
        (pos - 28.03).abs() < 0.05,
        "1 ms -> {pos} m, expected published 28.03 m"
    );
    assert!(
        (t_ns - 93.5).abs() < 0.2,
        "1 ms -> {t_ns} ns, expected published 93.5 ns"
    );
}
