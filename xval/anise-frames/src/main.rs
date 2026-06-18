// SPDX-License-Identifier: AGPL-3.0-only
//! `frame-xval` — cross-validate `kshana`'s IAU 2006/2000A CIO reduction against ANISE's
//! high-precision Earth body-fixed frame (ITRF93), over a grid of epochs, both driven by
//! the SAME IERS Earth-orientation parameters. Prints a table and writes `report.json` +
//! `report.md` next to the crate. Exits non-zero if the agreement regresses past the
//! documented bounds (so the optional CI job fails on a real regression).

use kshana_anise_xval::anise_bridge::AniseEarth;
use kshana_anise_xval::kernel;
use kshana_anise_xval::xval::{self, Report};
use std::path::PathBuf;

// Regression bounds, set from the measured residual (max angle ~0.028", surface ~0.86 m,
// GPS ~3.6 m) with margin, and aligned to the ROADMAP "<10 m" target at GNSS orbit.
const MAX_ANGLE_ARCSEC: f64 = 0.1;
const MAX_SURFACE_M: f64 = 2.0;
const MAX_GPS_M: f64 = 10.0;

fn main() {
    let path = resolve_or_download();
    let earth = match AniseEarth::from_bpc_path(path.to_str().expect("utf8 path")) {
        Ok(e) => e,
        Err(e) => {
            eprintln!("error: {e}");
            std::process::exit(2);
        }
    };

    let (results, skipped) = xval::run(&earth, &xval::fixture_eop());
    let report = Report::summarize(results, skipped);
    print_table(&report);
    write_artifacts(&report);

    let pass = report.n_epochs > 0
        && report.max_angle_arcsec < MAX_ANGLE_ARCSEC
        && report.max_surface_m < MAX_SURFACE_M
        && report.max_gps_m < MAX_GPS_M;
    if pass {
        println!("\nPASS: kshana CIO vs ANISE ITRF93 within bounds (angle<{MAX_ANGLE_ARCSEC}\", surface<{MAX_SURFACE_M} m, gps<{MAX_GPS_M} m).");
    } else {
        eprintln!(
            "\nFAIL: agreement outside bounds — investigate before trusting the frame reduction."
        );
        std::process::exit(1);
    }
}

fn resolve_or_download() -> PathBuf {
    if let Some(p) = kernel::resolve_bpc() {
        eprintln!("using cached BPC: {}", p.display());
        return p;
    }
    eprintln!("no cached BPC; downloading {} ...", kernel::BPC_URL);
    match kernel::download_bpc() {
        Ok(p) => {
            eprintln!("downloaded: {}", p.display());
            p
        }
        Err(e) => {
            eprintln!("error: could not obtain the SPICE kernel: {e}");
            eprintln!("set KSHANA_ANISE_BPC to a local earth_latest_high_prec.bpc to run offline.");
            std::process::exit(2);
        }
    }
}

fn print_table(r: &Report) {
    println!("kshana CIO (GCRS->ITRS) vs ANISE ITRF93 — same IERS EOP fed to both");
    println!("reference : {}", r.anise_frame);
    println!("EOP       : {}", r.eop_source);
    println!(
        "\n{:<12} {:>11} {:>11} {:>11} {:>11} {:>11} {:>11}",
        "date", "ut1-utc(s)", "xp(\")", "yp(\")", "angle(\")", "surface(m)", "gps(m)"
    );
    for e in &r.results {
        println!(
            "{:<12} {:>11.7} {:>11.6} {:>11.6} {:>11.6} {:>11.3} {:>11.3}",
            e.date, e.ut1_utc_s, e.xp_arcsec, e.yp_arcsec, e.angle_arcsec, e.surface_m, e.gps_m
        );
    }
    println!(
        "\nMAX  angle={:.6}\"  surface={:.3} m  leo={:.3} m  gps={:.3} m   (mean angle {:.6}\", n={}{})",
        r.max_angle_arcsec,
        r.max_surface_m,
        r.max_leo_m,
        r.max_gps_m,
        r.mean_angle_arcsec,
        r.n_epochs,
        if r.skipped.is_empty() {
            String::new()
        } else {
            format!(", skipped {:?}", r.skipped)
        }
    );
}

fn write_artifacts(r: &Report) {
    let dir = PathBuf::from(env!("CARGO_MANIFEST_DIR"));
    let json = serde_json::to_string_pretty(r).expect("serialize report");
    let jpath = dir.join("report.json");
    if let Err(e) = std::fs::write(&jpath, format!("{json}\n")) {
        eprintln!("warning: could not write {}: {e}", jpath.display());
    } else {
        eprintln!("wrote {}", jpath.display());
    }
    let mpath = dir.join("report.md");
    if let Err(e) = std::fs::write(&mpath, render_markdown(r)) {
        eprintln!("warning: could not write {}: {e}", mpath.display());
    } else {
        eprintln!("wrote {}", mpath.display());
    }
}

fn render_markdown(r: &Report) -> String {
    let mut s = String::new();
    s.push_str("# Frame cross-validation: kshana CIO vs ANISE ITRF93\n\n");
    s.push_str(&format!("- Reference: {}\n", r.reference));
    s.push_str(&format!("- kshana chain: {}\n", r.kshana_chain));
    s.push_str(&format!("- ANISE frame: {}\n", r.anise_frame));
    s.push_str(&format!("- EOP source: {}\n\n", r.eop_source));
    s.push_str(&format!(
        "**Max relative angle {:.6}″ · max surface {:.3} m · max LEO {:.3} m · max GPS {:.3} m** over {} epochs.\n\n",
        r.max_angle_arcsec, r.max_surface_m, r.max_leo_m, r.max_gps_m, r.n_epochs
    ));
    s.push_str("| date | UT1−UTC (s) | xp (″) | yp (″) | angle (″) | surface (m) | GPS (m) |\n");
    s.push_str("|------|------------:|-------:|-------:|----------:|------------:|--------:|\n");
    for e in &r.results {
        s.push_str(&format!(
            "| {} | {:.7} | {:.6} | {:.6} | {:.6} | {:.3} | {:.3} |\n",
            e.date, e.ut1_utc_s, e.xp_arcsec, e.yp_arcsec, e.angle_arcsec, e.surface_m, e.gps_m
        ));
    }
    if !r.skipped.is_empty() {
        s.push_str(&format!("\nSkipped: {:?}\n", r.skipped));
    }
    s
}
