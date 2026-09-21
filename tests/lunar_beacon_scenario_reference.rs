// SPDX-License-Identifier: AGPL-3.0-only
//! Drift guard for the `lunar-beacon` scenario, and for the figures its
//! verification-matrix row publishes.
//!
//! ## Why this exists
//!
//! The scenario kind shipped with its matrix row quoting MEASURED figures — PDOP 9.6941,
//! a 3-D 1-sigma of 11.222 m, the 2.355x and 4.002x improvement factors. Nothing pinned
//! them. The units gate runs the scenario, the doc-sync guards check the counts, and the
//! bundled-example guard checks the file exists, but not one of them reads a number out
//! of the run. So the engine could drift and the published row would keep asserting the
//! old figures, in prose, indefinitely.
//!
//! That is the same shape as the stale-count defect this campaign already found on the
//! README and the provenance diagram: a claim in text with no machine link back to the
//! thing it describes. This test is that link.
//!
//! ## What it checks
//!
//! 1. The scenario runs through the public dispatch entry (`api::run_toml`) on the
//!    committed `scenarios/lunar-beacon.toml`, not through a hand-built struct — so the
//!    kind, the registry entry, the TOML and the runner are all exercised together.
//! 2. Every emitted figure reproduces its committed value.
//! 3. The structural facts the scenario exists to demonstrate hold, independently of the
//!    exact magnitudes: beacons improve the geometry, a larger constellation improves it
//!    more here, and the VISIBLE beacon count is smaller than the configured one.
//! 4. Every figure the matrix row quotes in prose is present in the live run, at the
//!    precision the row quotes it. This is the anti-staleness link: edit the engine
//!    without editing the row and this fails by name.

use kshana::api::run_toml;
use kshana::verification::verification_matrix;

/// A DOP's last ULPs are platform-dependent, so the committed figures are reproduced to a
/// tight relative tolerance rather than bit-for-bit. Matches the tolerance the sibling
/// golden (`tests/validate_p2_beacon_before_after_table.rs`) uses for the same reason.
const REL_TOL: f64 = 1e-9;

const SCENARIO: &str = include_str!("../scenarios/lunar-beacon.toml");

fn close(got: f64, want: f64, what: &str) {
    let denom = want.abs().max(1.0);
    let rel = (got - want).abs() / denom;
    assert!(
        rel <= REL_TOL,
        "{what}: got {got:.12}, committed {want:.12} (relative {rel:.3e} > {REL_TOL:.0e})"
    );
}

fn run() -> serde_json::Value {
    let out = run_toml(SCENARIO).expect("the bundled lunar-beacon scenario must run");
    serde_json::from_str(&out.json).expect("the report must be valid JSON")
}

/// Line index of the first real `[[beacons]]` TABLE HEADER, ignoring comments.
///
/// A plain `SCENARIO.find("[[beacons]]")` is wrong and was: the file carries a comment
/// warning that scalars must stay above `[[beacons]]`, and that comment is the first
/// literal match. The probe then measured the comment's position and reported correct
/// keys as misplaced. Parse lines, skip comments.
fn first_beacons_header_line() -> usize {
    SCENARIO
        .lines()
        .position(|l| l.trim_start().starts_with("[[beacons]]"))
        .expect("the bundled scenario declares beacons as an array of tables")
}

/// How many real `[[beacons]]` headers the document has, comments excluded.
fn beacon_header_count() -> usize {
    SCENARIO
        .lines()
        .filter(|l| l.trim_start().starts_with("[[beacons]]"))
        .count()
}

/// Line index of a top-level assignment `key = ...`, comments excluded.
fn scalar_key_line(key: &str) -> usize {
    SCENARIO
        .lines()
        .position(|l| !l.trim_start().starts_with('#') && l.starts_with(&format!("{key} =")))
        .unwrap_or_else(|| panic!("the bundled scenario must set {key} at the document root"))
}

#[test]
fn the_bundled_scenario_reproduces_its_committed_figures() {
    let v = run();
    let rows = v["rows"].as_array().expect("rows array");
    assert_eq!(rows.len(), 3, "the report is a three-configuration table");

    // PIN-SCOPE:    every numeric figure the `lunar-beacon` scenario emits for the
    //               COMMITTED scenarios/lunar-beacon.toml — the three DOP triples, the
    //               three realised-accuracy sets, the visible-source counts, the ranging
    //               budget and the two improvement factors. It exists because the
    //               verification-matrix row quotes several of these in prose, and nothing
    //               else reads a number out of a run.
    // PIN-EXCLUDES: nothing in this document, deliberately. Every emitted numeric leaf is
    //               covered. The SVG and the summary text are not pinned here (the summary
    //               is prose over these same values, and the chart is a rendering of them);
    //               and no figure for any OTHER input is pinned, so the scenario stays free
    //               to be run with different geometry without touching this test.
    let expect: &[(&str, usize, usize, [f64; 5], [f64; 4])] = &[
        (
            "6 satellites, no beacons",
            5,
            0,
            [11.662731, 9.694147, 3.486828, 9.045359, 6.484043],
            [11.221786, 4.036295, 10.470760, 7.505823],
        ),
        (
            "6 satellites + 1 visible beacons",
            5,
            1,
            [4.997897, 4.116042, 1.972144, 3.612818, 2.834990],
            [4.764663, 2.282922, 4.182139, 3.281738],
        ),
        (
            "24 satellites, no beacons",
            19,
            0,
            [2.892868, 2.422588, 1.019902, 2.197438, 1.581060],
            [2.804349, 1.180622, 2.543718, 1.830210],
        ),
    ];

    for (i, (label, n_sats, n_beacons, dop, acc)) in expect.iter().enumerate() {
        let r = &rows[i];
        assert_eq!(r["label"].as_str(), Some(*label), "row {i} label");
        assert_eq!(
            r["n_visible_sats"].as_u64(),
            Some(*n_sats as u64),
            "row {i} visible satellites"
        );
        assert_eq!(
            r["n_visible_beacons"].as_u64(),
            Some(*n_beacons as u64),
            "row {i} visible beacons"
        );
        for (key, want) in ["gdop", "pdop", "hdop", "vdop", "tdop"].iter().zip(dop) {
            let got = r["dop"][key].as_f64().expect("a DOP component");
            // 6 committed decimals, so compare at that precision rather than pretending
            // the committed literal carries more.
            close(
                (got * 1e6).round() / 1e6,
                *want,
                &format!("row {i} dop.{key}"),
            );
        }
        for (key, want) in ["pos_3d_m", "horizontal_m", "vertical_m", "time_m"]
            .iter()
            .zip(acc)
        {
            let got = r["accuracy"][key].as_f64().expect("an accuracy component");
            close(
                (got * 1e6).round() / 1e6,
                *want,
                &format!("row {i} accuracy.{key}"),
            );
        }
    }

    close(
        v["sigma_ure_m"].as_f64().expect("sigma_ure_m"),
        1.157_583_690_279_022_6,
        "sigma_ure_m",
    );
    close(
        v["beacon_pdop_improvement"]
            .as_f64()
            .expect("beacon factor"),
        2.355_210_608_819_964,
        "beacon_pdop_improvement",
    );
    close(
        v["constellation_pdop_improvement"]
            .as_f64()
            .expect("constellation factor"),
        4.001_565_613_845_625,
        "constellation_pdop_improvement",
    );

    let units = v["units"].as_object().expect("a units block");
    assert_eq!(
        units.len(),
        16,
        "every numeric leaf carries a units entry; tests/field_units_global.rs enforces \
         the coverage, this pins the count so a silently dropped entry is visible here too"
    );
}

/// The magnitudes above are one geometry's. These are the facts the scenario exists to
/// show, and they must hold for reasons, not by coincidence of the pinned numbers.
#[test]
fn the_structural_claims_hold_independently_of_the_magnitudes() {
    let v = run();
    let rows = v["rows"].as_array().expect("rows");
    let pdop = |i: usize| rows[i]["dop"]["pdop"].as_f64().expect("pdop");

    assert!(
        pdop(1) < pdop(0),
        "adding surface beacons must improve the position geometry: bare {:.4}, \
         augmented {:.4}",
        pdop(0),
        pdop(1)
    );
    assert!(
        pdop(2) < pdop(0),
        "a larger constellation must also improve it: bare {:.4}, expanded {:.4}",
        pdop(0),
        pdop(2)
    );

    // The airless horizon really does cull beacons on this geometry, and the report says
    // so. If this ever stops being true the scenario's own documentation (and the matrix
    // row) claim something that no longer happens.
    let configured = beacon_header_count();
    let visible = rows[1]["n_visible_beacons"].as_u64().expect("visible") as usize;
    assert_eq!(configured, 3, "the bundled file configures three beacons");
    assert!(
        visible < configured,
        "the airless two-height horizon must cull at least one configured beacon on this \
         geometry (configured {configured}, visible {visible}); the report deliberately \
         prints the visible count for exactly this reason"
    );

    // A row with no solution must carry no accuracy, and one with a solution must carry
    // one: an accuracy without a DOP behind it would be a number from nowhere.
    for (i, r) in rows.iter().enumerate() {
        assert_eq!(
            r["dop"].is_null(),
            r["accuracy"].is_null(),
            "row {i}: accuracy and DOP must be present or absent together"
        );
    }
}

/// The matrix row quotes figures in prose. Prose does not recompute itself, so pin it to
/// the run: edit the engine without editing the row and this fails, naming the figure.
#[test]
fn the_matrix_row_quotes_figures_the_engine_still_produces() {
    let v = run();
    let rows = v["rows"].as_array().expect("rows");

    let row = verification_matrix()
        .into_iter()
        .find(|i| i.module == "lunar_beacon")
        .expect("lunar_beacon must have a verification-matrix row");
    let prose = format!("{} {}", row.capability, row.oracle);

    let f = |i: usize, path: [&str; 2]| rows[i][path[0]][path[1]].as_f64().expect("field");
    let quoted: Vec<String> = vec![
        format!("PDOP {:.4}", f(0, ["dop", "pdop"])),
        format!("{:.3} m", f(0, ["accuracy", "pos_3d_m"])),
        format!("PDOP {:.4}", f(1, ["dop", "pdop"])),
        format!("{:.3} m", f(1, ["accuracy", "pos_3d_m"])),
        format!("PDOP {:.4}", f(2, ["dop", "pdop"])),
        format!("{:.3} m", f(2, ["accuracy", "pos_3d_m"])),
        format!(
            "{:.3}",
            v["beacon_pdop_improvement"].as_f64().expect("factor")
        ),
        format!(
            "{:.3}",
            v["constellation_pdop_improvement"]
                .as_f64()
                .expect("factor")
        ),
    ];

    let missing: Vec<&String> = quoted.iter().filter(|q| !prose.contains(*q)).collect();
    assert!(
        missing.is_empty(),
        "the lunar_beacon matrix row quotes figures the engine no longer produces: {missing:?}\n\
         The row's prose is a published claim with no machine link back to the run unless \
         this test provides one. Re-read the run and update the row, or explain in the row \
         why the figure changed."
    );

    // A guard that cannot fail is decorative: prove the prose really is being searched.
    assert!(
        prose.contains("PDOP"),
        "the matrix row no longer quotes any PDOP figure, so this guard is now watching \
         nothing. Either the row was rewritten without figures (then delete this test and \
         say why) or the wrong row was matched."
    );
}

/// The bundled file must actually be READ, not silently defaulted.
///
/// This exists because it was not. Every scalar key in the bundled scenario was originally
/// written below the `[[beacons]]` array, and TOML gives a bare key after an
/// array-of-tables header to that TABLE rather than to the document root. So
/// `n_satellites`, `elevation_mask_deg` and the whole ranging budget parsed as fields of
/// the LAST beacon, where serde dropped them without a word. The scenario ran entirely on
/// its defaults — and because the defaults happened to equal what the file said, every
/// printed number was correct and nothing looked wrong. A pinned-output test cannot catch
/// that on its own: it pins the same numbers either way.
///
/// Three independent checks, because any one of them alone can be satisfied vacuously.
#[test]
fn the_scenario_file_is_read_and_not_silently_defaulted() {
    // 1. STRUCTURAL: every scalar key sits above the array-of-tables splice point.
    let splice = first_beacons_header_line();
    for key in [
        "n_satellites",
        "comparison_n_satellites",
        "epoch_s",
        "elevation_mask_deg",
        "clock_sync_m",
        "multipath_m",
        "survey_m",
    ] {
        let at = scalar_key_line(key);
        assert!(
            at < splice,
            "{key} is written on line {}, below the first [[beacons]] header on line {}. \
             TOML would parse it as a field of that beacon, not of the document. Move it above.",
            at + 1,
            splice + 1
        );
    }

    // 2. BEHAVIOURAL: changing a value in the document changes the run. This is the check
    //    the original defect would have failed, and the only one that proves the parse
    //    reaches the engine rather than merely being well-formed.
    let bumped = SCENARIO.replace("multipath_m = 0.5", "multipath_m = 0.9");
    assert_ne!(bumped, SCENARIO, "the substitution must have applied");
    let out = run_toml(&bumped).expect("the edited scenario must still run");
    let v: serde_json::Value = serde_json::from_str(&out.json).expect("valid JSON");
    let got = v["sigma_ure_m"].as_f64().expect("sigma_ure_m");
    // sqrt(1.0^2 + 0.9^2 + 0.3^2)
    let want = (1.0_f64 + 0.81 + 0.09).sqrt();
    assert!(
        (got - want).abs() < 1e-12,
        "editing multipath_m must move sigma_URE: got {got:.12}, expected {want:.12}. \
         If this reads 1.157583690279 the document is being ignored and the engine is \
         running on defaults again."
    );

    // 3. LOUDNESS: a scalar spliced below the beacons is refused, not absorbed. Without
    //    `deny_unknown_fields` on BeaconSite this parses happily and drops the key.
    let spliced = format!("{SCENARIO}\nelevation_mask_deg = 12.0\n");
    let err = run_toml(&spliced)
        .err()
        .expect("a scalar written after [[beacons]] must be REFUSED, not silently dropped");
    assert!(
        err.contains("elevation_mask_deg") || err.contains("unknown field"),
        "the refusal must name the offending key so the mistake is findable; got: {err}"
    );
}
