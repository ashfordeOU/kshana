// SPDX-License-Identifier: AGPL-3.0-only
//! Lunar ARAIM **protection-level** reference test (external oracle: RTKLIB's LU
//! inverse + SciPy's normal law and root finder).
//!
//! kshana's [`kshana::lunar_service::lunar_protection_level`] /
//! [`kshana::lunar_service::lunar_protection_level_with_sigma`] turn a lunar surface
//! user, a set of Moon-fixed satellite positions, a signal-in-space ranging sigma and an
//! integrity-risk budget into a horizontal and a vertical protection level. This test
//! checks that map against an oracle assembled from two established third-party
//! implementations, on the identical geometry, with a committed fixture:
//!
//! * **RTKLIB 2.4.2-p13** (T. Takasu), `src/rtkcmn.c` compiled from C source with
//!   `-ULAPACK`. Its `lsq()` builds the normal matrix and inverts it through
//!   `matinv() -> ludcmp()/lubksb()` — Crout LU with partial pivoting — yielding
//!   `(GᵀG)⁻¹` for the all-in-view geometry and for each single-satellite-excluded
//!   sub-geometry. kshana inverts the same normal matrix with a hand-written
//!   Gauss-Jordan `invert4()`. Every one of those matrices was additionally re-inverted
//!   with `numpy.linalg.inv` (LAPACK `getrf`/`getri`) as a third independent inverse;
//!   the largest RTKLIB-vs-LAPACK disagreement over the whole fixture is recorded in the
//!   fixture header (1.112e-12, relative to the largest entry of each matrix).
//! * **SciPy 1.17.0 / NumPy 2.4.1**. `scipy.stats.norm.isf` gives the Bonferroni
//!   detector multiplier `K_fa = Φ⁻¹(1 − P_fa/2N)`; `scipy.stats.norm.sf` (Cephes
//!   `ndtr`) gives every upper-tail term of the integrity-risk sum; `scipy.optimize.brentq`
//!   finds the protection level as the root of that sum against the budget. kshana
//!   instead bisects its own Numerical-Recipes incomplete-gamma erf series for the first
//!   two — and forms the upper tail as `1 − Φ(z)`, a numerically different route into the
//!   far tail than SciPy's direct `sf` — and runs a 200-step bisection for the third.
//!
//! # What this validates, and what it does not
//!
//! **Externally checked here.** (1) The geometry-to-covariance step: `(GᵀG)⁻¹` and its
//! projection onto the local vertical and horizontal, checked both through the protection
//! levels and directly through [`kshana::orbit::dop`] against RTKLIB's own inverse.
//! (2) The statistical kernel: the normal quantile that sets the detection thresholds,
//! the normal upper tail of every fault hypothesis, and the root solve that maps an
//! integrity-risk budget onto a protection level.
//!
//! **NOT checked here, and the verification-matrix row must keep saying so.** The σ_URE
//! budget (`LUNAR_SIGMA_URE_M = 30 m`), the per-satellite fault prior
//! (`LUNAR_P_SAT = 1e-4`) and the illustrative Moonlight/LCNS-class constellation are
//! **modelled inputs**: they are handed to the oracle as given numbers and nothing here
//! validates them. Nor is the *form* of the single-fault MHSS integrity equation
//! externally validated — the generator transcribes the same published bound
//! `P_HMI(PL) = Σ_k p_k·Q((PL − T_k)/σ_k)`, `T_k = K_fa·σ_ss,k`, that `raim::araim_raim`
//! implements. A shared closed form is a shared assumption: this test would not catch
//! the wrong equation, only a wrong evaluation of it.
//!
//! # Conventions deliberately not shared
//!
//! The oracle takes the local vertical as the radial unit vector (which, for kshana's
//! spherical Moon, is the definition of local vertical rather than a convention) and the
//! horizontal variance as `trace(Q_pos) − verticalᵀ`, i.e. the trace of the horizontal
//! block. kshana instead sums two explicit axis variances along its own East and North.
//! The sum is invariant to any rotation about Up, so the oracle never has to pick the
//! same East kshana picks — no azimuth convention is shared.
//!
//! # Tolerances
//!
//! See [`PL_ABS_TOL_M`] and [`DOP_REL_TOL`]. Both are far tighter than the physically
//! meaningful scale (protection levels here run from 1e2 to 7e3 m) and are set from the
//! measured agreement, not the other way round. [`a_perturbed_geometry_must_fail`] and
//! [`a_perturbed_sigma_must_fail`] prove the comparison is not vacuous at those
//! tolerances.

use kshana::lunar::{mcmf_to_selenographic, Selenographic, LUNAR_SIGMA_URE_M};
use kshana::lunar_service::{
    lunar_protection_level, lunar_protection_level_with_sigma, visible_sat_positions,
    LunarConstellation,
};
use kshana::orbit::dop;
use kshana::raim::{normal_quantile, IntegrityBudget};

const REF: &str =
    include_str!("fixtures/lunar_protection_level/lunar_protection_level_reference.txt");

/// Absolute agreement required between kshana's protection level and the oracle's, in
/// metres. The two differ only by floating-point route (Gauss-Jordan vs LU inverse,
/// an erf-series `1 − Φ` vs Cephes `sf`, bisection vs Brent), so the residual is
/// round-off, not modelling: the measured worst case over the committed fixture is
/// reported by the test itself and sits well inside this bound. A protection level of
/// 1e-6 m is nine orders of magnitude below the smallest alert limit anyone would set.
const PL_ABS_TOL_M: f64 = 1e-6;

/// Relative agreement required between kshana's dilution-of-precision factors and the
/// ones formed from RTKLIB's `(GᵀG)⁻¹` on the identical geometry. This isolates the
/// geometry-to-covariance step from the statistical kernel.
const DOP_REL_TOL: f64 = 1e-9;

/// Relative agreement required between kshana's `normal_quantile` and SciPy's
/// `norm.isf` for the Bonferroni detector multiplier.
const KFA_REL_TOL: f64 = 1e-10;

/// One fixture case: the shared modelled inputs plus the oracle's answers.
struct Case {
    label: String,
    sigma_ure_m: f64,
    p_hmi_vert: f64,
    p_hmi_horz: f64,
    p_fa: f64,
    user_mcmf: [f64; 3],
    sats_mcmf: Vec<[f64; 3]>,
    hpl_m: f64,
    vpl_m: f64,
    hdop: f64,
    vdop: f64,
    pdop: f64,
    gdop: f64,
    tdop: f64,
    k_fa: f64,
}

impl Case {
    /// The integrity-risk budget this case was generated with.
    fn budget(&self) -> IntegrityBudget {
        IntegrityBudget {
            p_hmi_vert: self.p_hmi_vert,
            p_hmi_horz: self.p_hmi_horz,
            p_fa: self.p_fa,
        }
    }

    /// The user point as the selenographic coordinate the public entry point takes.
    /// Round-tripping the fixture's Moon-fixed vector through
    /// `mcmf_to_selenographic` keeps the fixture in one frame while still driving the
    /// public API; the round trip itself is exercised by `lunar::tests`.
    fn site(&self) -> Selenographic {
        mcmf_to_selenographic(self.user_mcmf)
    }
}

fn v3(p: &[&str]) -> [f64; 3] {
    [
        p[0].parse().unwrap(),
        p[1].parse().unwrap(),
        p[2].parse().unwrap(),
    ]
}

fn parse_fixture() -> Vec<Case> {
    let mut cases: Vec<Case> = Vec::new();
    for line in REF.lines() {
        let line = line.trim();
        if line.is_empty() || line.starts_with('#') {
            continue;
        }
        let p: Vec<&str> = line.split_whitespace().collect();
        match p[0] {
            "CASE" => cases.push(Case {
                label: p[1].to_string(),
                sigma_ure_m: p[3].parse().unwrap(),
                p_hmi_vert: p[4].parse().unwrap(),
                p_hmi_horz: p[5].parse().unwrap(),
                p_fa: p[6].parse().unwrap(),
                user_mcmf: [0.0; 3],
                sats_mcmf: Vec::new(),
                hpl_m: f64::NAN,
                vpl_m: f64::NAN,
                hdop: f64::NAN,
                vdop: f64::NAN,
                pdop: f64::NAN,
                gdop: f64::NAN,
                tdop: f64::NAN,
                k_fa: f64::NAN,
            }),
            "USER" => cases.last_mut().unwrap().user_mcmf = v3(&p[1..4]),
            "SAT" => cases.last_mut().unwrap().sats_mcmf.push(v3(&p[1..4])),
            "ORACLE" => {
                let c = cases.last_mut().unwrap();
                c.hpl_m = p[1].parse().unwrap();
                c.vpl_m = p[2].parse().unwrap();
                c.hdop = p[3].parse().unwrap();
                c.vdop = p[4].parse().unwrap();
                c.pdop = p[5].parse().unwrap();
                c.gdop = p[6].parse().unwrap();
                c.tdop = p[7].parse().unwrap();
            }
            "KFA" => cases.last_mut().unwrap().k_fa = p[1].parse().unwrap(),
            other => panic!("unexpected fixture record {other:?}"),
        }
    }
    assert!(!cases.is_empty(), "fixture parsed to no cases");
    for c in &cases {
        assert!(
            c.hpl_m.is_finite() && c.vpl_m.is_finite() && c.k_fa.is_finite(),
            "case {} is missing its ORACLE/KFA record",
            c.label
        );
        assert!(
            c.sats_mcmf.len() >= 6,
            "case {} has too few satellites for an ARAIM protection level",
            c.label
        );
    }
    cases
}

/// The headline check: kshana's lunar protection level against the composed
/// RTKLIB + SciPy oracle, on the geometry both sides were given.
#[test]
fn lunar_protection_level_matches_the_external_oracle() {
    let mut worst_h: (f64, String) = (0.0, String::new());
    let mut worst_v: (f64, String) = (0.0, String::new());
    for c in parse_fixture() {
        let pl =
            lunar_protection_level_with_sigma(c.site(), &c.sats_mcmf, c.sigma_ure_m, c.budget())
                .unwrap_or_else(|| panic!("case {}: protection level returned None", c.label));

        assert_eq!(pl.n_used, c.sats_mcmf.len(), "case {}", c.label);
        assert_eq!(pl.sigma_ure_m, c.sigma_ure_m, "case {}", c.label);

        let dh = (pl.hpl_m - c.hpl_m).abs();
        let dv = (pl.vpl_m - c.vpl_m).abs();
        if dh > worst_h.0 {
            worst_h = (dh, c.label.clone());
        }
        if dv > worst_v.0 {
            worst_v = (dv, c.label.clone());
        }
        assert!(
            dh < PL_ABS_TOL_M,
            "case {}: HPL kshana {:.12} m vs oracle {:.12} m (|Δ| = {dh:.3e} m)",
            c.label,
            pl.hpl_m,
            c.hpl_m
        );
        assert!(
            dv < PL_ABS_TOL_M,
            "case {}: VPL kshana {:.12} m vs oracle {:.12} m (|Δ| = {dv:.3e} m)",
            c.label,
            pl.vpl_m,
            c.vpl_m
        );
    }
    println!(
        "worst HPL |Δ| = {:.3e} m ({}); worst VPL |Δ| = {:.3e} m ({})",
        worst_h.0, worst_h.1, worst_v.0, worst_v.1
    );
}

/// The same check through the fixed-σ entry point the task names,
/// [`kshana::lunar_service::lunar_protection_level`], for every fixture case generated
/// at the LunaNet-class `LUNAR_SIGMA_URE_M`. The two entry points are documented to
/// agree bit-for-bit at that σ; this proves the *public* one reaches the oracle, not
/// only its `_with_sigma` sibling.
#[test]
fn the_fixed_sigma_entry_point_matches_the_external_oracle() {
    let mut checked = 0usize;
    for c in parse_fixture() {
        if c.sigma_ure_m != LUNAR_SIGMA_URE_M {
            continue;
        }
        let pl = lunar_protection_level(c.site(), &c.sats_mcmf, c.budget())
            .unwrap_or_else(|| panic!("case {}: protection level returned None", c.label));
        assert!(
            (pl.hpl_m - c.hpl_m).abs() < PL_ABS_TOL_M && (pl.vpl_m - c.vpl_m).abs() < PL_ABS_TOL_M,
            "case {}: HPL {:.12}/{:.12}, VPL {:.12}/{:.12}",
            c.label,
            pl.hpl_m,
            c.hpl_m,
            pl.vpl_m,
            c.vpl_m
        );
        checked += 1;
    }
    assert!(
        checked >= 5,
        "only {checked} fixture cases run at the LunaNet-class sigma — the fixed-sigma \
         entry point is barely covered"
    );
}

/// Stale-fixture guard. The committed geometry must still be the geometry the engine's
/// own illustrative Moonlight/LCNS-class service volume produces for
/// [`DUMP_CASES`] — otherwise the oracle would keep agreeing with a snapshot of a
/// constellation the engine no longer has, and the green would mean nothing. Exact
/// equality: both sides are the same `f64` from the same propagator, and the fixture
/// carries all 17 significant digits.
#[test]
fn the_fixture_geometry_is_still_the_engines_own_service_volume() {
    let cases = parse_fixture();
    assert_eq!(cases.len(), DUMP_CASES.len(), "fixture case count drifted");
    for (c, &(label, n, t_s, lat, lon, alt, mask, sigma, phv, phh, pfa)) in
        cases.iter().zip(DUMP_CASES)
    {
        assert_eq!(c.label, label, "fixture case order drifted");
        assert_eq!(c.sigma_ure_m, sigma, "case {label}");
        assert_eq!(
            (c.p_hmi_vert, c.p_hmi_horz, c.p_fa),
            (phv, phh, pfa),
            "case {label}"
        );
        let site = Selenographic {
            lat_rad: lat.to_radians(),
            lon_rad: lon.to_radians(),
            alt_m: alt,
        };
        let user = kshana::lunar::selenographic_to_mcmf(site);
        assert_eq!(user, c.user_mcmf, "case {label}: user point drifted");
        let all = LunarConstellation::illustrative_lcns(n).positions_mcmf(t_s);
        let vis = visible_sat_positions(user, &all, mask.to_radians());
        assert_eq!(
            vis, c.sats_mcmf,
            "case {label}: the engine's visible-satellite geometry no longer matches the \
             committed fixture — regenerate it with the generator script"
        );
    }
}

/// The geometry-to-covariance step alone: kshana's dilution-of-precision factors
/// against the ones read off RTKLIB's own `(GᵀG)⁻¹` on the identical geometry. This
/// separates a covariance/projection error from a statistical-kernel error, so a
/// failure of the headline test can be attributed.
#[test]
fn geometry_covariance_matches_the_rtklib_lu_inverse() {
    let mut worst = 0.0_f64;
    for c in parse_fixture() {
        let d = dop(c.user_mcmf, &c.sats_mcmf)
            .unwrap_or_else(|| panic!("case {}: dop returned None", c.label));
        for (name, got, want) in [
            ("HDOP", d.hdop, c.hdop),
            ("VDOP", d.vdop, c.vdop),
            ("PDOP", d.pdop, c.pdop),
            ("GDOP", d.gdop, c.gdop),
            ("TDOP", d.tdop, c.tdop),
        ] {
            let rel = (got - want).abs() / want.abs();
            worst = worst.max(rel);
            assert!(
                rel < DOP_REL_TOL,
                "case {} {name}: kshana {got:.15e} vs RTKLIB {want:.15e} (rel {rel:.3e})",
                c.label
            );
        }
    }
    println!("worst DOP relative |Δ| vs RTKLIB (GᵀG)⁻¹ = {worst:.3e}");
}

/// The detection-threshold multiplier alone: kshana's bisected `normal_quantile`
/// against SciPy's `norm.isf` for the Bonferroni-split false-alert budget.
#[test]
fn detector_multiplier_matches_the_scipy_normal_quantile() {
    let mut worst = 0.0_f64;
    for c in parse_fixture() {
        let n = c.sats_mcmf.len() as f64;
        let got = normal_quantile(1.0 - c.p_fa / (2.0 * n));
        let rel = (got - c.k_fa).abs() / c.k_fa.abs();
        worst = worst.max(rel);
        assert!(
            rel < KFA_REL_TOL,
            "case {}: K_fa kshana {got:.15e} vs SciPy {:.15e} (rel {rel:.3e})",
            c.label,
            c.k_fa
        );
    }
    println!("worst K_fa relative |Δ| vs SciPy norm.isf = {worst:.3e}");
}

/// Negative control on the geometry. Moving one satellite by 5 km — a 4e-4 fraction of
/// its slant range, far too small to be a typo anyone would notice by eye — must push
/// the protection level outside [`PL_ABS_TOL_M`] of the oracle value for the
/// *unperturbed* geometry. Without this, a tolerance that happened to be wider than the
/// physics would let the headline test pass on the wrong geometry.
#[test]
fn a_perturbed_geometry_must_fail() {
    for c in parse_fixture() {
        let mut sats = c.sats_mcmf.clone();
        sats[0][0] += 5_000.0;
        let pl = lunar_protection_level_with_sigma(c.site(), &sats, c.sigma_ure_m, c.budget())
            .unwrap_or_else(|| panic!("case {}: perturbed run returned None", c.label));
        let dh = (pl.hpl_m - c.hpl_m).abs();
        let dv = (pl.vpl_m - c.vpl_m).abs();
        assert!(
            dh > PL_ABS_TOL_M && dv > PL_ABS_TOL_M,
            "case {}: a 5 km satellite shift moved HPL by only {dh:.3e} m and VPL by \
             only {dv:.3e} m — the check would pass on the wrong geometry",
            c.label
        );
        println!(
            "case {}: 5 km shift moves HPL by {dh:.3e} m, VPL by {dv:.3e} m",
            c.label
        );
    }
}

/// Negative control on the ranging budget. The protection level is homogeneous in
/// σ_URE at zero nominal bias, so a 1-part-in-10⁶ change in σ must move it by about the
/// same relative amount and leave the oracle comparison failing. This also pins the
/// direction: a *larger* σ can only give a *larger* protection level.
#[test]
fn a_perturbed_sigma_must_fail() {
    for c in parse_fixture() {
        let sigma = c.sigma_ure_m * (1.0 + 1e-6);
        let pl = lunar_protection_level_with_sigma(c.site(), &c.sats_mcmf, sigma, c.budget())
            .unwrap_or_else(|| panic!("case {}: perturbed run returned None", c.label));
        let dh = pl.hpl_m - c.hpl_m;
        let dv = pl.vpl_m - c.vpl_m;
        assert!(
            dh > PL_ABS_TOL_M && dv > PL_ABS_TOL_M,
            "case {}: a 1e-6 relative σ_URE increase moved HPL by only {dh:.3e} m and \
             VPL by only {dv:.3e} m",
            c.label
        );
        println!(
            "case {}: +1e-6 relative σ moves HPL by {dh:.3e} m, VPL by {dv:.3e} m",
            c.label
        );
    }
}

/// Negative control on the integrity-risk budget. Tightening `P_HMI` by one part in a
/// thousand must raise both protection levels beyond the tolerance — so the fixture's
/// budget columns are genuinely load-bearing and not silently ignored.
#[test]
fn a_perturbed_integrity_budget_must_fail() {
    for c in parse_fixture() {
        let budget = IntegrityBudget {
            p_hmi_vert: c.p_hmi_vert * 0.999,
            p_hmi_horz: c.p_hmi_horz * 0.999,
            p_fa: c.p_fa,
        };
        let pl = lunar_protection_level_with_sigma(c.site(), &c.sats_mcmf, c.sigma_ure_m, budget)
            .unwrap_or_else(|| panic!("case {}: perturbed run returned None", c.label));
        let dh = pl.hpl_m - c.hpl_m;
        let dv = pl.vpl_m - c.vpl_m;
        assert!(
            dh > PL_ABS_TOL_M && dv > PL_ABS_TOL_M,
            "case {}: a 0.1 % tighter P_HMI moved HPL by only {dh:.3e} m and VPL by \
             only {dv:.3e} m",
            c.label
        );
        println!(
            "case {}: 0.1 % tighter P_HMI moves HPL by {dh:.3e} m, VPL by {dv:.3e} m",
            c.label
        );
    }
}

// ---------------------------------------------------------------------------
// Fixture regeneration
// ---------------------------------------------------------------------------

/// (label, n_sats, t_s, lat_deg, lon_deg, alt_m, mask_deg, sigma_ure_m, p_hmi_vert,
/// p_hmi_horz, p_fa) — the modelled inputs the fixture geometry is dumped from.
type DumpCase = (
    &'static str,
    usize,
    f64,
    f64,
    f64,
    f64,
    f64,
    f64,
    f64,
    f64,
    f64,
);

/// The service-volume points the fixture covers: south-polar (the Artemis target
/// region), mid-latitude, equatorial and a raised highland site; 6 to 19 satellites in
/// view, σ_URE from 10 to 60 m, and `P_HMI` from 1e-3 to 1e-7 so the integrity-risk
/// root is exercised from the shallow tail down to `Q(z) ≈ 5e-8`.
const DUMP_CASES: &[DumpCase] = &[
    (
        "south-pole-n8-t0",
        8,
        0.0,
        -89.5,
        0.0,
        0.0,
        5.0,
        30.0,
        1e-4,
        1e-4,
        1e-5,
    ),
    (
        "south-pole-n12-t21600",
        12,
        21600.0,
        -85.0,
        45.0,
        0.0,
        5.0,
        30.0,
        1e-4,
        1e-4,
        1e-5,
    ),
    (
        "midlat-n12-t10800",
        12,
        10800.0,
        -60.0,
        -120.0,
        0.0,
        5.0,
        30.0,
        1e-4,
        1e-4,
        1e-5,
    ),
    (
        "equator-n24-t43200",
        24,
        43200.0,
        0.0,
        90.0,
        0.0,
        5.0,
        30.0,
        1e-4,
        1e-4,
        1e-5,
    ),
    (
        "minredundancy-n12-t0",
        12,
        0.0,
        -30.0,
        150.0,
        0.0,
        5.0,
        30.0,
        1e-4,
        1e-4,
        1e-5,
    ),
    (
        "highland-n16-t43200",
        16,
        43200.0,
        -70.0,
        170.0,
        2000.0,
        10.0,
        10.0,
        1e-7,
        1e-7,
        1e-6,
    ),
    (
        "south-pole-n24-t64800",
        24,
        64800.0,
        -88.0,
        -30.0,
        0.0,
        5.0,
        60.0,
        1e-3,
        1e-3,
        1e-4,
    ),
];

/// Dump the modelled geometry the external oracle is run on. Not part of the suite —
/// it produces the *input* half of the fixture, not a check. Run it as
/// `cargo test --test lunar_protection_level_reference -- --ignored --nocapture
/// dump_lunar_protection_level_geometry`, or let
/// `tests/fixtures/lunar_protection_level/generate_lunar_protection_level_reference.sh`
/// drive the whole regeneration.
#[test]
#[ignore = "fixture geometry dumper, not a check; see the generator script"]
fn dump_lunar_protection_level_geometry() {
    for &(label, n, t_s, lat, lon, alt, mask, sigma, phv, phh, pfa) in DUMP_CASES {
        let site = Selenographic {
            lat_rad: lat.to_radians(),
            lon_rad: lon.to_radians(),
            alt_m: alt,
        };
        let user = kshana::lunar::selenographic_to_mcmf(site);
        let all = LunarConstellation::illustrative_lcns(n).positions_mcmf(t_s);
        let vis = visible_sat_positions(user, &all, mask.to_radians());
        println!(
            "CASE {label} {} {sigma:.17e} {phv:.17e} {phh:.17e} {pfa:.17e}",
            vis.len()
        );
        println!("USER {:.17e} {:.17e} {:.17e}", user[0], user[1], user[2]);
        for s in &vis {
            println!("SAT {:.17e} {:.17e} {:.17e}", s[0], s[1], s[2]);
        }
    }
}
