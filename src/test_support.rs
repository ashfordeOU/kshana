// SPDX-License-Identifier: AGPL-3.0-only
//! Cross-platform comparison helpers for the byte-identity guards.
//!
//! ## Why this module exists
//!
//! Several guards in this crate prove an **R1 additivity** claim — that adding a field or
//! an input did not move a single pre-existing value — by pinning the pre-change output
//! byte-for-byte: a hash, an emission length, an exact `f64` bit pattern. That is the only
//! form of the claim which cannot quietly re-baseline itself, and it must be kept.
//!
//! The pins were all captured on one host: aarch64 macOS. They then ran nowhere else,
//! because the repository's own gate runs here. When CI finally executed them on x86-64
//! Linux they failed — not because anything regressed, but because the two hosts do not
//! agree in the last ulp.
//!
//! The cause is not the arithmetic. Rust emits IEEE-754 `f64` add/mul/div/sqrt and does
//! not contract them into FMA, so those are bit-identical everywhere. It is the
//! **transcendentals**: `sin`, `cos`, `exp`, `ln`, `powf` are not correctly rounded, and
//! each platform's libm rounds them its own way. Anything downstream of a trig call
//! therefore differs in the last place or two. Measured on the lunar differential-PNT
//! report, the worst divergence between the two hosts was **7.0e-10 relative**
//! (`reduction_factor`, 3186.429422868470 here vs 3186.429422870696 there) — amplified
//! from ulp noise by a ratio of two nearly-equal quantities.
//!
//! So "bit-for-bit unchanged" is a claim that is only meaningful **within** a platform.
//! It always was; the pins simply never ran anywhere else to reveal it.
//!
//! ## The two layers
//!
//! Guards that used to assert one thing now assert two:
//!
//! - a **portable** layer, on every platform, comparing numerically with [`REL_TOL`]. It
//!   catches any movement a real R1 violation would produce (a wired-in term moves a value
//!   by a percent, not by a part in ten million) while tolerating libm divergence with a
//!   margin of roughly 1400x over the worst case measured above.
//! - an **exact** layer, gated to [`ON_BASELINE_HOST`], keeping the original literals
//!   untouched. GitHub's `macos-latest` runners are aarch64, so this layer is still
//!   exercised in CI — on the platform where it is true.
//!
//! The literals are never re-taken to make a red go green. Finding F25 is precisely that
//! failure mode, and the pins it protects are the ones below.

/// True on the host every byte-exact literal in this crate was captured on.
///
/// Deliberately both architecture *and* OS: an x86-64 macOS host runs a different libm
/// code path than this one, and would be just as wrong to assert the pins on.
pub(crate) const ON_BASELINE_HOST: bool = cfg!(all(target_arch = "aarch64", target_os = "macos"));

/// Relative tolerance for the portable layer.
///
/// Matches the `expect_fnv_canonical` threshold the golden registry already uses ("moves
/// on any change above ~1e-6"), so the crate has one canonical-comparison scale rather
/// than a new one per guard.
pub(crate) const REL_TOL: f64 = 1e-6;

/// Absolute floor, for quantities that are a cancellation residue rather than a value.
///
/// Two hosts can disagree by 100% *relatively* on a difference of nearly-equal numbers
/// while agreeing to 1e-15 absolutely. Without this floor such a field would fail the
/// portable layer forever, and the only ways out would be to loosen `REL_TOL` for
/// everything or to stop checking the field at all.
pub(crate) const ABS_FLOOR: f64 = 1e-12;

/// Do two `f64` agree to within the portable tolerance?
///
/// NaN equals NaN here, and the infinities equal themselves: this is an *agreement*
/// predicate for two computations of the same quantity, not IEEE `==`.
pub(crate) fn close(a: f64, b: f64) -> bool {
    close_within(a, b, REL_TOL)
}

/// [`close`] at a caller-chosen relative tolerance.
///
/// Not every emission diverges by the same amount, and pretending otherwise costs either a
/// false red or a guard that checks nothing. A closed-form report diverges at the ulp, and
/// a ratio of near-equal quantities amplifies that to ~1e-9. But an emission produced by an
/// **iterative estimator** is a different regime: a least-squares fit whose inputs differ in
/// the last place can take a slightly different path to convergence, and the divergence in
/// its output is bounded by the solver's own tolerance, not by the machine's.
///
/// That is measured, not assumed. The lunar-frame-realisation emission's absolute-value sum
/// came out as 15179.844667977733 on x86-64 Linux against 15179.742553962893 here — 6.7e-6
/// relative, nearly seven times the 1e-6 that fits every closed-form report in this crate.
pub(crate) fn close_within(a: f64, b: f64, rel: f64) -> bool {
    if a.is_nan() || b.is_nan() {
        return a.is_nan() && b.is_nan();
    }
    if a == b {
        return true;
    }
    if a.is_infinite() || b.is_infinite() {
        return false;
    }
    let diff = (a - b).abs();
    diff <= ABS_FLOOR || diff <= rel * a.abs().max(b.abs())
}

/// Compare two JSON documents structurally, with numbers compared by [`close`].
///
/// Everything that is not a number must match exactly: key sets, string values, booleans,
/// nulls and array lengths. Only the numeric leaves are given tolerance, because only the
/// numeric leaves can move under libm divergence.
///
/// Returns one line per disagreement, each naming the JSON path, so a failure says which
/// field moved rather than that some hash changed.
pub(crate) fn json_diff(got: &serde_json::Value, want: &serde_json::Value) -> Vec<String> {
    let mut out = Vec::new();
    walk(got, want, "$", &mut out);
    out
}

fn walk(got: &serde_json::Value, want: &serde_json::Value, path: &str, out: &mut Vec<String>) {
    use serde_json::Value as V;
    match (got, want) {
        (V::Number(g), V::Number(w)) => {
            // Compare through f64: serde_json distinguishes integer and float
            // representations, and a value that is 5.0 on one host can serialise as 5 on
            // the other without anything having moved.
            match (g.as_f64(), w.as_f64()) {
                (Some(g), Some(w)) => {
                    if !close(g, w) {
                        out.push(format!("  {path}: {g} vs {w}"));
                    }
                }
                _ => out.push(format!("  {path}: {g} vs {w} (not representable as f64)")),
            }
        }
        (V::Object(g), V::Object(w)) => {
            let gk: std::collections::BTreeSet<&String> = g.keys().collect();
            let wk: std::collections::BTreeSet<&String> = w.keys().collect();
            for k in gk.difference(&wk) {
                out.push(format!("  {path}.{k}: present, expected absent"));
            }
            for k in wk.difference(&gk) {
                out.push(format!("  {path}.{k}: absent, expected present"));
            }
            for k in gk.intersection(&wk) {
                walk(&g[*k], &w[*k], &format!("{path}.{k}"), out);
            }
        }
        (V::Array(g), V::Array(w)) => {
            if g.len() != w.len() {
                out.push(format!("  {path}: length {} vs {}", g.len(), w.len()));
                return;
            }
            for (i, (gi, wi)) in g.iter().zip(w).enumerate() {
                walk(gi, wi, &format!("{path}[{i}]"), out);
            }
        }
        (g, w) => {
            if g != w {
                out.push(format!("  {path}: {g} vs {w}"));
            }
        }
    }
}

/// A text emission reduced to the part that cannot move between platforms.
///
/// Every numeric literal — sign, digits, decimal point and exponent — collapses to a
/// single `#`. What survives is the document's shape: its keys, its prose, its punctuation
/// and its SVG element structure. That skeleton is byte-identical on every host, because
/// the only thing that differs is digits, including *how many* digits shortest-roundtrip
/// formatting emits for a value one ulp away.
///
/// Returned alongside it: how many numeric tokens were found, and the sum of their
/// absolute values. The count pins the document's arity, and the absolute sum moves if any
/// single value does — absolute because a signed sum could let two movements cancel.
pub(crate) fn numeric_skeleton(s: &str) -> (String, usize, f64) {
    let b = s.as_bytes();
    let mut skel = String::with_capacity(s.len());
    let mut count = 0usize;
    let mut abs_sum = 0.0_f64;
    let mut i = 0usize;
    while i < b.len() {
        // A digit only starts a NUMBER if it is not embedded in an identifier. Without
        // this, the hex scenario fingerprint in the SVG footer ("scenario f62e71c040b1")
        // yields `62e71` — six point two times ten to the seventy-first — and
        // "e9e14592e352" yields `9e14592`, which overflows to infinity. Both were
        // observed; both silently poisoned the aggregate this function returns.
        // `.` counts as an identifier character here so that a dotted version — "v0.26.0"
        // — does not hand its patch segment over as the number 26.0.
        let prev_is_ident =
            i > 0 && (b[i - 1].is_ascii_alphanumeric() || b[i - 1] == b'_' || b[i - 1] == b'.');
        let starts_number = !prev_is_ident
            && (b[i].is_ascii_digit()
                || ((b[i] == b'-' || b[i] == b'.')
                    && i + 1 < b.len()
                    && b[i + 1].is_ascii_digit()));
        if !starts_number {
            skel.push(b[i] as char);
            i += 1;
            continue;
        }
        let start = i;
        if b[i] == b'-' {
            i += 1;
        }
        while i < b.len() && b[i].is_ascii_digit() {
            i += 1;
        }
        if i < b.len() && b[i] == b'.' {
            i += 1;
            while i < b.len() && b[i].is_ascii_digit() {
                i += 1;
            }
        }
        // An exponent only counts if it is actually followed by digits, so the `e` in a
        // word touching a number is not swallowed.
        if i < b.len() && (b[i] == b'e' || b[i] == b'E') {
            let mut j = i + 1;
            if j < b.len() && (b[j] == b'+' || b[j] == b'-') {
                j += 1;
            }
            if j < b.len() && b[j].is_ascii_digit() {
                while j < b.len() && b[j].is_ascii_digit() {
                    j += 1;
                }
                i = j;
            }
        }
        // ...and it only ENDS a number if an identifier character does not follow it, so
        // "10px", "50s" and "v0" are text rather than measurements.
        if i < b.len() && (b[i].is_ascii_alphanumeric() || b[i] == b'_') {
            skel.push_str(&s[start..i]);
            continue;
        }
        if let Ok(v) = s[start..i].parse::<f64>() {
            abs_sum += v.abs();
        }
        count += 1;
        skel.push('#');
    }
    (skel, count, abs_sum)
}

/// FNV-1a over bytes. Small, dependency-free, and stable across platforms and releases —
/// the properties a pin needs. Not a cryptographic hash and not used as one.
pub(crate) fn fnv1a64(bytes: &[u8]) -> u64 {
    let mut h: u64 = 0xcbf2_9ce4_8422_2325;
    for &x in bytes {
        h ^= x as u64;
        h = h.wrapping_mul(0x1000_0000_01b3);
    }
    h
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn close_tolerates_libm_divergence_but_not_a_real_move() {
        // The worst divergence actually measured between the two hosts.
        assert!(close(3_186.429_422_868_470_3, 3_186.429_422_870_696));
        // A part-per-million move is the smallest thing worth calling a regression.
        assert!(!close(1.0, 1.000_01));
        assert!(!close(100.0, 101.0));
    }

    #[test]
    fn close_handles_cancellation_residue_and_non_finite() {
        assert!(
            close(1e-15, -3e-15),
            "a cancellation residue is not a value"
        );
        assert!(close(f64::NAN, f64::NAN));
        assert!(close(f64::INFINITY, f64::INFINITY));
        assert!(!close(f64::INFINITY, f64::NEG_INFINITY));
        assert!(!close(f64::NAN, 0.0));
    }

    #[test]
    fn json_diff_names_the_field_that_moved_and_ignores_ulp_noise() {
        let a = serde_json::json!({"a": 1.0, "b": [1.0, 2.0], "s": "x"});
        let b = serde_json::json!({"a": 1.000_000_000_1, "b": [1.0, 2.0], "s": "x"});
        assert!(json_diff(&a, &b).is_empty(), "1e-10 is libm noise");

        let c = serde_json::json!({"a": 1.5, "b": [1.0, 2.0], "s": "x"});
        let d = json_diff(&c, &b);
        assert_eq!(d.len(), 1, "{d:?}");
        assert!(d[0].contains("$.a"), "{d:?}");

        // Structure is never given tolerance.
        let e = serde_json::json!({"a": 1.0, "b": [1.0], "s": "x"});
        assert!(!json_diff(&e, &b).is_empty(), "array length must be exact");
        let f = serde_json::json!({"a": 1.0, "b": [1.0, 2.0], "s": "y"});
        assert!(!json_diff(&f, &b).is_empty(), "strings must be exact");
    }

    #[test]
    fn the_skeleton_is_blind_to_digits_and_only_to_digits() {
        let (s1, n1, sum1) = numeric_skeleton(r#"{"x": 0.00015393165482401966, "k": "a1"}"#);
        let (s2, n2, sum2) = numeric_skeleton(r#"{"x": 0.00015393165481908665, "k": "a1"}"#);
        assert_eq!(s1, s2, "a last-ulp difference must not reach the skeleton");
        assert_eq!(
            (n1, n2),
            (1, 1),
            "the `1` inside \"a1\" is an identifier, not a value"
        );
        assert!(close(sum1, sum2));

        // A structural change must reach it.
        let (s3, n3, _) = numeric_skeleton(r#"{"x": 1.0, "y": 2.0, "k": "a1"}"#);
        assert_ne!(s1, s3);
        assert_eq!(n3, 2);

        // Exponent forms are one token, not a number followed by a word.
        let (s4, n4, sum4) = numeric_skeleton("v=-1.5e-7 w=2E+3");
        assert_eq!(s4, "v=# w=#");
        assert_eq!(n4, 2);
        assert!(close(sum4, 1.5e-7 + 2e3));

        // REGRESSION. The SVG footer carries a hex scenario fingerprint. Read naively,
        // "f62e71c040b1" contains `62e71` = 6.2e71 and "e9e14592e352" contains `9e14592`,
        // which overflows to infinity — both seen in the real emission, and both would
        // have made the aggregate below meaningless while still looking like a number.
        let (s5, n5, sum5) = numeric_skeleton("scenario f62e71c040b1 · scenario e9e14592e352");
        assert_eq!(n5, 0, "a hex fingerprint holds no measurements");
        assert_eq!(sum5, 0.0);
        assert!(
            s5.contains("f62e71c040b1"),
            "it stays as the text it is: {s5}"
        );

        // Units attached to a number are text, not a second measurement.
        let (s6, n6, _) = numeric_skeleton("font-size:10px; dur 50s; v0.26.0");
        assert_eq!(n6, 0, "10px / 50s / v0.26.0 are identifiers: {s6}");
    }
}
