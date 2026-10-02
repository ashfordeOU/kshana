// SPDX-License-Identifier: AGPL-3.0-only
//! Oracles for the row "5G non-terrestrial-network positioning accuracy from signal bandwidth"
//! (`leo_fusion::ntn`).
//!
//! Pre-registration (validation 0.30, round 2, batch "sweepA"; written 2026-10-02 before any
//! comparison below was run and before the numpy fixture was generated). The publication was
//! read for its inputs and printed values before this was written; no Kshana number had been
//! computed for them.
//!
//! Part A (kind P1, a published worked value). Bachl, Lei and Nabeel, "Achievable Accuracy and
//! Cramér-Rao Bounds for SSB-Based LEO Positioning in NR NTN", arXiv:2608.10270v1 (10 August
//! 2026; Huawei Heisenberg Research Center and Technical University of Munich, independent of
//! this project; reading copy SHA-256
//! 98fbdf38ceda54c5c2a5d0ec0cfa99a554d9c62f9e170aa9a223f276dae4870a, not vendored, numbers
//! cited). Section II-C evaluates the single-SSB (synchronization signal block) bounds of its
//! equation (4), `σ_ρ ≥ c / (2π W_rms √(2γ))` and `σ_f ≥ 1 / (2π σ_t √(2γ))`, with
//! `γ = γ_RE B` the integrated SNR (signal-to-noise ratio), and prints: over the full 830-RE
//! (resource element) SSB map at 30 kHz subcarrier spacing with the PSS (primary
//! synchronization signal) weight 1, `σ_t ≈ 39 µs`, `W_rms ≈ 1.96 MHz`, `σ_f ≈ 101 Hz` and
//! `σ_ρ ≈ 0.60 m` at `γ_RE = 0 dB`; with the 3 dB PSS boost (`B = 957`), `≈ 87 Hz` and
//! `≈ 0.58 m`.
//! Kshana computes these from the publication's inputs: the SSB resource-element map of 3GPP TS
//! 38.211 section 7.4.3.1 (PSS on symbol 0 and SSS on symbol 2, subcarriers 56-182; PBCH and its
//! DM-RS on symbols 1 and 3, subcarriers 0-239, and on symbol 2, subcarriers 0-47 and 192-239;
//! 830 REs), 30 kHz spacing, symbol duration (2048 + 144) / (2048 × 30 kHz) = 35.677 µs.
//! - `W_rms`: `ntn::gabor_bandwidth_numeric_hz` of the piecewise-constant power spectral density
//!   whose value on each 30 kHz subcarrier bin (centred at (k − 119.5) × 30 kHz) is that
//!   subcarrier's RE energy, over the 7.2 MHz block;
//! - `σ_t`: `ntn::rms_duration_numeric_s` (added with this pre-registration, the time dual of
//!   the numeric RMS bandwidth) of the piecewise-constant envelope whose value on each symbol is
//!   that symbol's RE energy, over the four symbols;
//! - `σ_ρ = ntn::toa_crb_sigma_m(W_rms, C/N0, T)` and `σ_f = ntn::frequency_crb_sigma_hz(σ_t,
//!   C/N0, T)` (added with this pre-registration; the existing complex-tone bound
//!   `doppler_crb_sigma_hz` is its constant-envelope case, a unit test) with `(C/N0) T = γ`,
//!   `T = 1 s`, `γ = 830` (and 957 with the boost, the PSS REs then weighted 2 in both spectra).
//! Tolerances (half a unit of the printed last digit): `W_rms` within 0.005 MHz of 1.96 MHz;
//! `σ_t` within 0.5 µs of 39 µs; `σ_f` within 0.5 Hz of 101 Hz and of 87 Hz (boost); `σ_ρ`
//! within 0.005 m of 0.60 m and of 0.58 m (boost).
//!
//! Part B (kind P2, an independent numerical library). The positioning part of the row: the
//! formal covariances of the scenario's fixes, recomputed by numpy (`numpy.linalg.inv`, LAPACK)
//! on identical inputs. `NtnScenario::geometry()` (added with this pre-registration; `compute`
//! now uses exactly it) exports, for the default `ntn-positioning` scenario, the true user
//! position, every epoch's satellites in view with their per-signal pseudorange sigmas, and the
//! Doppler pass samples with their range-rate sigma; the test writes them with 17 significant
//! digits to `tests/fixtures/ntn_crlb_published_value_oracle/geometry.txt` and checks the engine
//! still exports exactly these numbers (1e-9 relative). `make_fixture.py` then builds, at the
//! true position, (i) per epoch with at least 4 satellites the time-of-arrival design matrix
//! `[−unit line of sight, 1]` with weights `1/σ²` and the 3-D sigma `√trace` of the position
//! block of `inv(HᵀWH)`, and its median over epochs per signal; (ii) the Doppler design matrix,
//! rows `[−(v_s − ρ̇ u)/ρ, 1]` per sample (static user, `u` the unit line of sight, `ρ̇` the
//! range rate) plus the height row `[geodetic up, 0]` with sigma 10 m, and the east, north and
//! up sigmas of `inv(HᵀWH)`. Tolerances (fixed now): each median 3-D sigma within 1e-5
//! relative of the report's `toa_median_sigma_3d_m` (the engine linearises at its noisy fix,
//! metres from the truth at a thousand kilometres); each Doppler east/north/up sigma within
//! 1e-3 relative of the report's `doppler_pass.sigma_enu_m` (the Doppler fix is tens of metres
//! from the truth).
//!
//! PROMOTE only if every Part A and Part B comparison holds.
//!
//! Discrimination, pre-registered: dropping the factor 2 under the root in `toa_crb_sigma_m`
//! must turn Part A red; scaling the joint fix's `sigma_enu_m` by 1.01 in `joint_pvt::solve`
//! must turn Part B red.

use kshana::leo_fusion::ntn::{
    frequency_crb_sigma_hz, gabor_bandwidth_numeric_hz, rms_duration_numeric_s, toa_crb_sigma_m,
    NtnScenario,
};
use std::path::PathBuf;

const SCS_HZ: f64 = 30e3;
const N_SC: usize = 240;

fn dir() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/ntn_crlb_published_value_oracle")
}

/// Resource-element energy of subcarrier `k` on symbol `l` of the SSB (3GPP TS 38.211
/// section 7.4.3.1), with the PSS weighted `pss_w`.
fn re_energy(l: usize, k: usize, pss_w: f64) -> f64 {
    let in_ss = (56..=182).contains(&k);
    match l {
        0 => {
            if in_ss {
                pss_w
            } else {
                0.0
            }
        }
        1 | 3 => 1.0,
        2 => {
            if in_ss || k <= 47 || k >= 192 {
                1.0
            } else {
                0.0
            }
        }
        _ => 0.0,
    }
}

fn subcarrier_energy(k: usize, pss_w: f64) -> f64 {
    (0..4).map(|l| re_energy(l, k, pss_w)).sum()
}

fn symbol_energy(l: usize, pss_w: f64) -> f64 {
    (0..N_SC).map(|k| re_energy(l, k, pss_w)).sum()
}

fn w_rms_hz(pss_w: f64) -> f64 {
    let psd = |f: f64| {
        let k = (f / SCS_HZ + 120.0).floor();
        if (0.0..N_SC as f64).contains(&k) {
            subcarrier_energy(k as usize, pss_w)
        } else {
            0.0
        }
    };
    gabor_bandwidth_numeric_hz(psd, N_SC as f64 * SCS_HZ)
}

fn sigma_t_s(pss_w: f64) -> f64 {
    let tsym = (2048.0 + 144.0) / (2048.0 * SCS_HZ);
    let env = |t: f64| {
        let l = (t / tsym).floor() as usize;
        if l < 4 {
            symbol_energy(l, pss_w)
        } else {
            0.0
        }
    };
    rms_duration_numeric_s(env, 4.0 * tsym)
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn ssb_bounds_reproduce_the_published_values() {
    let total: f64 = (0..4).map(|l| symbol_energy(l, 1.0)).sum();
    assert_eq!(total, 830.0, "the SSB map must hold 830 REs");
    assert_eq!((0..4).map(|l| symbol_energy(l, 2.0)).sum::<f64>(), 957.0);
    let mut ok = true;
    for (pss_w, gamma, sf_want, sr_want) in [(1.0, 830.0, 101.0, 0.60), (2.0, 957.0, 87.0, 0.58)] {
        let w = w_rms_hz(pss_w);
        let st = sigma_t_s(pss_w);
        let cn0_dbhz = 10.0 * f64::log10(gamma);
        let sr = toa_crb_sigma_m(w, cn0_dbhz, 1.0);
        let sf = frequency_crb_sigma_hz(st, cn0_dbhz, 1.0);
        eprintln!(
            "PSS weight {pss_w}: W_rms {:.4} MHz, sigma_t {:.3} us, sigma_f {sf:.3} Hz (printed {sf_want}), sigma_rho {sr:.4} m (printed {sr_want})",
            w / 1e6,
            st * 1e6
        );
        if pss_w == 1.0 {
            ok &= (w / 1e6 - 1.96).abs() <= 0.005;
            ok &= (st * 1e6 - 39.0).abs() <= 0.5;
        }
        ok &= (sf - sf_want).abs() <= 0.5;
        ok &= (sr - sr_want).abs() <= 0.005;
    }
    assert!(ok, "a published SSB bound is not reproduced within its printed digits");
}

fn scenario() -> NtnScenario {
    toml::from_str("kind = \"ntn-positioning\"\n").expect("default ntn scenario")
}

/// Serialises the geometry in the fixture format: `U x y z`, `S name`, one `E k` line per epoch
/// followed by `L x y z el sigma_0 sigma_1 ...`, and `D sigma_rr` with `P t x y z vx vy vz` lines.
fn geometry_text() -> String {
    let g = scenario().geometry().expect("geometry");
    let mut s = String::new();
    let u = g.user_ecef;
    s += &format!("U {:.17e} {:.17e} {:.17e}\n", u[0], u[1], u[2]);
    for sig in &g.signals {
        s += &format!("S {}\n", sig.name);
    }
    for (k, ep) in g.epochs.iter().enumerate() {
        s += &format!("E {k}\n");
        for l in ep {
            let mut line = format!(
                "L {:.17e} {:.17e} {:.17e} {:.17e}",
                l.sat_pos[0], l.sat_pos[1], l.sat_pos[2], l.el
            );
            for sd in &l.sigma_m {
                line += &format!(" {sd:.17e}");
            }
            s += &line;
            s += "\n";
        }
    }
    if let Some((_, samples, srr)) = &g.doppler_pass {
        s += &format!("D {srr:.17e}\n");
        for p in samples {
            s += &format!(
                "P {:.17e} {:.17e} {:.17e} {:.17e} {:.17e} {:.17e} {:.17e}\n",
                p.t_s, p.sat_pos[0], p.sat_pos[1], p.sat_pos[2], p.sat_vel[0], p.sat_vel[1], p.sat_vel[2]
            );
        }
    }
    s
}

/// Writes the geometry fixture when `KSHANA_WRITE_NTN_FIXTURE=1`; otherwise does nothing.
#[test]
fn write_geometry_fixture_on_request() {
    if std::env::var("KSHANA_WRITE_NTN_FIXTURE").as_deref() != Ok("1") {
        return;
    }
    std::fs::create_dir_all(dir()).expect("fixture dir");
    std::fs::write(dir().join("geometry.txt"), geometry_text()).expect("write geometry");
}

fn numbers(line: &str) -> Vec<f64> {
    line.split_whitespace().skip(1).map(|x| x.parse().expect("number")).collect()
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn ntn_fix_covariances_match_numpy() {
    let (Ok(committed), Ok(oracle)) = (
        std::fs::read_to_string(dir().join("geometry.txt")),
        std::fs::read_to_string(dir().join("numpy_oracle.txt")),
    ) else {
        eprintln!("SKIP: geometry.txt or numpy_oracle.txt absent (see the header)");
        return;
    };
    // The engine still exports exactly the committed geometry.
    let now = geometry_text();
    let (a, b): (Vec<&str>, Vec<&str>) = (committed.lines().collect(), now.lines().collect());
    assert_eq!(a.len(), b.len(), "geometry line count changed");
    for (x, y) in a.iter().zip(&b) {
        assert_eq!(x.split_whitespace().next(), y.split_whitespace().next());
        if x.starts_with('S') || x.starts_with('E') {
            assert_eq!(x, y);
            continue;
        }
        for (p, q) in numbers(x).iter().zip(numbers(y)) {
            assert!((p - q).abs() <= 1e-9 * p.abs().max(1.0), "geometry moved: {x} vs {y}");
        }
    }
    let r = scenario().compute().expect("report");
    let mut ok = true;
    for line in oracle.lines() {
        let f: Vec<&str> = line.split_whitespace().collect();
        match f.first().copied() {
            Some("TOA") => {
                let i: usize = f[1].parse().expect("signal index");
                let want: f64 = f[2].parse().expect("median");
                let got = r.signals[i].toa_median_sigma_3d_m.expect("fixes");
                let rel = (got - want).abs() / want;
                eprintln!("signal {i}: median 3-D sigma engine {got:.9} m numpy {want:.9} m (rel {rel:.2e})");
                ok &= rel <= 1e-5;
            }
            Some("DOP") => {
                let want: Vec<f64> = f[1..4].iter().map(|x| x.parse().expect("sigma")).collect();
                let got = r.doppler_pass.as_ref().expect("doppler pass").sigma_enu_m;
                for c in 0..3 {
                    let rel = (got[c] - want[c]).abs() / want[c];
                    eprintln!("Doppler sigma[{c}] engine {:.9} m numpy {:.9} m (rel {rel:.2e})", got[c], want[c]);
                    ok &= rel <= 1e-3;
                }
            }
            _ => {}
        }
    }
    assert!(ok, "a formal sigma differs from numpy beyond the pre-registered tolerance");
}
