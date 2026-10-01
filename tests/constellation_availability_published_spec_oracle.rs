// SPDX-License-Identifier: AGPL-3.0-only
//! Published-specification oracle (one-sided) for the coverage and DOP maps of the preset
//! constellations (`constellation::coverage`).
//!
//! Oracle (Reference, one-sided), documents fetched 2026-10-01:
//! - BeiDou Navigation Satellite System Open Service Performance Standard, BDS-OS-PS-3.0
//!   (China Satellite Navigation Office, 2021), Table 5-16: with a 5 deg elevation mask and
//!   PDOP <= 6, over any 7-day period, PDOP availability >= 98 % averaged globally and >= 88 % at
//!   the worst point.
//!   <http://en.beidou.gov.cn/SYSTEMS/Officialdocument/202110/P020211014595952404052.pdf>
//! - Galileo Open Service Service Definition Document, issue 1.3 (November 2023), Table 20: with
//!   PDOP <= 6 and at least 4 satellites above 5 deg, over 30 days, availability >= 90 % at the
//!   average user location and >= 87 % at the worst user location.
//!   <https://www.gsc-europa.eu/sites/default/files/sites/all/files/Galileo-OS-SDD_v1.3.pdf>
//!
//! Both are minimum performance levels that include planned and unplanned outages, so a full
//! nominal constellation must meet them; the comparison is one-sided and is a weak test by design.
//! Reported, not graded: the Galileo OS SDD 1.3 Annex D Table 35 expected availability of global
//! PDOP with 24 satellites, 99.78 % at the average and the worst user location.
//!
//! Setup and tolerance, fixed before the first comparison (`research/validation-0.30`, B6
//! pre-registration, 2026-10-01): presets `beidou` (24 MEO + 3 GEO + 3 IGSO) and `beidou-meo`
//! (24 MEO) over 7 days at 300 s, preset `galileo` over 30 days at 600 s; 5 deg mask, PDOP
//! threshold 6, 5 deg global grid, no J2; global average = the area-weighted
//! `global_availability_pct`, worst point = `worst_site_availability_pct`. Pass when both BeiDou
//! presets reach >= 98 % and >= 88 %, and the Galileo preset >= 90 % and >= 87 %.
//!
//! Scope: the preset Earth constellations against the published PDOP availability standards.
//! Explicit and multi-shell designs, the Moon, Mars and run time stay outside this comparison.

use kshana::constellation::{
    body_by_name, coverage, ClockModel, ConstellationCfg, CoverageResult, CoverageSpec,
};

fn run(preset: &str, duration_s: f64, step_s: f64) -> CoverageResult {
    let body = body_by_name("earth").expect("earth");
    let cfg = ConstellationCfg {
        name: preset.to_string(),
        preset: Some(preset.to_string()),
        expanded: None,
        shell: Vec::new(),
        satellite: Vec::new(),
    };
    let built = cfg.build(&body).expect("preset builds");
    let spec = CoverageSpec {
        duration_s,
        step_s,
        mask_deg: 5.0,
        pdop_threshold: 6.0,
        grid_step_deg: 5.0,
        lat_min_deg: -90.0,
        lat_max_deg: 90.0,
        lon_min_deg: -180.0,
        lon_max_deg: 180.0,
        clock: ClockModel::PerConstellation,
        j2: false,
    };
    coverage(&body, &[built.elements], &spec, false).expect("coverage runs")
}

#[test]
fn presets_meet_the_published_dop_availability() {
    const DAY: f64 = 86_400.0;
    // (preset, window, step, published global-average floor %, published worst-point floor %)
    let cases = [
        ("beidou", 7.0 * DAY, 300.0, 98.0, 88.0, "BDS-OS-PS-3.0 Table 5-16"),
        (
            "beidou-meo",
            7.0 * DAY,
            300.0,
            98.0,
            88.0,
            "BDS-OS-PS-3.0 Table 5-16",
        ),
        ("galileo", 30.0 * DAY, 600.0, 90.0, 87.0, "Galileo OS SDD 1.3 Table 20"),
    ];
    let mut failures = Vec::new();
    for (preset, duration, step, avg_floor, worst_floor, source) in cases {
        let r = run(preset, duration, step);
        eprintln!(
            "{preset}: global PDOP<=6 availability {:.4} % (floor {avg_floor} %), worst point \
             {:.4} % (floor {worst_floor} %), {} epochs x {} cells, {source}",
            r.global_availability_pct,
            r.worst_site_availability_pct,
            r.work.epochs,
            r.work.grid_points
        );
        if preset == "galileo" {
            eprintln!(
                "galileo: reported only, OS SDD 1.3 Annex D Table 35 expects 99.78 % (AUL and \
                 WUL) with 24 satellites"
            );
        }
        if r.global_availability_pct < avg_floor || r.worst_site_availability_pct < worst_floor {
            failures.push(format!(
                "{preset}: {:.4} % / {:.4} % below {avg_floor} % / {worst_floor} % ({source})",
                r.global_availability_pct, r.worst_site_availability_pct
            ));
        }
    }
    assert!(failures.is_empty(), "{}", failures.join("\n"));
}
