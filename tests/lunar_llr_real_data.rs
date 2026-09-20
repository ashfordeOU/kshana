// SPDX-License-Identifier: AGPL-3.0-only
//! The lunar frame-datum chain end to end on **real, archived lunar laser ranging data**.
//!
//! [`kshana::lunar_frame_campaign`] replaced an injected Helmert transform with a *simulated*
//! observing campaign and said so: its Earth-station network, its schedule and its
//! per-observation sigma are illustrative inputs. This target runs the same class of
//! computation on a campaign nobody simulated — 349 archived ILRS lunar normal points from
//! 2015-04-08 to 2015-06-27, the five retroreflector arrays on the Moon, the stations that
//! really ranged to them — and checks each link of the chain against something outside it.
//!
//! ## The fixtures, and what pins each one
//!
//! | fixture | source | pinned by |
//! |---------|--------|-----------|
//! | `normal_points/*.npt` | EUROLAS Data Center (EDC), DGFI-TUM, ILRS CRD normal points | `normal_points/SHA256SUMS`, re-checkable with `fetch_llr_normal_points.sh` |
//! | `itrf2020_llr_stations.csv` | IERS ITRF2020 SLR solution | `generate_itrf2020_llr_stations.py`, which hash-verifies the solution file |
//! | `de430_retroreflectors_mer.csv` | JPL DE430 lunar-coordinates memorandum, Table 7 | `generate_de430_retroreflectors.py`, which hash-verifies the PDF |
//! | `horizons_moon_geocentric_2015.csv` | JPL Horizons, geometric geocentric Moon states | `fetch_horizons_moon.py` |
//!
//! ## The two independent routes to the same conclusion
//!
//! The engine's Moon-centre position is an analytic series, and the chain's honesty rests on
//! knowing how wrong it is. Two sources that share nothing say the same thing:
//!
//! * the **measurement** — the observed-minus-computed one-way range over 337 real normal
//!   points ([`the_measured_residual_is_the_ephemeris_error`]);
//! * the **published ephemeris** — JPL Horizons' own geocentric Moon states over the same
//!   span ([`the_analytic_moon_series_disagrees_with_jpl_by_the_same_amount`]).
//!
//! A range residual measures the *radial* part of an ephemeris error, so the like-for-like
//! comparison is against the disagreement in geocentric distance, and the test asserts the
//! two agree with each other to within 5x. That is what makes "the residual is the
//! ephemeris" a checked statement rather than an excuse.

use kshana::api::run_toml;
use serde_json::Value;
use std::path::Path;

const FIXTURES: &str = "tests/fixtures/lunar_llr";

fn report() -> Value {
    let out = run_toml("kind = \"lunar-llr-datum\"\n").expect("the real-data scenario runs");
    serde_json::from_str(&out.json).expect("the report parses")
}

fn num(v: &Value, p: &str) -> f64 {
    v.pointer(p)
        .and_then(Value::as_f64)
        .unwrap_or_else(|| panic!("no number at {p}"))
}

fn sha256_hex(bytes: &[u8]) -> String {
    use sha2::{Digest, Sha256};
    let mut h = Sha256::new();
    h.update(bytes);
    h.finalize().iter().map(|b| format!("{b:02x}")).collect()
}

/// The committed measurement files are byte-for-byte what the data centre served.
///
/// `SHA256SUMS` is written by the retrieval, and `fetch_llr_normal_points.sh` re-downloads
/// and re-checks it against the archive. This test is the offline half: it catches a fixture
/// edited in the working tree, which is the only way a "measured" number in this repository
/// could quietly stop being measured.
#[test]
fn every_committed_normal_point_file_matches_its_recorded_digest() {
    let dir = Path::new(FIXTURES).join("normal_points");
    let sums = std::fs::read_to_string(dir.join("SHA256SUMS")).expect("SHA256SUMS is committed");
    let mut n = 0;
    for line in sums.lines() {
        let (want, name) = line.split_once("  ").expect("`<digest>  <name>` line");
        let bytes = std::fs::read(dir.join(name)).unwrap_or_else(|e| panic!("{name}: {e}"));
        assert_eq!(sha256_hex(&bytes), want, "{name} has been edited");
        n += 1;
    }
    assert_eq!(n, 15, "the committed slice is fifteen monthly CRD files");
}

/// Every archived record is either used or explicitly accounted for, and the one class that
/// is dropped is dropped for a stated reason rather than silently.
#[test]
fn the_whole_archive_slice_is_accounted_for_record_by_record() {
    let v = report();
    let parsed = num(&v, "/data/normal_points_parsed");
    let used = num(&v, "/data/normal_points_used");
    let dropped = num(&v, "/data/skipped_station_not_in_catalogue")
        + num(&v, "/data/skipped_target_not_in_catalogue")
        + num(&v, "/data/skipped_epoch_event_not_ground_transmit")
        + num(&v, "/data/skipped_no_measured_precision");
    assert_eq!(
        parsed, 349.0,
        "the committed slice carries 349 normal points"
    );
    assert_eq!(
        used + dropped,
        parsed,
        "records vanished between parse and use"
    );
    // The only drops are the twelve Apache Point (7045) points: a lunar-only station that
    // the ITRF2020 SLR solution does not carry. Substituting a lower-grade coordinate for
    // them would be exactly the kind of quiet invention this fixture exists to prevent.
    assert_eq!(num(&v, "/data/skipped_station_not_in_catalogue"), 12.0);
    assert_eq!(num(&v, "/data/skipped_target_not_in_catalogue"), 0.0);
    assert_eq!(num(&v, "/data/skipped_no_measured_precision"), 0.0);
    assert_eq!(used, 337.0);
}

/// The archived time of flight really is a lunar round trip, point by point.
///
/// This is the cheapest possible proof that the committed bytes are a measurement of the
/// Moon and not a plausible-looking table: every one of the 349 records, read with no model
/// at all, must place the target between the real lunar perigee and apogee — and the set as a
/// whole must span most of that envelope, which a constant or a smooth invention would not.
#[test]
fn every_archived_range_lands_inside_the_real_perigee_apogee_envelope() {
    let dir = Path::new(FIXTURES).join("normal_points");
    let points = kshana::realdata::llr_crd::read_crd_dir(&dir).expect("the CRD slice parses");
    assert_eq!(points.len(), 349);
    let mut lo = f64::INFINITY;
    let mut hi: f64 = 0.0;
    for p in &points {
        let km = p.one_way_range_m() / 1e3;
        assert!(
            (356_000.0..407_000.0).contains(&km),
            "{} at JD {}: one-way range {km} km is not a lunar distance",
            p.target,
            p.jd_utc
        );
        lo = lo.min(km);
        hi = hi.max(km);
    }
    assert!(
        hi - lo > 25_000.0,
        "the slice spans only {:.0} km of the ~51 000 km perigee-apogee envelope; a real \
         three-month campaign sweeps most of it",
        hi - lo
    );
}

/// The weights are the files' own archived precision, in the files' own units.
#[test]
fn the_observation_weights_come_out_of_the_files() {
    let v = report();
    let ps = num(&v, "/data/median_bin_rms_ps");
    let n_raw = num(&v, "/data/median_raw_ranges_per_point");
    let mm = num(&v, "/data/median_sigma_range_mm");
    // The three are one identity: sigma = bin_rms / sqrt(n), as a one-way range.
    let want_mm = ps * 1e-12 / n_raw.sqrt() * 299_792_458.0 / 2.0 * 1e3;
    assert!(
        (mm - want_mm).abs() < 0.2 * want_mm,
        "median sigma {mm} mm is not the median bin RMS {ps} ps over sqrt({n_raw})"
    );
    // Grasse MeO and Matera MLRO made millimetre-to-centimetre normal points in 2015.
    assert!(
        (1.0..20.0).contains(&mm),
        "median normal-point sigma {mm} mm"
    );
}

/// A range measures the line of sight, so the body-fixed coordinate along the mean direction
/// to Earth must come out far better determined than the two plane-of-sky coordinates — for
/// every array, on the real schedule. Nothing in the solver was told this.
#[test]
fn the_real_schedule_determines_the_line_of_sight_coordinate_best() {
    let v = report();
    for r in v["reflectors"].as_array().expect("five arrays") {
        let along = r["sigma_along_line_of_sight_m"].as_f64().unwrap();
        let across = r["sigma_across_line_of_sight_m"].as_f64().unwrap();
        let sweep = r["libration_sweep_deg"].as_f64().unwrap();
        assert!(
            across > 10.0 * along,
            "{}: plane-of-sky sigma {across} is not far worse than line-of-sight {along}",
            r["array"]
        );
        // The separation is bought by the libration, and the real arc sampled ~10-15 deg.
        assert!(
            (5.0..20.0).contains(&sweep),
            "{}: measured libration+parallax sweep {sweep} deg",
            r["array"]
        );
        // A libration ellipse is not a disc, so the isotropic small-angle estimate of the
        // ratio is optimistic; the report prints both and the anisotropy that separates them.
        let lb = r["isotropic_sweep_ratio_lower_bound"].as_f64().unwrap();
        let ratio = r["ratio_across_over_along"].as_f64().unwrap();
        let aniso = r["principal_transverse_anisotropy"].as_f64().unwrap();
        assert!(
            ratio > lb,
            "{}: ratio {ratio} below its isotropic bound {lb}",
            r["array"]
        );
        assert!(aniso > 2.0, "{}: transverse anisotropy {aniso}", r["array"]);
    }
}

/// The observed-minus-computed range over the real data, and what it is.
///
/// It is 10⁴–10⁵ m, not millimetres: the chain is real at the measurement end and modelled at
/// the ephemeris end, and this number is exactly that gap. Publishing it is the point.
#[test]
fn the_measured_residual_is_the_ephemeris_error() {
    let v = report();
    let rms = num(&v, "/residuals/rms_m");
    assert_eq!(num(&v, "/residuals/n"), num(&v, "/data/normal_points_used"));
    assert!(
        (1.0e4..1.0e6).contains(&rms),
        "observed-minus-computed one-way RMS {rms} m: below 10 km would mean the engine \
         carries an ephemeris it does not have; above 1000 km would mean the geometry is wrong"
    );
    // No array carries an error of its own larger than the shared one: the per-array mean
    // residuals must spread by less than the overall RMS. They do not agree closely — the
    // arrays were observed at different libration phases and the ephemeris error projects
    // differently onto each line of sight — and the test says only what it can check.
    let means: Vec<f64> = v["reflectors"]
        .as_array()
        .unwrap()
        .iter()
        .map(|r| r["residual_mean_m"].as_f64().unwrap())
        .collect();
    let lo = means.iter().cloned().fold(f64::INFINITY, f64::min);
    let hi = means.iter().cloned().fold(f64::NEG_INFINITY, f64::max);
    assert!(
        hi - lo < rms,
        "the per-array mean residuals spread by {:.0} m, more than the overall RMS {rms} m — \
         that would be a per-array error, not a shared ephemeris error",
        hi - lo
    );
}

/// The same conclusion from a source that has never heard of a normal point, and the
/// engine's own stated ephemeris accuracy checked rather than repeated.
///
/// JPL Horizons' geocentric Moon states over the same span, against
/// `kshana::ephem::moon_position`. Two things are asserted: that the series meets the
/// accuracy its own module documentation claims (~0.3 deg, few 10^2 km), and that the
/// disagreement is the same size as the LLR observed-minus-computed residual — which is what
/// licenses the scenario to attribute that residual to the ephemeris.
#[test]
fn the_analytic_moon_series_disagrees_with_jpl_by_the_same_amount() {
    let text =
        std::fs::read_to_string(Path::new(FIXTURES).join("horizons_moon_geocentric_2015.csv"))
            .expect("the Horizons fixture is committed");
    let mut n = 0;
    let mut sum_sq = 0.0;
    let mut sum_sq_radial = 0.0;
    let mut worst: f64 = 0.0;
    for line in text.lines() {
        let t = line.trim();
        if t.is_empty() || t.starts_with('#') || t.starts_with("jd_tt") {
            continue;
        }
        let f: Vec<f64> = t
            .split(',')
            .map(|x| x.parse().expect("numeric row"))
            .collect();
        assert_eq!(f.len(), 4);
        let jd_tt = f[0];
        let t_jc = (jd_tt - kshana::timescales::JD_J2000) / 36_525.0;
        let r = kshana::ephem::moon_position(t_jc);
        let d = [r[0] / 1e3 - f[1], r[1] / 1e3 - f[2], r[2] / 1e3 - f[3]];
        let dist_km = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
        // A RANGE residual responds chiefly to the RADIAL part of an ephemeris error: a
        // transverse displacement of dx at distance R changes a range by only ~dx^2/(2R).
        // The like-for-like comparison against the LLR residual is therefore the difference
        // of the two geocentric DISTANCES, not the norm of the vector difference. Both are
        // computed, and both are printed, because quoting only the flattering one would be
        // the whole failure this test exists to prevent.
        let series_km = (r[0] * r[0] + r[1] * r[1] + r[2] * r[2]).sqrt() / 1e3;
        let jpl_km = (f[1] * f[1] + f[2] * f[2] + f[3] * f[3]).sqrt();
        let radial_km = series_km - jpl_km;
        sum_sq += dist_km * dist_km;
        sum_sq_radial += radial_km * radial_km;
        worst = worst.max(dist_km);
        n += 1;
    }
    assert_eq!(n, 12, "twelve weekly epochs across the normal-point slice");
    let rms_m = (sum_sq / n as f64).sqrt() * 1e3;
    let radial_rms_m = (sum_sq_radial / n as f64).sqrt() * 1e3;

    // `kshana::ephem` states its own accuracy in its module documentation: the Moon "to
    // ~0.3 deg / ~few 10^2 km over a few decades around J2000". That is a claim, and this is
    // where it is checked against something outside the crate rather than repeated. A worst
    // vector error of `worst` km at ~3.85e5 km is an angular error of at most
    // asin(worst/3.85e5).
    let worst_angle_deg = (worst / 385_000.0).min(1.0).asin().to_degrees();
    assert!(
        worst_angle_deg < 0.3,
        "the analytic Moon series is off by {worst_angle_deg:.4} deg at its worst epoch, \
         beyond the ~0.3 deg its own module documentation claims"
    );
    assert!(
        rms_m < 5.0e5,
        "the analytic Moon series differs from JPL by {rms_m:.0} m RMS, beyond the \
         'few 10^2 km' its own module documentation claims"
    );
    assert!(
        rms_m > 1.0e4,
        "the analytic Moon series agrees with JPL to {rms_m:.0} m, far better than it \
         claims — the comparison is probably not reaching the series at all"
    );

    // The like-for-like number: the LLR range residual against the radial disagreement with
    // JPL. Two independent handles on the same analytic series.
    let llr_rms = num(&report(), "/residuals/rms_m");
    let ratio = (llr_rms / radial_rms_m).max(radial_rms_m / llr_rms);
    assert!(
        ratio < 5.0,
        "the LLR observed-minus-computed range RMS ({llr_rms:.0} m) and the radial \
         disagreement with JPL over the same span ({radial_rms_m:.0} m) differ by \
         {ratio:.1}x. A range residual measures the radial ephemeris error, so these are \
         the same quantity reached two ways and should not."
    );
    println!(
        "ephemeris error: {llr_rms:.0} m RMS from 337 measured LLR normal points; against \
         JPL Horizons over the same span {radial_rms_m:.0} m RMS radial, {rms_m:.0} m RMS \
         vector (worst epoch {:.0} m vector)",
        worst * 1e3
    );
}

/// The load-bearing claim, measured rather than argued.
///
/// The scenario reports a centimetre-level datum bound from data whose observed-minus-computed
/// residual is 1.6e5 m. That is only defensible if an ephemeris error cannot reach the
/// covariance except through the direction of each line of sight, and if a tilt of the size
/// the ephemeris can induce moves the answer negligibly. The run re-solves the entire datum
/// with every partial tilted, sign alternating, and this test requires both halves: that the
/// stated tilt really is larger than the worst disagreement with JPL over this span, and that
/// the deliverable barely moves under it.
#[test]
fn an_ephemeris_sized_tilt_of_the_geometry_barely_moves_the_datum() {
    let v = report();
    let tilt_deg = num(&v, "/sensitivity/line_of_sight_tilt_deg");

    // Half one: the probe is not weaker than reality. The worst-epoch vector disagreement
    // with JPL over the committed span, as an angle at the lunar distance.
    let text =
        std::fs::read_to_string(Path::new(FIXTURES).join("horizons_moon_geocentric_2015.csv"))
            .expect("the Horizons fixture is committed");
    let mut worst_deg: f64 = 0.0;
    for line in text.lines() {
        let t = line.trim();
        if t.is_empty() || t.starts_with('#') || t.starts_with("jd_tt") {
            continue;
        }
        let f: Vec<f64> = t
            .split(',')
            .map(|x| x.parse().expect("numeric row"))
            .collect();
        let r = kshana::ephem::moon_position((f[0] - kshana::timescales::JD_J2000) / 36_525.0);
        let d = [r[0] / 1e3 - f[1], r[1] / 1e3 - f[2], r[2] / 1e3 - f[3]];
        let km = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
        worst_deg = worst_deg.max((km / 385_000.0).min(1.0).asin().to_degrees());
    }
    assert!(
        tilt_deg > worst_deg,
        "the sensitivity probe tilts by {tilt_deg} deg but the ephemeris is off by \
         {worst_deg:.4} deg at its worst epoch — the probe is weaker than the error it is \
         supposed to bound"
    );

    // Half two: under that tilt, the deliverable moves by well under a percent.
    for key in [
        "ratio_tilted_over_nominal_translation",
        "ratio_tilted_over_nominal_rotation",
        "ratio_tilted_over_nominal_scale",
    ] {
        let r = num(&v, &format!("/sensitivity/{key}"));
        assert!(
            (r - 1.0).abs() < 0.02,
            "{key} = {r}: a {tilt_deg} deg geometry tilt moves the datum by \
             {:.2}%, so the covariance is NOT insensitive to the modelled ephemeris and the \
             scenario's central argument does not hold",
            (r - 1.0).abs() * 100.0
        );
    }
    println!(
        "a {tilt_deg} deg tilt (worst measured ephemeris tilt {worst_deg:.4} deg) moves the \
         datum translation sigma by {:.3}%",
        (num(&v, "/sensitivity/ratio_tilted_over_nominal_translation") - 1.0).abs() * 100.0
    );
}

/// The published catalogues are read as published: an edited row does not survive.
#[test]
fn the_published_catalogues_are_internally_consistent() {
    let refl = std::fs::read_to_string(Path::new(FIXTURES).join("de430_retroreflectors_mer.csv"))
        .expect("committed");
    let sites = kshana::lunar_llr::parse_reflector_catalogue(&refl).expect("parses");
    assert_eq!(sites.len(), 5);
    // Every array sits on the lunar surface, at the radius its own row states.
    for s in &sites {
        let r =
            (s.mer_m[0] * s.mer_m[0] + s.mer_m[1] * s.mer_m[1] + s.mer_m[2] * s.mer_m[2]).sqrt();
        assert!(
            (1_730_000.0..1_740_000.0).contains(&r),
            "{}: |r| = {r} m is not a lunar-surface radius",
            s.array
        );
    }
    let sta = std::fs::read_to_string(Path::new(FIXTURES).join("itrf2020_llr_stations.csv"))
        .expect("committed");
    let stations = kshana::lunar_llr::parse_station_catalogue(&sta).expect("parses");
    assert_eq!(stations.len(), 2);
    for s in &stations {
        let r = (s.itrf_m[0] * s.itrf_m[0] + s.itrf_m[1] * s.itrf_m[1] + s.itrf_m[2] * s.itrf_m[2])
            .sqrt();
        assert!(
            (6_350_000.0..6_390_000.0).contains(&r),
            "{}: |r| = {r} m is not an Earth-surface radius",
            s.crd_name
        );
        // The ITRF velocity is plate motion: centimetres a year, never more.
        let v = (s.velocity_m_per_year[0].powi(2)
            + s.velocity_m_per_year[1].powi(2)
            + s.velocity_m_per_year[2].powi(2))
        .sqrt();
        assert!((0.001..0.2).contains(&v), "{}: |v| = {v} m/y", s.crd_name);
    }
}

/// The deliverable, beside the simulated-campaign figure it replaces.
#[test]
fn the_datum_is_reported_with_its_rank_and_beside_the_simulated_campaign() {
    let v = report();
    assert_eq!(
        v["helmert"]["rank"].as_u64().unwrap(),
        7,
        "a five-array network"
    );
    assert_eq!(v["helmert"]["defect"].as_u64().unwrap(), 0);
    assert_eq!(v["reflector_information"]["rank"].as_u64().unwrap(), 15);
    // A laser range touches exactly one array, so the joint information is block-diagonal.
    // Measured here, not assumed.
    assert_eq!(num(&v, "/reflector_information/offblock_fraction"), 0.0);

    let measured = num(&v, "/datum_accuracy/translation_sigma_norm_m");
    let simulated = num(
        &v,
        "/comparison/simulated_campaign/translation_sigma_norm_m",
    );
    assert!(measured > 0.0 && simulated > 0.0);
    // The simulated campaign is run, not transcribed: it must equal that scenario's own
    // output on the same host to the last bit.
    let sim = kshana::lunar_frame_campaign::LunarFrameCampaignScenario::default();
    let (sj, _) = sim.run_json().expect("the simulated campaign runs");
    let sv: Value = serde_json::from_str(&sj).unwrap();
    assert_eq!(
        simulated,
        num(&sv, "/datum_accuracy/translation_sigma_norm_m"),
        "the comparison block transcribed a figure instead of running the scenario"
    );
    println!(
        "datum translation sigma: {measured:.6e} m from the measured campaign, \
         {simulated:.6e} m from the simulated one ({:.1}x)",
        simulated / measured
    );
}

/// R1: adding this pack changed no released document.
///
/// The three lunar frame packs that were already here must emit byte-identical defaults. The
/// fingerprints are FNV-1a-64 over `json‖summary`. Nothing they depend on was touched — the
/// whole change to pre-existing sources is 22 inserted lines and 0 deleted across `api.rs`,
/// `lib.rs`, `registry.rs` and `realdata/mod.rs`, all of them registration — so a move here
/// would mean the registration leaked into the dispatch it was supposed to extend.
#[test]
fn the_pre_existing_lunar_frame_packs_are_bit_for_bit_unchanged() {
    fn fnv(s: &str) -> u64 {
        let mut h: u64 = 0xcbf2_9ce4_8422_2325;
        for b in s.as_bytes() {
            h ^= *b as u64;
            h = h.wrapping_mul(0x1000_0000_01b3);
        }
        h
    }
    for (kind, want) in [
        ("lunar-frame-campaign", 0xe665_dacd_96ef_2654_u64),
        ("lunar-frame-realisation", 0xcbf3_878f_ed02_92e5),
        ("lunar-vlbi-fim", 0xa963_227a_ecef_12a9),
    ] {
        let out = run_toml(&format!("kind = \"{kind}\"\n")).expect("runs");
        let got = fnv(&format!("{}{}", out.json, out.summary));
        assert_eq!(got, want, "{kind} emission moved: {got:#018x}");
    }
}
