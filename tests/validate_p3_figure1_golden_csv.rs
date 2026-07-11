// SPDX-License-Identifier: AGPL-3.0-only
//! **Reproducibility drift guard** for P3 Figure 1 (the Allan-deviation curves of the four
//! named clocks + the link/frame floors, and the sorted per-component one-day timing-error
//! bars vs the 1 ns line).
//!
//! ## What this is — and what it is NOT
//! This is a **deterministic self-regeneration** guard, not an external-truth oracle. It calls
//! the public engine (`clock_specs::sigma_y` / `x_clock_ns`, `lunar_time_budget`), formats the
//! Figure-1 data with a **fixed-precision** formatter, and asserts the result is **byte-identical**
//! to the committed golden `tests/golden/p3-figure1.csv`. It pins the plotted numbers so the
//! figure cannot silently drift away from the engine; it does **not** claim the numbers are
//! externally correct (that is the job of the sibling `validate_p3_clock_spec_curves.rs` and
//! `validate_p3_powerlaw_floor_synthesis.rs`). Analogous to `tests/golden/realtime-frame-eop.csv`.
//!
//! Re-baseline (only when the figure model changes on purpose) with:
//!   `cargo test --test validate_p3_figure1_golden_csv zzz_emit_golden_csv -- --ignored`

use kshana::clock_specs::{sigma_y, x_clock_ns, LunarClock, ONE_DAY_S};
use kshana::lunar_time_budget::{default_tau_grid, BudgetParams};

const GOLDEN_CSV: &str = include_str!("golden/p3-figure1.csv");

/// The Figure-1 CSV, generated deterministically from the public engine with fixed-precision
/// formatting (17-significant-digit `{:.17e}` absorbs any last-ULP libm jitter across platforms
/// while remaining byte-stable for a fixed toolchain result). Three sections:
///   * `adev`   — σ_y(τ) for each of the four clocks over the default τ grid (Fig-1 top panel);
///   * `floor`  — the constant link/frame floors plotted as horizontal lines (Fig-1 top panel);
///   * `bar`    — the sorted per-component one-day timing-error bars + the 1 ns reference line (Fig-1 bottom panel).
fn emit_figure1_csv() -> String {
    let mut s = String::new();
    s.push_str("# P3 Figure 1 golden — deterministic self-regeneration (reproducibility drift guard, NOT an external oracle).\n");
    s.push_str("# Re-baseline: cargo test --test validate_p3_figure1_golden_csv zzz_emit_golden_csv -- --ignored\n");
    s.push_str("section,label,tau_s,value\n");

    // --- adev: σ_y(τ) curves for the four clocks over the default τ grid ---
    let taus = default_tau_grid();
    for clock in LunarClock::all() {
        let p = clock.powerlaw();
        for &tau in &taus {
            s.push_str(&format!(
                "adev,{},{:.17e},{:.17e}\n",
                clock.name(),
                tau,
                sigma_y(&p, tau)
            ));
        }
    }

    // --- floor: the constant budget floors (link/frame/relativistic/ephemeris) as ADEV-plane
    // horizontal lines, x_i / 1 s so they overlay the σ_y panel at the reference τ = 1 s. We emit
    // the seconds magnitudes directly (the figure places them; the guard only pins the numbers). ---
    let bp = BudgetParams::default();
    let floors = [
        ("rf-link-floor", bp.rf_link_floor_s),
        ("optical-link-floor", bp.optical_link_floor_s),
        ("frame-realisation", bp.frame_term_s()),
        ("relativistic-residual", bp.relativistic_residual_s),
        ("ephemeris", bp.ephemeris_s),
        ("measurement-1s", bp.measurement_1s_s),
    ];
    for (name, v) in floors {
        s.push_str(&format!("floor,{name},{:.17e},{:.17e}\n", ONE_DAY_S, v));
    }

    // --- bar: the four per-component one-day timing-error bars (ns) + the 1 ns reference line,
    // sorted best→worst (the LunarClock::all() ordering). ---
    for clock in LunarClock::all() {
        s.push_str(&format!(
            "bar,{},{:.17e},{:.17e}\n",
            clock.name(),
            ONE_DAY_S,
            x_clock_ns(clock, ONE_DAY_S)
        ));
    }
    s.push_str(&format!(
        "bar,one-ns-line,{:.17e},{:.17e}\n",
        ONE_DAY_S, 1.0
    ));

    s
}

#[test]
fn figure1_csv_is_byte_stable_against_the_committed_golden() {
    assert_eq!(
        emit_figure1_csv(),
        GOLDEN_CSV,
        "the committed P3 Figure-1 golden CSV must be reproduced byte-for-byte; re-baseline with \
         `cargo test --test validate_p3_figure1_golden_csv zzz_emit_golden_csv -- --ignored`"
    );
}

#[test]
fn figure1_regeneration_is_deterministic() {
    // Two independent regenerations agree byte-for-byte (no RNG, no wall-clock).
    assert_eq!(emit_figure1_csv(), emit_figure1_csv());
}

#[test]
fn golden_bar_rows_carry_the_cited_one_day_component_values() {
    // Cross-check the parsed golden against the cited P3 rows so the pinned bars are the right
    // physical numbers (0.009 / 0.995 / 2.94 / 151.238 ns) and the reference line is 1 ns.
    let cited = [
        ("optical-master", 0.009),
        ("passive-h-maser", 0.995),
        ("rafs", 2.939_388),
        ("mini-rafs", 151.238),
        ("one-ns-line", 1.0),
    ];
    for (label, want) in cited {
        let row = GOLDEN_CSV
            .lines()
            .find(|l| l.starts_with(&format!("bar,{label},")))
            .unwrap_or_else(|| panic!("golden missing bar row {label}"));
        let val: f64 = row.rsplit(',').next().unwrap().trim().parse().unwrap();
        let rel = (val - want).abs() / want;
        assert!(
            rel < 0.01,
            "golden bar {label} = {val} vs cited {want} (rel {rel})"
        );
    }
}

#[test]
fn golden_floor_rows_carry_the_documented_budget_defaults() {
    // The link/frame floor lines must be the documented BudgetParams defaults (0.035 ns frame is
    // computed δr/c; RF 1 ns; optical 0.01 ns; etc.), so the figure's horizontal lines are pinned.
    let bp = BudgetParams::default();
    let expect = [
        ("rf-link-floor", bp.rf_link_floor_s),
        ("optical-link-floor", bp.optical_link_floor_s),
        ("frame-realisation", bp.frame_term_s()),
        ("relativistic-residual", bp.relativistic_residual_s),
        ("ephemeris", bp.ephemeris_s),
        ("measurement-1s", bp.measurement_1s_s),
    ];
    for (label, want) in expect {
        let row = GOLDEN_CSV
            .lines()
            .find(|l| l.starts_with(&format!("floor,{label},")))
            .unwrap_or_else(|| panic!("golden missing floor row {label}"));
        let val: f64 = row.rsplit(',').next().unwrap().trim().parse().unwrap();
        assert!(
            (val - want).abs() / want.max(1e-300) < 1e-12,
            "golden floor {label} = {val} vs default {want}"
        );
    }
}

#[test]
#[ignore = "run with --ignored to re-baseline the committed golden CSV"]
fn zzz_emit_golden_csv() {
    std::fs::write("tests/golden/p3-figure1.csv", emit_figure1_csv()).expect("write golden CSV");
    eprintln!("wrote tests/golden/p3-figure1.csv");
}
