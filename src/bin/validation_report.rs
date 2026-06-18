// SPDX-License-Identifier: Apache-2.0
//! `validation_report` — emit a one-page, self-contained HTML validation summary.
//!
//! This collates Kshana's headline validation facts into a single print-ready page (a print
//! stylesheet makes a clean PDF via any headless browser, with no LaTeX or other heavy
//! dependency). Each row names the **test that enforces it in CI** and the **external oracle**
//! it is checked against, so the page is a navigable index into the validation suite rather than
//! a marketing sheet. Run it as `validation_report [out.html]` (defaults to stdout); the release
//! workflow generates `kshana-validation-summary.html` and attaches it to the tagged release.
//!
//! Honest scope: this summarises *what the suite already asserts* — it does not itself re-run the
//! physics. The authority is the cited test; if a test is removed or weakened, that is a code
//! review concern, not something this page can detect.

use std::io::Write;

/// One validated capability: (area, headline result, the CI test that enforces it, the external
/// oracle it is checked against).
const ROWS: &[(&str, &str, &str, &str)] = &[
    (
        "SGP4/SDP4 propagation",
        "666/666 AIAA vectors, worst 4.12 mm",
        "tests/sgp4_verification.rs",
        "AIAA 2006-6753 reference (Vallado tcppver.out)",
    ),
    (
        "SGP4 cross-implementation",
        "sub-micron vs the independent sgp4 crate (WGS72)",
        "tests/sgp4_crate_comparison.rs",
        "neuromorphicsystems/sgp4 2.4",
    ),
    (
        "EGM2008 gravity (d/o 70)",
        "point-mass + zonal + finite-difference oracles",
        "src/gravity_sh.rs",
        "NGA EGM2008 (ICGEM); analytic gradient identity",
    ),
    (
        "Reference frames",
        "IAU 2000A/2000B nutation, 2006 precession, CIO chain — bit-for-bit",
        "src/nutation.rs, src/cio.rs",
        "ERFA/SOFA reference routines",
    ),
    (
        "Allan estimators",
        "ADEV/MDEV/TDEV/HDEV reproduce the reference deviations",
        "tests/allan_nist_sp1065_1000point.rs",
        "NIST SP 1065 (Riley) 1000-point set",
    ),
    (
        "IMU error model",
        "ADIS16465/16488/16460 ARW/VRW/bias-instability recovered",
        "tests/imu_allan_spec.rs",
        "Manufacturer datasheets (IEEE 952 identification)",
    ),
    (
        "Integrity (ARAIM / SBAS)",
        "dual-constellation ARAIM HPL/VPL; DO-229E protection levels",
        "src/raim.rs, src/sbas.rs",
        "EU ARAIM TR; DO-229E K-factors; numpy inv(GᵀG)",
    ),
    (
        "Geometry / DOP",
        "GDOP/PDOP/HDOP/VDOP/TDOP match to 1e-6 across 8 geometries",
        "tests/dop_reference.rs",
        "gnss_lib_py 1.0.4 (Stanford NAV Lab)",
    ),
    (
        "ML evaluation metrics",
        "AUC/confusion/Pd-Pmd/precision/F1 — exact counts + <1e-9",
        "tests/eval_metrics_reference.rs",
        "scikit-learn 1.9.0 (Pedregosa et al., JMLR 2011)",
    ),
    (
        "Quantum-trade kernels",
        "ADEV NNLS fit, χ² consistency bands, van-Loan clock Q",
        "tests/scipy_reference.rs",
        "scipy 1.17.1 (optimize.nnls / stats.chi2 / linalg.expm)",
    ),
    (
        "Reproducibility",
        "input+shape goldens identical on ubuntu/macOS/windows",
        "tests/cross_platform_golden.rs",
        "3-OS CI matrix; SHA-256 goldens",
    ),
    (
        "Coverage",
        "~97% line coverage on src/, gated at 85%",
        ".github/workflows/ci.yml (coverage job)",
        "cargo-tarpaulin LLVM engine",
    ),
];

/// Build the self-contained validation-summary HTML for `version`.
fn render(version: &str) -> String {
    let mut h = String::new();
    h.push_str("<!DOCTYPE html>\n<html lang=\"en\"><head><meta charset=\"utf-8\">\n");
    h.push_str("<title>Kshana validation summary</title>\n<style>\n");
    h.push_str(
        "body{font:14px/1.5 -apple-system,Segoe UI,Roboto,sans-serif;color:#1a1a1a;\
         max-width:60rem;margin:2rem auto;padding:0 1rem}\
         h1{font-size:1.5rem;margin:0 0 .25rem}.sub{color:#555;margin:0 0 1.5rem}\
         table{border-collapse:collapse;width:100%}th,td{border:1px solid #ddd;\
         padding:.5rem .6rem;text-align:left;vertical-align:top}\
         th{background:#f5f3ee}code{font-size:.85em}.ok{color:#1a7f37;font-weight:600}\
         footer{margin-top:1.5rem;color:#777;font-size:.85em}\
         @media print{body{margin:0;max-width:none}a{color:inherit;text-decoration:none}}\n",
    );
    h.push_str("</style></head><body>\n");
    h.push_str(&format!(
        "<h1>Kshana validation summary <span class=\"ok\">{version}</span></h1>\n"
    ));
    h.push_str(
        "<p class=\"sub\">Every row below is enforced by a test in continuous integration and \
         checked against an external, authoritative oracle. This page indexes the validation \
         suite; the cited test is the source of truth.</p>\n",
    );
    h.push_str(
        "<table>\n<thead><tr><th>Capability</th><th>Result</th><th>Enforced by</th>\
                <th>External oracle</th></tr></thead>\n<tbody>\n",
    );
    for (area, result, test, oracle) in ROWS {
        h.push_str(&format!(
            "<tr><td>{}</td><td class=\"ok\">{}</td><td><code>{}</code></td><td>{}</td></tr>\n",
            esc(area),
            esc(result),
            esc(test),
            esc(oracle)
        ));
    }
    h.push_str("</tbody></table>\n");
    h.push_str(
        "<footer>Generated by <code>validation_report</code> from the Kshana test suite. \
         Honest scope: this summarises what the suite asserts; it does not itself re-run the \
         physics. See docs/VALIDATION.md and docs/CLAIMS-VS-REALITY.md.</footer>\n",
    );
    h.push_str("</body></html>\n");
    h
}

/// Minimal HTML-text escaping for the table cells.
fn esc(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
}

fn main() {
    let html = render(env!("CARGO_PKG_VERSION"));
    match std::env::args().nth(1) {
        Some(path) => {
            let mut f = std::fs::File::create(&path).expect("create output file");
            f.write_all(html.as_bytes()).expect("write report");
            eprintln!("wrote validation summary to {path}");
        }
        None => {
            print!("{html}");
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn report_is_well_formed_and_lists_every_validated_capability() {
        let h = render("v9.9.9");
        assert!(h.starts_with("<!DOCTYPE html>"));
        assert!(h.trim_end().ends_with("</html>"));
        assert!(h.contains("v9.9.9"));
        // Every capability row and its enforcing test must appear.
        for (area, _result, test, _oracle) in ROWS {
            assert!(h.contains(area), "missing capability {area}");
            assert!(h.contains(test), "missing test reference {test}");
        }
        // Headline facts.
        assert!(h.contains("666/666 AIAA vectors"));
        assert!(h.contains("bit-for-bit"));
        // Honest-scope disclaimer must be present (no overclaim).
        assert!(h.to_lowercase().contains("does not itself re-run"));
    }

    #[test]
    fn html_escaping_neutralises_markup() {
        assert_eq!(esc("a<b>&c"), "a&lt;b&gt;&amp;c");
    }
}
