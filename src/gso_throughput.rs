// SPDX-License-Identifier: AGPL-3.0-only
//! Open, reproducible evaluation of the NGSO-GSO protection criteria of FCC 26-26
//! (`kshana gso-throughput`, docs/GSO-THROUGHPUT.md).
//!
//! **Source.** FCC 26-26, *Modernizing Spectrum Sharing for Satellite Broadband*, Report and
//! Order, SB Docket No. 25-157, adopted 30 April 2026, released 1 May 2026
//! (<https://docs.fcc.gov/public/attachments/FCC-26-26A1.txt>, fetched 2026-11-28; the Word
//! version <https://docs.fcc.gov/public/attachments/FCC-26-26A1.docx> carries Appendix B as an
//! embedded spreadsheet). Federal Register summary: 91 FR 26948, 13 May 2026
//! (<https://www.govinfo.gov/content/pkg/FR-2026-05-13/pdf/2026-09565.pdf>).
//!
//! What this module takes from the order, and nothing else:
//!
//! * the four elements a compatibility showing must contain under the new 47 CFR
//!   § 25.146(a)(3)(i) (Appendix A): (A) no more than **3 % time-weighted average degraded
//!   throughput** of any GSO reference link that uses adaptive coding and modulation (ACM);
//!   (B) no more than **0.1 % absolute change in link availability** to any GSO reference link;
//!   (C) no more than **−10.5 dB I/N for 80 % of time** for any reference link that does not use
//!   ACM; (D) a minimum **GSO-arc avoidance angle of 3 degrees**;
//! * the C/N threshold for ACM links carried over from the NGSO-NGSO framework and, for links
//!   without ACM, the C/(N+I) threshold of the reference-link database (para. 78);
//! * the **328 GSO reference links of Appendix B** with the column definitions of its legend
//!   (`data/gso-reference-links/fcc-26-26-appendix-b.csv`, SHA-256 pinned below).
//!
//! The order names the metrics and thresholds but prints **no formula** for the time-weighted
//! average degraded throughput, **no spectral-efficiency (C/N to throughput) curve**, no rain or
//! interference time-series model and no geometry of the NGSO system. Those are inputs here: the
//! per-link time samples of C/N and NGSO I/N, their weights, and the efficiency table are given by
//! the user and repeated in the report with their hashes. The arithmetic applied to them is
//! stated in [`evaluate`] and in docs/GSO-THROUGHPUT.md.
//!
//! **Status of the rule.** § 25.146(a)(3) and § 25.289(a)(2) are marked "delayed indefinitely"
//! in the order (para. 90) and in the eCFR (version of 2026-11-20, read 2026-11-28) pending Paperwork Reduction Act
//! review; the rest of the order took effect on 13 July 2026.
//!
//! **Evidence: MODELLED.** The report evaluates the criteria on the samples it is given. It is
//! not a compatibility showing, not a Commission or Space Bureau finding, and says nothing about
//! any system that the samples do not describe.

use std::collections::{BTreeMap, BTreeSet};

use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};

/// Report format tag.
pub const FORMAT: &str = "kshana.gso-throughput-report/1";
/// Input format tag.
pub const INPUT_FORMAT: &str = "kshana.gso-throughput-input/1";
/// Link-consistency report format tag.
pub const CHECK_FORMAT: &str = "kshana.gso-throughput-link-check/1";
/// The order the criteria are taken from.
pub const SOURCE_TITLE: &str = "FCC 26-26, Modernizing Spectrum Sharing for Satellite Broadband, Report and Order, SB Docket No. 25-157 (adopted 30 April 2026, released 1 May 2026)";
/// Where it was read.
pub const SOURCE_URL: &str = "https://docs.fcc.gov/public/attachments/FCC-26-26A1.txt";
/// Where Appendix B was read (embedded spreadsheet of the Word version).
pub const APPENDIX_B_URL: &str = "https://docs.fcc.gov/public/attachments/FCC-26-26A1.docx";
/// Federal Register publication.
pub const FR_URL: &str = "https://www.govinfo.gov/content/pkg/FR-2026-05-13/pdf/2026-09565.pdf";
/// When they were read.
pub const SOURCE_FETCHED: &str = "2026-11-28";
/// What the report is not.
pub const DISCLAIMER: &str = "MODELLED evaluation of the FCC 26-26 protection criteria on the time samples and spectral-efficiency table given as inputs. It is not a compatibility showing, not a finding of the Commission or its Space Bureau, and says nothing about operations the samples do not describe. 47 CFR 25.146(a)(3) is delayed indefinitely as of the source date.";

/// The reference-link set shipped with kshana: FCC 26-26 Appendix B.
pub const LINKS_CSV: &str = include_str!("../data/gso-reference-links/fcc-26-26-appendix-b.csv");
/// Its identifier.
pub const LINK_SET_ID: &str = "fcc-26-26-appendix-b";
/// SHA-256 of `data/gso-reference-links/fcc-26-26-appendix-b.csv`.
// PIN-SCOPE:    the bytes of data/gso-reference-links/fcc-26-26-appendix-b.csv, the FCC 26-26 Appendix B extract
// PIN-EXCLUDES: link files given with --links, which are hashed and reported but not held to this pin
pub const LINK_SET_SHA256: &str =
    "73bde6f5edbfa1d6b07e5b28e6dc5fb2bb5c072b06c0892435de884300fed423";
/// Number of links FCC 26-26 para. 67 states.
pub const LINK_SET_COUNT: usize = 328;

/// (A) maximum time-weighted average degraded throughput of an ACM link, percent.
pub const MAX_DEGRADED_THROUGHPUT_PCT: f64 = 3.0;
/// (B) maximum absolute change in link availability, percentage points.
pub const MAX_AVAILABILITY_CHANGE_PCT: f64 = 0.1;
/// (C) I/N level for links without ACM, dB.
pub const NON_ACM_IN_DB: f64 = -10.5;
/// (C) percentage of time the I/N level may not be exceeded.
pub const NON_ACM_TIME_PCT: f64 = 80.0;
/// (D) minimum GSO-arc avoidance angle, degrees.
pub const MIN_AVOIDANCE_ANGLE_DEG: f64 = 3.0;
/// Appendix B legend: "If no value is given, a value of 40 dB is assumed" (internal C/I).
pub const DEFAULT_CI_INTERNAL_DB: f64 = 40.0;
/// Appendix B legend: GW if the antenna diameter is at least 3.5 m, otherwise UT.
pub const GATEWAY_DIAMETER_M: f64 = 3.5;

/// The bands of § 25.146(a)(3), GHz.
pub const RULE_BANDS_GHZ: [(f64, f64); 3] = [(10.7, 12.7), (17.3, 18.6), (19.7, 20.2)];

/// Constants of kshana's recomputation of the Appendix B geometry and clear-sky C/N (not given by
/// the order; the consistency check reports how closely they reproduce its columns).
const RE_KM: f64 = 6378.137;
const R_GSO_KM: f64 = 42164.0;
const C_M_S: f64 = 299_792_458.0;
const BOLTZMANN_DBW: f64 = -228.6;
/// Tolerance of the recomputed elevation, degrees.
pub const TOL_ELEVATION_DEG: f64 = 1e-3;
/// Tolerance of a recomputed ratio, dB.
pub const TOL_DB: f64 = 0.01;
/// Tolerance of a value the legend defines by subtraction.
pub const TOL_EXACT: f64 = 1e-9;

/// One row of Appendix B.
#[derive(Debug, Clone, Serialize)]
pub struct Link {
    /// Carrier number (Appendix B `carrier_num`).
    pub carrier_num: i64,
    /// Administration of the earth station.
    pub admin_country: String,
    /// GSO network name.
    pub geo_network_name: String,
    /// Source document of the link parameters.
    pub source: String,
    /// GSO orbital position, degrees East.
    pub gso_lon_deg: f64,
    /// Satellite EIRP per carrier towards the earth station, dBW.
    pub satellite_eirp_dbw: f64,
    /// Downlink carrier centre frequency, GHz.
    pub freq_ghz: f64,
    /// Occupied bandwidth per carrier, kHz.
    pub ibw_khz: f64,
    /// Earth-station peak receive gain, dBi.
    pub es_rx_gain_dbi: f64,
    /// Earth-station antenna diameter, m.
    pub es_rx_diameter_m: f64,
    /// Earth-station noise temperature, K.
    pub es_tsys_k: f64,
    /// Earth-station latitude, degrees North.
    pub es_lat_deg: f64,
    /// Earth-station longitude, degrees East.
    pub es_lon_deg: f64,
    /// Rain rate exceeded 0.01 % of an average year, mm/h.
    pub rr_mmh: f64,
    /// Appendix B elevation angle, degrees.
    pub calc_gso_elevation_deg: f64,
    /// Short-term C/(N+I) threshold, dB.
    pub obj_cni_threshold_db: f64,
    /// Availability objective, percent (absent for the ACM links).
    pub obj_avail_perc: Option<f64>,
    /// Appendix B baseline unavailability, percent.
    pub calc_baseline_unavail_perc: f64,
    /// Appendix B clear-sky C/N, dB.
    pub calc_cn_clearsky_db: f64,
    /// Internal C/I, dB.
    pub ci_internal_db: Option<f64>,
    /// Appendix B clear-sky C/(N+I), dB.
    pub calc_cni_clearsky_db: f64,
    /// Appendix B clear-sky margin over the threshold, dB.
    pub calc_cni_clearsky_margin_db: f64,
    /// Appendix B: baseline availability meets the objective.
    pub pass_rain_only: Option<bool>,
    /// The link uses adaptive coding and modulation.
    pub acm: bool,
    /// `UT` or `GW`.
    pub ut_or_gw: String,
    /// Appendix B rain margin, dB.
    pub calc_rain_margin_db: f64,
    /// Appendix B margin after rain, dB.
    pub calc_cni_rain_margin_db: f64,
}

impl Link {
    /// Internal C/I, with the legend's 40 dB default.
    pub fn ci_internal(&self) -> f64 {
        self.ci_internal_db.unwrap_or(DEFAULT_CI_INTERNAL_DB)
    }
    /// The § 25.146(a)(3) band the carrier falls in, if any.
    pub fn rule_band(&self) -> Option<(f64, f64)> {
        RULE_BANDS_GHZ
            .iter()
            .copied()
            .find(|(a, b)| self.freq_ghz >= *a && self.freq_ghz <= *b)
    }
}

const HEADER: [&str; 27] = [
    "carrier_num",
    "admin_country",
    "geo_network_name",
    "source",
    "gso_lon_deg",
    "satellite_eirp_dBW",
    "freq_GHz",
    "ibw_kHz",
    "es_rx_gain_dBi",
    "es_rx_diameter_m",
    "es_Tsys_K",
    "es_lat_deg",
    "es_lon_deg",
    "rr_mmh",
    "calc_gso_elevation_deg",
    "obj_cni_threshold_dB",
    "obj_avail_perc",
    "calc_baseline_unavail_perc",
    "calc_cn_clearsky_dB",
    "ci_internal_dB",
    "calc_cni_clearsky_dB",
    "calc_cni_clearsky_margin_dB",
    "pass_rain_only",
    "ACM (Yes/No)",
    "UT or GW",
    "calc_rain_margin_dB",
    "calc_cni_rain_margin_dB",
];

/// Split one CSV line (RFC 4180 quoting, no embedded newlines).
fn csv_fields(line: &str) -> Vec<String> {
    let mut out = Vec::new();
    let mut cur = String::new();
    let mut quoted = false;
    let mut chars = line.chars().peekable();
    while let Some(c) = chars.next() {
        match (c, quoted) {
            ('"', true) if chars.peek() == Some(&'"') => {
                cur.push('"');
                chars.next();
            }
            ('"', _) => quoted = !quoted,
            (',', false) => out.push(std::mem::take(&mut cur)),
            (c, _) => cur.push(c),
        }
    }
    out.push(cur);
    out
}

/// Parse a reference-link CSV with the Appendix B columns.
pub fn parse_links(text: &str) -> Result<Vec<Link>, String> {
    let mut lines = text.lines().filter(|l| !l.trim().is_empty());
    let head = lines.next().ok_or("empty link file")?;
    let h = csv_fields(head.trim_start_matches('\u{feff}'));
    if h.iter().map(String::as_str).ne(HEADER.iter().copied()) {
        return Err(format!(
            "link file header is not the FCC 26-26 Appendix B header ({} columns expected)",
            HEADER.len()
        ));
    }
    let mut out = Vec::new();
    let mut seen = BTreeSet::new();
    for (n, line) in lines.enumerate() {
        let f = csv_fields(line);
        let row = n + 2;
        if f.len() != HEADER.len() {
            return Err(format!(
                "row {row}: {} fields, {} expected",
                f.len(),
                HEADER.len()
            ));
        }
        let num = |i: usize| -> Result<f64, String> {
            f[i].trim()
                .parse::<f64>()
                .map_err(|_| format!("row {row}: {} is not a number: {:?}", HEADER[i], f[i]))
        };
        let opt = |i: usize| -> Result<Option<f64>, String> {
            if f[i].trim().is_empty() {
                Ok(None)
            } else {
                num(i).map(Some)
            }
        };
        let carrier_num = f[0]
            .trim()
            .parse::<i64>()
            .map_err(|_| format!("row {row}: carrier_num is not an integer: {:?}", f[0]))?;
        if !seen.insert(carrier_num) {
            return Err(format!("row {row}: carrier_num {carrier_num} repeats"));
        }
        let acm = match f[23].trim() {
            "Yes" => true,
            "No" => false,
            o => return Err(format!("row {row}: ACM (Yes/No) is {o:?}")),
        };
        let pass_rain_only = match f[22].trim() {
            "TRUE" => Some(true),
            "FALSE" => Some(false),
            "" => None,
            o => return Err(format!("row {row}: pass_rain_only is {o:?}")),
        };
        out.push(Link {
            carrier_num,
            admin_country: f[1].clone(),
            geo_network_name: f[2].clone(),
            source: f[3].clone(),
            gso_lon_deg: num(4)?,
            satellite_eirp_dbw: num(5)?,
            freq_ghz: num(6)?,
            ibw_khz: num(7)?,
            es_rx_gain_dbi: num(8)?,
            es_rx_diameter_m: num(9)?,
            es_tsys_k: num(10)?,
            es_lat_deg: num(11)?,
            es_lon_deg: num(12)?,
            rr_mmh: num(13)?,
            calc_gso_elevation_deg: num(14)?,
            obj_cni_threshold_db: num(15)?,
            obj_avail_perc: opt(16)?,
            calc_baseline_unavail_perc: num(17)?,
            calc_cn_clearsky_db: num(18)?,
            ci_internal_db: opt(19)?,
            calc_cni_clearsky_db: num(20)?,
            calc_cni_clearsky_margin_db: num(21)?,
            pass_rain_only,
            acm,
            ut_or_gw: f[24].trim().to_string(),
            calc_rain_margin_db: num(25)?,
            calc_cni_rain_margin_db: num(26)?,
        });
    }
    Ok(out)
}

/// The shipped FCC 26-26 Appendix B links.
pub fn appendix_b() -> Vec<Link> {
    parse_links(LINKS_CSV).unwrap_or_default()
}

/// SHA-256, hex.
pub fn sha256_hex(b: &[u8]) -> String {
    hex::encode(Sha256::digest(b))
}

/// Elevation (deg) of a GSO satellite at `gso_lon` seen from (`lat`, `lon`), spherical Earth, and
/// the slant range (km).
pub fn gso_elevation_and_range(lat_deg: f64, lon_deg: f64, gso_lon_deg: f64) -> (f64, f64) {
    let cg = lat_deg.to_radians().cos() * (gso_lon_deg - lon_deg).to_radians().cos();
    let d = (RE_KM * RE_KM + R_GSO_KM * R_GSO_KM - 2.0 * RE_KM * R_GSO_KM * cg).sqrt();
    let el = (cg - RE_KM / R_GSO_KM)
        .atan2((1.0 - cg * cg).max(0.0).sqrt())
        .to_degrees();
    (el, d)
}

/// Clear-sky downlink C/N (dB): EIRP + G − free-space loss − 10 log10(k T B).
pub fn clear_sky_cn_db(l: &Link) -> f64 {
    let (_, d_km) = gso_elevation_and_range(l.es_lat_deg, l.es_lon_deg, l.gso_lon_deg);
    let fspl = 20.0 * (4.0 * std::f64::consts::PI * d_km * 1e3 * l.freq_ghz * 1e9 / C_M_S).log10();
    let ktb = BOLTZMANN_DBW + 10.0 * l.es_tsys_k.log10() + 10.0 * (l.ibw_khz * 1e3).log10();
    l.satellite_eirp_dbw + l.es_rx_gain_dbi - fspl - ktb
}

/// Power sum of noise-like terms given as carrier-to-X ratios in dB: −10 log10(Σ 10^(−x/10)).
pub fn combine_db(ratios: &[f64]) -> f64 {
    let s: f64 = ratios.iter().map(|x| 10f64.powf(-x / 10.0)).sum();
    -10.0 * s.log10()
}

/// One recomputed column of one link.
#[derive(Debug, Clone, Serialize)]
pub struct ColumnCheck {
    /// The column name.
    pub column: &'static str,
    /// The Appendix B value.
    pub appendix_b: String,
    /// kshana's value.
    pub recomputed: String,
    /// Absolute difference, when numeric.
    pub deviation: Option<f64>,
    /// Tolerance, when numeric.
    pub tolerance: Option<f64>,
    /// Number (or whether) within tolerance.
    pub within: bool,
    /// How the value is recomputed.
    pub how: &'static str,
}

/// The consistency check of a link set: each Appendix B column that its legend defines from
/// other columns, recomputed.
#[derive(Debug, Clone, Serialize)]
pub struct LinkCheckReport {
    /// Format tag.
    pub format: &'static str,
    /// Evidence label (MODELLED).
    pub label: &'static str,
    /// The link set used.
    pub link_set: LinkSetInfo,
    /// Per-column summary.
    pub columns: Vec<ColumnSummary>,
    /// Columns not recomputed, with why.
    pub not_reproduced: Vec<&'static str>,
    /// Values outside tolerance.
    pub failures: Vec<serde_json::Value>,
    /// Links (count or results).
    pub links: usize,
    /// Number of recomputed values.
    pub checks: usize,
    /// Number (or whether) within tolerance.
    pub within: usize,
}

/// The check of one column over all links.
#[derive(Debug, Clone, Serialize)]
pub struct ColumnSummary {
    /// The column name.
    pub column: &'static str,
    /// How the value is recomputed.
    pub how: &'static str,
    /// Tolerance, when numeric.
    pub tolerance: Option<f64>,
    /// Number of values checked.
    pub checked: usize,
    /// Number (or whether) within tolerance.
    pub within: usize,
    /// Largest absolute deviation.
    pub max_deviation: Option<f64>,
}

/// The link set a run used.
#[derive(Debug, Clone, Serialize)]
pub struct LinkSetInfo {
    /// Identifier (the shipped id or the path given).
    pub id: String,
    /// SHA-256 of the link file.
    pub sha256: String,
    /// Whether the hash is the pinned FCC 26-26 Appendix B one.
    pub matches_pinned_fcc_26_26: bool,
    /// Links (count or results).
    pub links: usize,
    /// Source document of the link parameters.
    pub source: String,
}

fn link_set_info(path: Option<&str>, bytes: &[u8], n: usize) -> LinkSetInfo {
    let sha = sha256_hex(bytes);
    LinkSetInfo {
        id: path.map_or_else(|| LINK_SET_ID.to_string(), str::to_string),
        matches_pinned_fcc_26_26: sha == LINK_SET_SHA256,
        sha256: sha,
        links: n,
        source: APPENDIX_B_URL.to_string(),
    }
}

/// Recompute the derived columns of every link.
pub fn check_links(links: &[Link], info: LinkSetInfo) -> LinkCheckReport {
    const HOW_EL: &str = "elevation to the GSO longitude, spherical Earth of radius 6378.137 km, GSO radius 42164 km (kshana's geometry; the order gives none)";
    const HOW_CN: &str = "EIRP + G - 20 log10(4 pi d f / c) - (-228.6 + 10 log10 T + 10 log10 B) (kshana's link budget; the order gives none)";
    const HOW_CNI: &str = "legend: C/(N+I) from calc_cn_clearsky_dB and ci_internal_dB (power sum)";
    const HOW_MARGIN: &str =
        "legend: calc_cni_clearsky_margin_dB = C/(N+I) - unavailability threshold";
    const HOW_RAIN: &str =
        "legend: calc_cni_rain_margin_dB = calc_cni_clearsky_margin_dB - calc_rain_margin_dB";
    const HOW_UTGW: &str = "legend: GW if es_rx_diameter_m >= 3.5 m, otherwise UT";
    const HOW_PASS: &str =
        "legend: TRUE if 100 - calc_baseline_unavail_perc >= obj_avail_perc, otherwise FALSE";
    const HOW_ACM_THR: &str =
        "para. 78: ACM links use the NGSO-NGSO C/N threshold (0 dB, 47 CFR 25.261(d)(1))";
    let mut all: Vec<(i64, ColumnCheck)> = Vec::new();
    let num = |column, a: f64, r: f64, tol: f64, how| ColumnCheck {
        column,
        appendix_b: format!("{a}"),
        recomputed: format!("{r}"),
        deviation: Some((r - a).abs()),
        tolerance: Some(tol),
        within: (r - a).abs() <= tol,
        how,
    };
    for l in links {
        let (el, _) = gso_elevation_and_range(l.es_lat_deg, l.es_lon_deg, l.gso_lon_deg);
        all.push((
            l.carrier_num,
            num(
                "calc_gso_elevation_deg",
                l.calc_gso_elevation_deg,
                el,
                TOL_ELEVATION_DEG,
                HOW_EL,
            ),
        ));
        all.push((
            l.carrier_num,
            num(
                "calc_cn_clearsky_dB",
                l.calc_cn_clearsky_db,
                clear_sky_cn_db(l),
                TOL_DB,
                HOW_CN,
            ),
        ));
        all.push((
            l.carrier_num,
            num(
                "calc_cni_clearsky_dB",
                l.calc_cni_clearsky_db,
                combine_db(&[l.calc_cn_clearsky_db, l.ci_internal()]),
                TOL_DB,
                HOW_CNI,
            ),
        ));
        all.push((
            l.carrier_num,
            num(
                "calc_cni_clearsky_margin_dB",
                l.calc_cni_clearsky_margin_db,
                l.calc_cni_clearsky_db - l.obj_cni_threshold_db,
                TOL_EXACT,
                HOW_MARGIN,
            ),
        ));
        all.push((
            l.carrier_num,
            num(
                "calc_cni_rain_margin_dB",
                l.calc_cni_rain_margin_db,
                l.calc_cni_clearsky_margin_db - l.calc_rain_margin_db,
                TOL_EXACT,
                HOW_RAIN,
            ),
        ));
        let utgw = if l.es_rx_diameter_m >= GATEWAY_DIAMETER_M {
            "GW"
        } else {
            "UT"
        };
        all.push((
            l.carrier_num,
            ColumnCheck {
                column: "UT or GW",
                appendix_b: l.ut_or_gw.clone(),
                recomputed: utgw.to_string(),
                deviation: None,
                tolerance: None,
                within: l.ut_or_gw == utgw,
                how: HOW_UTGW,
            },
        ));
        if let (Some(p), Some(obj)) = (l.pass_rain_only, l.obj_avail_perc) {
            let r = 100.0 - l.calc_baseline_unavail_perc >= obj;
            all.push((
                l.carrier_num,
                ColumnCheck {
                    column: "pass_rain_only",
                    appendix_b: p.to_string(),
                    recomputed: r.to_string(),
                    deviation: None,
                    tolerance: None,
                    within: p == r,
                    how: HOW_PASS,
                },
            ));
        }
        if l.acm {
            all.push((
                l.carrier_num,
                num(
                    "obj_cni_threshold_dB (ACM)",
                    l.obj_cni_threshold_db,
                    0.0,
                    TOL_EXACT,
                    HOW_ACM_THR,
                ),
            ));
        }
    }
    let mut cols: BTreeMap<&'static str, ColumnSummary> = BTreeMap::new();
    let mut order: Vec<&'static str> = Vec::new();
    let mut failures = Vec::new();
    for (num, c) in &all {
        let s = cols.entry(c.column).or_insert_with(|| {
            order.push(c.column);
            ColumnSummary {
                column: c.column,
                how: c.how,
                tolerance: c.tolerance,
                checked: 0,
                within: 0,
                max_deviation: None,
            }
        });
        s.checked += 1;
        if c.within {
            s.within += 1;
        } else {
            failures.push(serde_json::json!({"carrier_num": num, "check": c}));
        }
        if let Some(d) = c.deviation {
            s.max_deviation = Some(s.max_deviation.map_or(d, |m: f64| m.max(d)));
        }
    }
    let within = all.iter().filter(|(_, c)| c.within).count();
    LinkCheckReport {
        format: CHECK_FORMAT,
        label: "MODELLED",
        link_set: info,
        columns: order.iter().filter_map(|k| cols.remove(k)).collect(),
        not_reproduced: vec![
            "calc_baseline_unavail_perc (ITU-R P.618 and S.1323 Procedure D; not in the order)",
            "calc_rain_margin_dB (ITU-R P.618 at 1 % for UT, 0.1 % for GW; not in the order)",
            "rr_mmh where computed (ITU-R P.837; not in the order)",
        ],
        failures,
        links: links.len(),
        checks: all.len(),
        within,
    }
}

// ---------------------------------------------------------------------------------------------
// Evaluation of the criteria on given samples
// ---------------------------------------------------------------------------------------------

/// One row of the user's spectral-efficiency table.
#[derive(Debug, Clone, Deserialize, Serialize)]
pub struct EfficiencyStep {
    /// The C/(N+I) at and above which this efficiency applies, dB.
    pub cni_db: f64,
    /// Throughput per hertz, bit/s/Hz.
    pub bps_per_hz: f64,
}

/// One time sample of one reference link.
#[derive(Debug, Clone, Deserialize, Serialize)]
pub struct Sample {
    /// The share of time this sample stands for (any positive unit; normalised per link).
    pub weight: f64,
    /// Downlink C/N without the NGSO system in this sample (clear sky or faded), dB.
    pub cn_db: f64,
    /// Aggregate NGSO I/N in this sample, dB; absent means no NGSO interference.
    #[serde(default)]
    pub i_n_db: Option<f64>,
    /// The NGSO system's GSO-arc avoidance angle in this sample, degrees, when known.
    #[serde(default)]
    pub avoidance_angle_deg: Option<f64>,
}

/// The samples of one reference link.
#[derive(Debug, Clone, Deserialize, Serialize)]
pub struct LinkSamples {
    /// Carrier number (Appendix B `carrier_num`).
    pub carrier_num: i64,
    /// Number of samples.
    pub samples: Vec<Sample>,
}

/// The evaluation input.
#[derive(Debug, Clone, Deserialize, Serialize)]
pub struct RunInput {
    /// Format tag.
    pub format: String,
    /// The NGSO system named in the input.
    pub system: String,
    /// Throughput table for ACM links: ascending C/(N+I) thresholds; the throughput of a sample
    /// is the efficiency of the highest row whose threshold it meets, zero below the first row.
    #[serde(default)]
    pub spectral_efficiency: Vec<EfficiencyStep>,
    /// The minimum GSO-arc avoidance angle the system declares, degrees.
    #[serde(default)]
    pub declared_min_avoidance_angle_deg: Option<f64>,
    /// Free text: where the samples come from (simulation tool, run, parameters).
    #[serde(default)]
    pub samples_provenance: Option<String>,
    /// Links (count or results).
    pub links: Vec<LinkSamples>,
}

/// One criterion on one link.
#[derive(Debug, Clone, Serialize)]
pub struct CriterionResult {
    /// Criterion name.
    pub criterion: &'static str,
    /// The rule provision.
    pub provision: &'static str,
    /// Evaluated value.
    pub value: f64,
    /// Unit of the value.
    pub unit: &'static str,
    /// Limit from the order.
    pub limit: f64,
    /// Whether the value is within the limit.
    pub meets: bool,
}

/// One evaluated link.
#[derive(Debug, Clone, Serialize)]
pub struct LinkResult {
    /// Carrier number (Appendix B `carrier_num`).
    pub carrier_num: i64,
    /// GSO network name.
    pub geo_network_name: String,
    /// The link uses adaptive coding and modulation.
    pub acm: bool,
    /// `UT` or `GW`.
    pub ut_or_gw: String,
    /// Downlink carrier centre frequency, GHz.
    pub freq_ghz: f64,
    /// The § 25.146(a)(3) band, if any.
    pub rule_band: Option<String>,
    /// Threshold used, dB.
    pub threshold_db: f64,
    /// Number of samples.
    pub samples: usize,
    /// Unavailability without the NGSO system, percent.
    pub unavailability_without_pct: f64,
    /// Unavailability with it, percent.
    pub unavailability_with_pct: f64,
    /// Criteria evaluated on this link.
    pub criteria: Vec<CriterionResult>,
}

/// The run record of an evaluation.
#[derive(Debug, Clone, Serialize)]
pub struct Report {
    /// Format tag.
    pub format: &'static str,
    /// Evidence label (MODELLED).
    pub label: &'static str,
    /// Source document of the link parameters.
    pub source: serde_json::Value,
    /// The NGSO system named in the input.
    pub system: String,
    /// Where the samples come from, as given.
    pub samples_provenance: Option<String>,
    /// The link set used.
    pub link_set: LinkSetInfo,
    /// Input files with their hashes.
    pub inputs: Vec<serde_json::Value>,
    /// The arithmetic applied.
    pub method: Vec<&'static str>,
    /// Links (count or results).
    pub links: Vec<LinkResult>,
    /// Criterion (D), when an angle is known.
    pub avoidance: Option<CriterionResult>,
    /// Reference links absent from the input.
    pub reference_links_not_evaluated: Vec<i64>,
    /// Links with an exceeded criterion.
    pub links_exceeding: Vec<i64>,
    /// Number of exceeded criteria.
    pub exceedances: usize,
    /// What the report is not.
    pub disclaimer: &'static str,
}

/// Throughput per hertz of a C/(N+I) under the step table.
pub fn efficiency(table: &[EfficiencyStep], cni_db: f64) -> f64 {
    table
        .iter()
        .take_while(|s| s.cni_db <= cni_db)
        .last()
        .map_or(0.0, |s| s.bps_per_hz)
}

fn validate_table(t: &[EfficiencyStep]) -> Result<(), String> {
    for w in t.windows(2) {
        if w[1].cni_db <= w[0].cni_db || w[1].bps_per_hz < w[0].bps_per_hz {
            return Err(
                "spectral_efficiency must have increasing cni_db and non-decreasing bps_per_hz"
                    .into(),
            );
        }
    }
    if t.iter()
        .any(|s| !s.cni_db.is_finite() || s.bps_per_hz.is_nan() || s.bps_per_hz < 0.0)
    {
        return Err(
            "spectral_efficiency has a non-finite threshold or a negative efficiency".into(),
        );
    }
    Ok(())
}

/// The method, as written into every report.
pub const METHOD: &[&str] = &[
    "C/(N+I) without the NGSO system per sample: power sum of the sample's C/N and the link's internal C/I (Appendix B ci_internal_dB, 40 dB when absent).",
    "C/(N+I) with the NGSO system: the same plus the NGSO interference, I/C = (I/N) / (C/N).",
    "Unavailability: the weight share of samples whose C/(N+I) is below the link's threshold (obj_cni_threshold_dB; 0 dB for ACM links, para. 78). Criterion (B): with minus without <= 0.1 percentage point.",
    "Degraded throughput of an ACM link: 1 - (sum of weight x efficiency with) / (sum of weight x efficiency without), efficiency from the input table (step). Criterion (A): <= 3 %.",
    "Links without ACM: the weight share of samples with NGSO I/N <= -10.5 dB (no NGSO interference counts as below). Criterion (C): >= 80 %.",
    "Avoidance angle: the smallest of the declared angle and the per-sample angles. Criterion (D): >= 3 degrees.",
];

/// Evaluate the criteria. `input_files` are (name, bytes) recorded with their hashes.
pub fn evaluate(
    input: &RunInput,
    links: &[Link],
    link_info: LinkSetInfo,
    input_files: &[(String, Vec<u8>)],
) -> Result<Report, String> {
    if input.format != INPUT_FORMAT {
        return Err(format!(
            "input format is {:?}, expected {INPUT_FORMAT}",
            input.format
        ));
    }
    validate_table(&input.spectral_efficiency)?;
    let by_num: BTreeMap<i64, &Link> = links.iter().map(|l| (l.carrier_num, l)).collect();
    let mut results = Vec::new();
    let mut seen = BTreeSet::new();
    let mut min_angle = input.declared_min_avoidance_angle_deg;
    for ls in &input.links {
        let Some(l) = by_num.get(&ls.carrier_num) else {
            return Err(format!(
                "carrier_num {} is not in the reference-link set",
                ls.carrier_num
            ));
        };
        if !seen.insert(ls.carrier_num) {
            return Err(format!("carrier_num {} appears twice", ls.carrier_num));
        }
        if ls.samples.is_empty() {
            return Err(format!("carrier_num {} has no samples", ls.carrier_num));
        }
        let ci = l.ci_internal();
        let thr = l.obj_cni_threshold_db;
        let (mut w_tot, mut w_out0, mut w_out1, mut t0, mut t1, mut w_low) =
            (0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        for s in &ls.samples {
            if s.weight.is_nan() || s.weight <= 0.0 || !s.weight.is_finite() || !s.cn_db.is_finite()
            {
                return Err(format!(
                    "carrier_num {}: a sample has a non-positive weight or a non-finite C/N",
                    ls.carrier_num
                ));
            }
            if let Some(a) = s.avoidance_angle_deg {
                min_angle = Some(min_angle.map_or(a, |m: f64| m.min(a)));
            }
            let cn_lin = 10f64.powf(-s.cn_db / 10.0);
            let ci_lin = 10f64.powf(-ci / 10.0);
            let in_lin = s.i_n_db.map_or(0.0, |x| 10f64.powf(x / 10.0));
            let cni0 = -10.0 * (cn_lin + ci_lin).log10();
            let cni1 = -10.0 * (cn_lin * (1.0 + in_lin) + ci_lin).log10();
            w_tot += s.weight;
            if cni0 < thr {
                w_out0 += s.weight;
            }
            if cni1 < thr {
                w_out1 += s.weight;
            }
            if s.i_n_db.is_none_or(|x| x <= NON_ACM_IN_DB) {
                w_low += s.weight;
            }
            t0 += s.weight * efficiency(&input.spectral_efficiency, cni0);
            t1 += s.weight * efficiency(&input.spectral_efficiency, cni1);
        }
        let u0 = 100.0 * w_out0 / w_tot;
        let u1 = 100.0 * w_out1 / w_tot;
        let mut criteria = Vec::new();
        if l.acm {
            if input.spectral_efficiency.is_empty() {
                return Err("an ACM link is evaluated: give spectral_efficiency".into());
            }
            if t0 <= 0.0 {
                return Err(format!(
                    "carrier_num {}: zero throughput without the NGSO system (every sample below the first efficiency step)",
                    ls.carrier_num
                ));
            }
            let dt = 100.0 * (1.0 - t1 / t0);
            criteria.push(CriterionResult {
                criterion: "time-weighted average degraded throughput",
                provision: "47 CFR 25.146(a)(3)(i)(A)",
                value: dt,
                unit: "%",
                limit: MAX_DEGRADED_THROUGHPUT_PCT,
                meets: dt <= MAX_DEGRADED_THROUGHPUT_PCT,
            });
        }
        criteria.push(CriterionResult {
            criterion: "absolute change in link availability",
            provision: "47 CFR 25.146(a)(3)(i)(B)",
            value: u1 - u0,
            unit: "percentage point",
            limit: MAX_AVAILABILITY_CHANGE_PCT,
            meets: u1 - u0 <= MAX_AVAILABILITY_CHANGE_PCT,
        });
        if !l.acm {
            let p = 100.0 * w_low / w_tot;
            criteria.push(CriterionResult {
                criterion: "time with I/N at or below -10.5 dB",
                provision: "47 CFR 25.146(a)(3)(i)(C)",
                value: p,
                unit: "% of time",
                limit: NON_ACM_TIME_PCT,
                meets: p >= NON_ACM_TIME_PCT,
            });
        }
        results.push(LinkResult {
            carrier_num: l.carrier_num,
            geo_network_name: l.geo_network_name.clone(),
            acm: l.acm,
            ut_or_gw: l.ut_or_gw.clone(),
            freq_ghz: l.freq_ghz,
            rule_band: l.rule_band().map(|(a, b)| format!("{a}-{b} GHz")),
            threshold_db: thr,
            samples: ls.samples.len(),
            unavailability_without_pct: u0,
            unavailability_with_pct: u1,
            criteria,
        });
    }
    let avoidance = min_angle.map(|a| CriterionResult {
        criterion: "minimum GSO-arc avoidance angle",
        provision: "47 CFR 25.146(a)(3)(i)(D)",
        value: a,
        unit: "deg",
        limit: MIN_AVOIDANCE_ANGLE_DEG,
        meets: a >= MIN_AVOIDANCE_ANGLE_DEG,
    });
    let links_exceeding: Vec<i64> = results
        .iter()
        .filter(|r| r.criteria.iter().any(|c| !c.meets))
        .map(|r| r.carrier_num)
        .collect();
    let exceedances = results
        .iter()
        .flat_map(|r| &r.criteria)
        .filter(|c| !c.meets)
        .count()
        + usize::from(avoidance.as_ref().is_some_and(|a| !a.meets));
    Ok(Report {
        format: FORMAT,
        label: "MODELLED",
        source: serde_json::json!({
            "title": SOURCE_TITLE, "url": SOURCE_URL, "appendix_b": APPENDIX_B_URL,
            "federal_register": FR_URL, "fetched": SOURCE_FETCHED,
            "status": "47 CFR 25.146(a)(3) delayed indefinitely (para. 90; eCFR version of 2026-11-20, read 2026-11-28)",
        }),
        system: input.system.clone(),
        samples_provenance: input.samples_provenance.clone(),
        link_set: link_info,
        inputs: input_files
            .iter()
            .map(|(p, b)| serde_json::json!({"path": p, "sha256": sha256_hex(b), "bytes": b.len()}))
            .collect(),
        method: METHOD.to_vec(),
        reference_links_not_evaluated: links
            .iter()
            .map(|l| l.carrier_num)
            .filter(|n| !seen.contains(n))
            .collect(),
        links: results,
        avoidance,
        links_exceeding,
        exceedances,
        disclaimer: DISCLAIMER,
    })
}

/// An example input (two links, hand-checkable).
pub fn template() -> serde_json::Value {
    serde_json::json!({
        "format": INPUT_FORMAT,
        "system": "example NGSO system",
        "samples_provenance": "describe the simulation that produced the samples",
        "declared_min_avoidance_angle_deg": 4.0,
        "spectral_efficiency": [
            {"cni_db": 0.0, "bps_per_hz": 1.0},
            {"cni_db": 5.0, "bps_per_hz": 2.0},
            {"cni_db": 10.0, "bps_per_hz": 3.0}
        ],
        "links": [
            {"carrier_num": 5310, "samples": [
                {"weight": 0.9, "cn_db": 22.0, "i_n_db": -12.0},
                {"weight": 0.1, "cn_db": 6.0, "i_n_db": -8.0, "avoidance_angle_deg": 3.5}
            ]},
            {"carrier_num": 6, "samples": [
                {"weight": 0.85, "cn_db": 23.0},
                {"weight": 0.15, "cn_db": 20.0, "i_n_db": -9.0}
            ]}
        ]
    })
}

fn fmt(x: f64) -> String {
    crate::i18n::localise_decimal(format!("{x:.4}"))
}

/// `kshana gso-throughput ...`
pub fn run_cli(args: &[String]) -> i32 {
    let usage = || {
        eprintln!("{}", crate::t!("gso-throughput-usage"));
        2
    };
    let Some(sub) = args.first().map(String::as_str) else {
        return usage();
    };
    if matches!(sub, "--help" | "-h") {
        println!("{}", crate::t!("gso-throughput-usage"));
        return 0;
    }
    let mut json = false;
    let mut links_path: Option<String> = None;
    let mut out: Option<String> = None;
    let mut files = Vec::new();
    let mut i = 1;
    while i < args.len() {
        match args[i].as_str() {
            "--json" => json = true,
            "--links" | "--out" => {
                let Some(v) = args.get(i + 1) else {
                    return usage();
                };
                if args[i] == "--links" {
                    links_path = Some(v.clone());
                } else {
                    out = Some(v.clone());
                }
                i += 1;
            }
            a if a.starts_with("--") => return usage(),
            a => files.push(a.to_string()),
        }
        i += 1;
    }
    let read = |p: &str| -> Result<Vec<u8>, i32> {
        std::fs::read(p).map_err(|e| {
            eprintln!(
                "{}",
                crate::terr!("e-gso-throughput-cannot-read", path = p, e = e.to_string())
            );
            2
        })
    };
    let (link_bytes, link_name) = match &links_path {
        Some(p) => match read(p) {
            Ok(b) => (b, Some(p.as_str())),
            Err(c) => return c,
        },
        None => (LINKS_CSV.as_bytes().to_vec(), None),
    };
    let links = match parse_links(&String::from_utf8_lossy(&link_bytes)) {
        Ok(l) => l,
        Err(e) => {
            eprintln!(
                "{}",
                crate::terr!(
                    "e-gso-throughput-bad-input",
                    path = link_name.unwrap_or(LINK_SET_ID),
                    e = e
                )
            );
            return 2;
        }
    };
    let info = link_set_info(link_name, &link_bytes, links.len());
    let emit = |v: &serde_json::Value| -> i32 {
        let text = serde_json::to_string_pretty(v).unwrap_or_default();
        if let Some(p) = &out {
            if let Err(e) = std::fs::write(p, format!("{text}\n")) {
                eprintln!(
                    "{}",
                    crate::terr!("e-gso-throughput-cannot-write", path = p, e = e.to_string())
                );
                return 2;
            }
        }
        if json {
            println!("{text}");
        }
        0
    };
    match sub {
        "template" if files.is_empty() => {
            println!(
                "{}",
                serde_json::to_string_pretty(&template()).unwrap_or_default()
            );
            0
        }
        "links" if files.is_empty() => {
            if json {
                let v = serde_json::json!({"link_set": info, "links": links});
                println!("{}", serde_json::to_string_pretty(&v).unwrap_or_default());
                return 0;
            }
            let acm = links.iter().filter(|l| l.acm).count();
            let gw = links.iter().filter(|l| l.ut_or_gw == "GW").count();
            let in_bands = links.iter().filter(|l| l.rule_band().is_some()).count();
            println!(
                "{}",
                crate::t!(
                    "gso-throughput-links-summary",
                    id = info.id.clone(),
                    sha = info.sha256.clone(),
                    pinned = info.matches_pinned_fcc_26_26.to_string(),
                    n = links.len(),
                    acm = acm,
                    gw = gw,
                    ut = links.len() - gw,
                    bands = in_bands
                )
            );
            0
        }
        "check-links" if files.is_empty() => {
            let r = check_links(&links, info);
            let v = serde_json::to_value(&r).unwrap_or_default();
            if !json {
                println!(
                    "{}",
                    crate::t!(
                        "gso-throughput-check-head",
                        id = r.link_set.id.clone(),
                        n = r.links,
                        within = r.within,
                        checks = r.checks
                    )
                );
                for c in &r.columns {
                    println!(
                        "{}",
                        crate::t!(
                            "gso-throughput-check-line",
                            column = c.column,
                            within = c.within,
                            checked = c.checked,
                            max = c.max_deviation.map_or_else(|| "-".to_string(), fmt)
                        )
                    );
                }
            }
            let code = emit(&v);
            if code != 0 {
                return code;
            }
            i32::from(r.within != r.checks)
        }
        "evaluate" if files.len() == 1 => {
            let b = match read(&files[0]) {
                Ok(b) => b,
                Err(c) => return c,
            };
            let input: RunInput = match serde_json::from_slice(&b) {
                Ok(v) => v,
                Err(e) => {
                    eprintln!(
                        "{}",
                        crate::terr!(
                            "e-gso-throughput-bad-input",
                            path = files[0].clone(),
                            e = e.to_string()
                        )
                    );
                    return 2;
                }
            };
            let r = match evaluate(&input, &links, info, &[(files[0].clone(), b)]) {
                Ok(r) => r,
                Err(e) => {
                    eprintln!(
                        "{}",
                        crate::terr!("e-gso-throughput-bad-input", path = files[0].clone(), e = e)
                    );
                    return 2;
                }
            };
            if !json {
                println!(
                    "{}",
                    crate::t!(
                        "gso-throughput-eval-head",
                        system = r.system.clone(),
                        n = r.links.len(),
                        total = r.link_set.links,
                        exceed = r.exceedances
                    )
                );
                for l in &r.links {
                    for c in &l.criteria {
                        println!(
                            "{}",
                            crate::t!(
                                "gso-throughput-eval-line",
                                carrier = l.carrier_num,
                                provision = c.provision,
                                value = fmt(c.value),
                                unit = c.unit,
                                limit = fmt(c.limit),
                                meets = c.meets.to_string()
                            )
                        );
                    }
                }
                if let Some(a) = &r.avoidance {
                    println!(
                        "{}",
                        crate::t!(
                            "gso-throughput-eval-line",
                            carrier = "-",
                            provision = a.provision,
                            value = fmt(a.value),
                            unit = a.unit,
                            limit = fmt(a.limit),
                            meets = a.meets.to_string()
                        )
                    );
                }
                println!("{}", DISCLAIMER);
            }
            let code = emit(&serde_json::to_value(&r).unwrap_or_default());
            if code != 0 {
                return code;
            }
            i32::from(r.exceedances > 0)
        }
        _ => usage(),
    }
}
