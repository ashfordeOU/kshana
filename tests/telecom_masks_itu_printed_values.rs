// SPDX-License-Identifier: AGPL-3.0-only
//! ITU-T (International Telecommunication Union, Telecommunication Standardization Sector)
//! synchronisation masks against the mask values the Recommendations PRINT AS NUMBERS.
//!
//! PRE-REGISTRATION (row M101, written 2026-10-01 before any Kshana value below was computed).
//!
//! QUANTITY: the maximum time interval error (MTIE) and time deviation (TDEV) limits, and the
//! enhanced primary reference time clock class A (ePRTC-A) holdover period and time-error limit,
//! that `kshana::telecom_timing` evaluates from its transcribed tables at a stated observation
//! interval tau (or holdover time t, locked-mode duration L).
//!
//! ORACLE (Reference, P1 of docs/VALIDATION.md): the numbers the Recommendations themselves print
//! on their figures (and in one clause) at a stated tau, each a value the Recommendation computed
//! from its own table formula, not a constant of that table. Documents (freely downloadable from
//! itu.int; reading copies with SHA-256 under `~/Code/kshana-oracles/data/papers/itu-t/`, not
//! vendored; numbers cited by page and figure only):
//! - ITU-T G.8272/Y.1367 (07/2025), SHA-256 264c6906...a2d2fb90aaa;
//! - ITU-T G.8272.1/Y.1367.1 (2024) Amd. 1 (07/2025), SHA-256 4681a55b...a8b4b8c2fc8f;
//! - ITU-T G.8271.1/Y.1366.1 (2022) Amd. 3 (05/2025), SHA-256 be41e3a1...3a942d56a03.
//!
//! SELECTION RULE (fixed here, applied to every figure of the masks Kshana implements): every
//! number printed on a figure's value axis that a dashed construction line joins to the mask
//! curve, at the tau that construction line marks; every number marking a point on the curves of
//! G.8272.1 Figures V.1 to V.3 (which have no dashed lines but label their end points); and the
//! one worked conversion in G.8272.1 clause 8.2.1. Axis tick labels with no construction line
//! (decade grid lines, and the unlabelled start or end of a curve) are not worked values and are
//! excluded. Figures of masks Kshana does not implement (the G.8273.2 holdover allowances) are
//! out of scope. Where tau sits on an OPEN end of a table interval, the limit is evaluated
//! 1e-9 s inside that interval.
//!
//! The values, with their location and printed precision:
//! - G.8272 Figure 1 (p. 4): PRTC-B MTIE "40ns" at tau = 54.5 s; the same construction line
//!   meets the PRTC-A curve at the same point, so PRTC-A MTIE 40 ns at 54.5 s.
//! - G.8272 Figure 2 (p. 5): PRTC-A TDEV "30ns" at tau = 1 000 s (where the plateau begins);
//!   PRTC-B TDEV "5ns" at tau = 500 s.
//! - G.8272.1 Amd. 1 clause 8.2.1 (p. 6): for L < 6 days, H = "70 000 seconds or 0.81 days".
//! - G.8272.1 Amd. 1 Figure V.1 (p. 22): (L = 6 d, H = 0.8 d) open circle, i.e. L just below
//!   6 days; (6 d, 6 d); (40 d, 40 d).
//! - G.8272.1 Amd. 1 Figure V.2 (p. 23), L = 6 days: H = "518 400 s"; |dx| = "30 ns" at t = 0
//!   and "100 ns" at t = H.
//! - G.8272.1 Amd. 1 Figure V.3 (p. 23), L >= 40 days (evaluated at L = 40 and at L = 50):
//!   H = "3 456 000 s"; |dx| = "30 ns" at t = 0 and "100 ns" at t = H.
//! - G.8271.1 Amd. 3 Figure 7-2 (p. 6), reference point C: "200 ns" at tau = 1.3 s, "280 ns" at
//!   2.4 s, "580 ns" at 275 s.
//! - G.8271.1 Amd. 3 Figure 7-3 (p. 8), enhanced limits: "60.67" ns at 2.4 s, "100.72" ns at
//!   20.2 s, "200.0" ns at 211.11 s.
//! - G.8271.1 Amd. 3 Figure 7-4 (p. 9), PRTC in the access network: "44" ns at 400 s (open end of
//!   the first interval).
//!
//! TOLERANCE (fixed here): half a unit of the last printed digit of each value: 0.5 ns for the
//! integer labels, 0.05 ns for "200.0", 0.005 ns for "60.67" and "100.72", 0.5 s for "518 400 s"
//! and "3 456 000 s", 0.005 day for "0.81 days", 0.05 day for "0.8d", 0.5 day for "6d" and "40d".
//! The test passes when |Kshana - printed| <= tolerance for every included value.
//!
//! DISCLOSURE AND ONE EXCLUSION (written before Kshana was run). Deciding whether a label is a
//! worked value of the table needed a hand evaluation of each table line at the labelled tau; that
//! hand evaluation is the same arithmetic Kshana performs, so the expected outcome is largely known
//! in advance and this check is, by its nature, a check of transcription and evaluation against
//! numbers the Recommendations computed. The hand evaluation found one label that disagrees with
//! its own table: G.8271.1 Figure 7-2 prints "200 ns" at tau = 1.3 s while Table 7-1 gives
//! 100 + 75 x 1.3 = 197.5 ns there. A label that disagrees with its own table by more than its
//! tolerance is not a worked value of that table, so it is excluded from the strict test by this
//! rule and pinned instead as a finding about the Recommendation
//! (`figure_7_2_label_at_1_3_s_is_not_its_own_table_value`). The "580 ns" label at 275 s sits on
//! the tolerance boundary (Table 7-1 gives 277 + 1.1 x 275 = 579.5 ns); it is kept, with the
//! inclusive bound stated above. No other label was excluded.
//!
//! SCOPE OF A PASS: the limit values of the PRTC-A, PRTC-B, ePRTC-A holdover envelope and the three
//! G.8271.1 reference point C masks at the printed points. The ePRTC locked masks, the ePRTC-A
//! holdover MTIE/TDEV and the G.8273.2 T-BC/T-TSC limits have no printed worked value on a
//! figure and stay transcriptions; the PASS/FAIL verdict and margin logic is not an oracle quantity.
//!
//! VERDICT (2026-10-01, first run after pre-registration commit 970003ee): AGREES. All 10 mask
//! values and 13 holdover values are inside their printed half-unit, for example 39.9875 ns
//! against "40ns" (G.8272 Fig. 1), 60.67 and 100.72 ns exactly (G.8271.1 Fig. 7-3), 199.9972 ns
//! against "200.0", 579.5 ns against "580 ns" (on the inclusive bound, as disclosed above),
//! 518 400 s and 3 456 000 s exactly and 0.810185 day against "0.81 days". MUTATION: changing the
//! G.8271.1 Table 7-2 slope 2.25 to 2.26 ns/s in `telecom_timing` moves the 20.2 s value to
//! 100.922 ns and turns this test red; reverted by editing the file back. The excluded Figure 7-2
//! label is pinned by `figure_7_2_label_at_1_3_s_is_not_its_own_table_value` (Kshana and Table 7-1
//! give 197.5 ns).

use kshana::telecom_timing::{
    eprtc_a_holdover_limit_ns, eprtc_a_holdover_period_s, limit_at, mask_by_id,
};

const DAY_S: f64 = 86_400.0;
const EPS_S: f64 = 1e-9;

/// Which curve of a mask is read.
#[derive(Clone, Copy)]
enum Curve {
    Mtie,
    Tdev,
}

/// One printed value: (where, mask id, curve, tau to evaluate at, printed value, tolerance).
struct MaskPoint {
    location: &'static str,
    mask: &'static str,
    curve: Curve,
    tau_s: f64,
    printed_ns: f64,
    tol_ns: f64,
}

fn mask_points() -> Vec<MaskPoint> {
    let p = |location, mask, curve, tau_s, printed_ns, tol_ns| MaskPoint {
        location,
        mask,
        curve,
        tau_s,
        printed_ns,
        tol_ns,
    };
    vec![
        p(
            "G.8272 Fig. 1 p.4 PRTC-B",
            "prtc-b",
            Curve::Mtie,
            54.5,
            40.0,
            0.5,
        ),
        p(
            "G.8272 Fig. 1 p.4 PRTC-A",
            "prtc-a",
            Curve::Mtie,
            54.5,
            40.0,
            0.5,
        ),
        p(
            "G.8272 Fig. 2 p.5 PRTC-A",
            "prtc-a",
            Curve::Tdev,
            1000.0,
            30.0,
            0.5,
        ),
        p(
            "G.8272 Fig. 2 p.5 PRTC-B",
            "prtc-b",
            Curve::Tdev,
            500.0,
            5.0,
            0.5,
        ),
        p(
            "G.8271.1 Fig. 7-2 p.6",
            "g8271-1-point-c",
            Curve::Mtie,
            2.4,
            280.0,
            0.5,
        ),
        p(
            "G.8271.1 Fig. 7-2 p.6",
            "g8271-1-point-c",
            Curve::Mtie,
            275.0,
            580.0,
            0.5,
        ),
        p(
            "G.8271.1 Fig. 7-3 p.8",
            "g8271-1-point-c-enhanced",
            Curve::Mtie,
            2.4,
            60.67,
            0.005,
        ),
        p(
            "G.8271.1 Fig. 7-3 p.8",
            "g8271-1-point-c-enhanced",
            Curve::Mtie,
            20.2,
            100.72,
            0.005,
        ),
        p(
            "G.8271.1 Fig. 7-3 p.8",
            "g8271-1-point-c-enhanced",
            Curve::Mtie,
            211.11,
            200.0,
            0.05,
        ),
        // Open upper end of "1 < tau < 400": evaluated just inside the interval.
        p(
            "G.8271.1 Fig. 7-4 p.9",
            "g8271-1-point-c-access",
            Curve::Mtie,
            400.0 - EPS_S,
            44.0,
            0.5,
        ),
    ]
}

fn kshana_limit(pt: &MaskPoint) -> Option<f64> {
    let m = mask_by_id(pt.mask)?;
    let curve = match pt.curve {
        Curve::Mtie => m.mtie?,
        Curve::Tdev => m.tdev?,
    };
    limit_at(curve.segments, pt.tau_s)
}

/// Holdover values: (where, L days, quantity, Kshana closure input, printed, tolerance).
struct HoldoverPoint {
    location: &'static str,
    value: f64,
    printed: f64,
    tol: f64,
}

fn holdover_points() -> Vec<HoldoverPoint> {
    let h = eprtc_a_holdover_period_s;
    let lim = |l: f64, t: f64| eprtc_a_holdover_limit_ns(l, t).unwrap_or(f64::NAN);
    let mut v = vec![
        HoldoverPoint {
            location: "G.8272.1 cl. 8.2.1 p.6: L < 6 d, H in days",
            value: h(5.0) / DAY_S,
            printed: 0.81,
            tol: 0.005,
        },
        HoldoverPoint {
            location: "G.8272.1 Fig. V.1 p.22: L just below 6 d, H in days",
            value: h(6.0 - 1e-9) / DAY_S,
            printed: 0.8,
            tol: 0.05,
        },
        HoldoverPoint {
            location: "G.8272.1 Fig. V.1 p.22: L = 6 d, H in days",
            value: h(6.0) / DAY_S,
            printed: 6.0,
            tol: 0.5,
        },
        HoldoverPoint {
            location: "G.8272.1 Fig. V.1 p.22: L = 40 d, H in days",
            value: h(40.0) / DAY_S,
            printed: 40.0,
            tol: 0.5,
        },
        HoldoverPoint {
            location: "G.8272.1 Fig. V.2 p.23: L = 6 d, H in s",
            value: h(6.0),
            printed: 518_400.0,
            tol: 0.5,
        },
        HoldoverPoint {
            location: "G.8272.1 Fig. V.2 p.23: L = 6 d, |dx| at t = 0+",
            value: lim(6.0, EPS_S),
            printed: 30.0,
            tol: 0.5,
        },
        HoldoverPoint {
            location: "G.8272.1 Fig. V.2 p.23: L = 6 d, |dx| at t = H",
            value: lim(6.0, h(6.0)),
            printed: 100.0,
            tol: 0.5,
        },
    ];
    for l in [40.0, 50.0] {
        v.push(HoldoverPoint {
            location: "G.8272.1 Fig. V.3 p.23: L >= 40 d, H in s",
            value: h(l),
            printed: 3_456_000.0,
            tol: 0.5,
        });
        v.push(HoldoverPoint {
            location: "G.8272.1 Fig. V.3 p.23: L >= 40 d, |dx| at t = 0+",
            value: lim(l, EPS_S),
            printed: 30.0,
            tol: 0.5,
        });
        v.push(HoldoverPoint {
            location: "G.8272.1 Fig. V.3 p.23: L >= 40 d, |dx| at t = H",
            value: lim(l, h(l)),
            printed: 100.0,
            tol: 0.5,
        });
    }
    v
}

#[test]
fn mask_values_match_the_numbers_the_recommendations_print() {
    let mut failures = Vec::new();
    for pt in mask_points() {
        let got = kshana_limit(&pt);
        let ok = got.is_some_and(|g| (g - pt.printed_ns).abs() <= pt.tol_ns);
        println!(
            "{:<28} {:<26} tau = {:>10.4} s  printed {:>8.3} ns  kshana {:?}  {}",
            pt.location,
            pt.mask,
            pt.tau_s,
            pt.printed_ns,
            got,
            if ok { "ok" } else { "FAIL" }
        );
        if !ok {
            failures.push(pt.location);
        }
    }
    for hp in holdover_points() {
        let ok = (hp.value - hp.printed).abs() <= hp.tol;
        println!(
            "{:<52} printed {:>12.4}  kshana {:>14.6}  {}",
            hp.location,
            hp.printed,
            hp.value,
            if ok { "ok" } else { "FAIL" }
        );
        if !ok {
            failures.push(hp.location);
        }
    }
    assert!(failures.is_empty(), "outside tolerance: {failures:?}");
}

/// FINDING about the Recommendation, not about Kshana: G.8271.1 Amd. 3 Figure 7-2 (p. 6) labels the
/// start of the reference point C mask "200 ns" at tau = 1.3 s, while its own Table 7-1 gives
/// 100 + 75 x 1.3 = 197.5 ns just inside the open interval 1.3 < tau <= 2.4. Excluded from the
/// strict comparison by the pre-registered self-consistency rule; pinned here.
#[test]
fn figure_7_2_label_at_1_3_s_is_not_its_own_table_value() {
    let m = mask_by_id("g8271-1-point-c").expect("mask");
    let v = limit_at(m.mtie.expect("mtie").segments, 1.3 + EPS_S).expect("limit");
    assert!((v - 197.5).abs() < 1e-6, "Kshana gives {v} ns at 1.3 s");
    assert!(
        (v - 200.0).abs() > 0.5,
        "the printed 200 ns label is outside its half unit"
    );
}
