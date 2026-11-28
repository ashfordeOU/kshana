// SPDX-License-Identifier: AGPL-3.0-only
//! First-72-hours breakup exposure report (`kshana breakup-exposure`, docs/BREAKUP-EXPOSURE.md).
//!
//! From a breakup event (parent object, epoch, explosion or collision) and a public element-set
//! catalogue given as files, the report states which tracked objects' orbits intersect the
//! modelled debris shell and ranks them by the time they spend inside it over the next hours
//! (72 by default).
//!
//! **Fragment-cloud model.** The NASA Standard Breakup Model of Johnson et al. (2001), *NASA's
//! new breakup model of EVOLVE 4.0*, Adv. Space Res. 28(9), 1377-1384, as restated in open
//! sources read on 2026-11-28:
//!
//! * fragments of characteristic length `Lc` or larger: `N = 6 S Lc^-1.6` for an explosion, with
//!   S between 0.1 and 1; `N = 0.1 M^0.75 Lc^-1.71` for a collision, with `M = Mt + Mp` (kg)
//!   for a catastrophic collision and `M = Mp vimp^2` (vimp in km/s) otherwise (Krisko, *Proper
//!   implementation of the 1998 NASA Breakup Model*, NASA ODQN 15(4), October 2011,
//!   <https://orbitaldebris.jsc.nasa.gov/quarterly-news/pdfs/odqnv15i4.pdf>, equations 1-4); a
//!   collision is catastrophic when `Mp vimp^2 / (2 Mt)` reaches 40 J/g (arXiv:2407.18197,
//!   equation 22);
//! * the ejection speed: `log10(Δv)` normal with mean `0.2 χ + 1.85` (explosion) or
//!   `0.9 χ + 2.9` (collision) and standard deviation 0.4, `χ = log10(A/m)`, Δv in m/s,
//!   directions spherically symmetric (arXiv:2407.18197, equation 29 and Section IV,
//!   <https://arxiv.org/abs/2407.18197>).
//!
//! **Shell.** The model's area-to-mass distribution is not used. With the largest `A/m` given
//! as an input (`χ_max`), the shell is bounded by the speed `Δv_max` at a stated percentile of
//! the ejection-speed distribution at `χ_max`: every two-body orbit reached from the parent's
//! position and velocity at the event by a kick of at most `Δv_max` in any direction (sampled on
//! a sphere) gives a lowest perigee, a highest apogee and a highest inclination; the shell is
//! the spherical layer between those radii, within the latitude band of that inclination. It
//! does not move, spread or decay over the window (no drag, no J2 on the shell); the
//! along-track spreading of the cloud is not modelled, and the parent's own propagated position
//! stands for the cloud's centre.
//!
//! **Objects.** Every other object in the catalogue is propagated with SGP4 from its latest
//! element set; the report gives, for each object whose perigee-apogee range overlaps the
//! shell, the hours it spends inside the shell, when it first enters, and its closest distance
//! to the cloud centre. The ranking is by hours inside the shell, then by closest distance.
//!
//! **Evidence: MODELLED.** This is a screening estimate from a statistical breakup model and
//! public element sets. It is not a conjunction assessment, a collision probability, or a
//! statement about any catalogued fragment.

use std::collections::BTreeMap;

use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};

use crate::jd2::Jd2;
use crate::sgp4::{MeanElementSet, SgpOrbit};

/// Report format tag.
pub const FORMAT: &str = "kshana.breakup-exposure/1";
/// What the report is not.
pub const DISCLAIMER: &str = "MODELLED screening estimate from the NASA Standard Breakup Model (fragment count and ejection-speed law) and public element sets propagated with SGP4. It is not a conjunction assessment or a collision probability, and it says nothing about any individual fragment.";
/// The sources of the model.
pub const SOURCES: &[(&str, &str)] = &[
    (
        "Krisko, Proper Implementation of the 1998 NASA Breakup Model, NASA Orbital Debris Quarterly News 15(4), October 2011 (equations 1-4: fragment counts), fetched 2026-11-28",
        "https://orbitaldebris.jsc.nasa.gov/quarterly-news/pdfs/odqnv15i4.pdf",
    ),
    (
        "Threat Level Estimation From Possible Break-Up Events In LEO, arXiv:2407.18197 (equations 21, 22 and 29: counts, the 40 J/g threshold and the ejection-speed law of the NASA Standard Breakup Model), fetched 2026-11-28",
        "https://arxiv.org/abs/2407.18197",
    ),
    (
        "Johnson, Krisko, Liou and Anz-Meador, NASA's new breakup model of EVOLVE 4.0, Advances in Space Research 28(9), 1377-1384, 2001 (the model's original publication; not read here)",
        "https://doi.org/10.1016/S0273-1177(01)00423-9",
    ),
];
/// Specific energy above which a collision is catastrophic, J/kg (40 J/g).
pub const CATASTROPHIC_J_PER_KG: f64 = 40_000.0;
/// Standard deviation of log10(Δv).
pub const SIGMA_LOG_DV: f64 = 0.4;
const MU_M3_S2: f64 = 3.986_004_418e14;
const RE_M: f64 = 6_378_137.0;

/// The event file.
#[derive(Debug, Clone, Deserialize)]
pub struct EventFile {
    /// The event.
    pub event: Event,
    /// Model settings (defaults when absent).
    #[serde(default)]
    pub model: ModelSettings,
}

/// The breakup event.
#[derive(Debug, Clone, Deserialize)]
pub struct Event {
    /// A name for the report.
    pub name: String,
    /// Event epoch, UTC, `YYYY-MM-DDTHH:MM:SS[.fff][Z]`.
    pub epoch: String,
    /// `explosion` or `collision`.
    pub kind: String,
    /// NORAD number of the parent; its latest element set in the catalogue is used.
    pub parent_norad: u32,
    /// Explosion scaling factor S (0.1 to 1).
    #[serde(default)]
    pub scaling_factor: Option<f64>,
    /// Collision: target mass, kg.
    #[serde(default)]
    pub target_mass_kg: Option<f64>,
    /// Collision: projectile mass, kg.
    #[serde(default)]
    pub projectile_mass_kg: Option<f64>,
    /// Collision: impact speed, km/s.
    #[serde(default)]
    pub impact_speed_km_s: Option<f64>,
}

/// Model settings, each an assumption written into the report.
#[derive(Debug, Clone, Deserialize, Serialize)]
pub struct ModelSettings {
    /// Smallest characteristic length counted, m.
    pub min_characteristic_length_m: f64,
    /// Largest area-to-mass ratio of the fragments the shell covers, m²/kg.
    pub area_to_mass_max_m2_kg: f64,
    /// Percentile of the ejection-speed distribution at that ratio.
    pub delta_v_percentile: f64,
    /// Window, hours.
    pub hours: f64,
    /// Propagation step, s.
    pub step_s: f64,
    /// Directions sampled on the sphere.
    pub directions: usize,
}

impl Default for ModelSettings {
    fn default() -> Self {
        Self {
            min_characteristic_length_m: 0.1,
            area_to_mass_max_m2_kg: 1.0,
            delta_v_percentile: 99.0,
            hours: 72.0,
            step_s: 60.0,
            directions: 2000,
        }
    }
}

/// One catalogue element set.
#[derive(Debug, Clone)]
pub struct CatalogueObject {
    /// NORAD number.
    pub norad: u32,
    /// Name.
    pub name: String,
    /// The SGP4 elements.
    pub set: MeanElementSet,
}

/// The modelled shell.
#[derive(Debug, Clone, Serialize)]
pub struct Shell {
    /// Ejection speed bounding the shell, m/s.
    pub delta_v_max_m_s: f64,
    /// Median ejection speed at the same area-to-mass ratio, m/s.
    pub delta_v_median_m_s: f64,
    /// Lowest perigee altitude reached, km.
    pub perigee_min_km: f64,
    /// Highest apogee altitude reached, km.
    pub apogee_max_km: f64,
    /// Highest latitude the shell reaches, deg.
    pub latitude_max_deg: f64,
    /// The parent's altitude at the event, km.
    pub parent_altitude_km: f64,
}

/// One row of the exposure table.
#[derive(Debug, Clone, Serialize)]
pub struct Exposure {
    /// Rank, 1 = most exposed.
    pub rank: usize,
    /// NORAD number.
    pub norad: u32,
    /// Name.
    pub name: String,
    /// Mean perigee altitude, km.
    pub perigee_km: f64,
    /// Mean apogee altitude, km.
    pub apogee_km: f64,
    /// Inclination, deg.
    pub inclination_deg: f64,
    /// Hours inside the shell during the window.
    pub hours_in_shell: f64,
    /// Share of the window inside the shell, percent.
    pub percent_in_shell: f64,
    /// First time inside the shell, hours after the event.
    pub first_entry_h: Option<f64>,
    /// Closest distance to the cloud centre (the parent's propagated position), km.
    pub min_distance_to_centre_km: f64,
    /// When, hours after the event.
    pub min_distance_at_h: f64,
}

/// The report.
#[derive(Debug, Clone, Serialize)]
pub struct Report {
    /// Format tag.
    pub format: &'static str,
    /// Evidence label.
    pub label: &'static str,
    /// Event name.
    pub event: String,
    /// Event epoch as given.
    pub epoch: String,
    /// `explosion` or `collision`.
    pub kind: String,
    /// Parent NORAD number and name.
    pub parent: serde_json::Value,
    /// Model settings used.
    pub model: ModelSettings,
    /// Fragments of the minimum length or larger (model mean).
    pub fragments_at_or_above_min_length: f64,
    /// The collision regime when a collision.
    pub collision_regime: Option<&'static str>,
    /// The shell.
    pub shell: Shell,
    /// Sources.
    pub sources: Vec<serde_json::Value>,
    /// Assumptions.
    pub assumptions: Vec<&'static str>,
    /// Inputs with their hashes.
    pub inputs: Vec<serde_json::Value>,
    /// Objects screened (catalogue objects other than the parent).
    pub objects_screened: usize,
    /// Objects whose perigee-apogee range overlaps the shell.
    pub objects_intersecting: usize,
    /// Objects that SGP4 could not propagate over the window, with the reason.
    pub objects_skipped: Vec<serde_json::Value>,
    /// The ranked table of intersecting objects.
    pub exposure: Vec<Exposure>,
    /// What the report is not.
    pub disclaimer: &'static str,
}

/// The assumptions written into each report.
pub const ASSUMPTIONS: &[&str] = &[
    "fragment count and ejection-speed law of the NASA Standard Breakup Model; directions spherically symmetric",
    "the shell is bounded by the ejection speed at the stated percentile for the stated largest area-to-mass ratio; the model's area-to-mass distribution is not sampled",
    "two-body orbits from the parent's SGP4 state at the event give the shell's lowest perigee, highest apogee and latitude band; the shell does not move, spread or decay over the window",
    "the parent's propagated pre-event orbit stands for the cloud centre; along-track spreading is not modelled",
    "every other catalogue object is propagated with SGP4 from its latest element set; an object is inside the shell when its radius is within the shell and its latitude within the band",
];

/// Inverse of the standard normal distribution function (Acklam's rational approximation,
/// relative error below 1.2e-9).
pub fn normal_quantile(p: f64) -> f64 {
    const A: [f64; 6] = [
        -3.969_683_028_665_376e1,
        2.209_460_984_245_205e2,
        -2.759_285_104_469_687e2,
        1.383_577_518_672_69e2,
        -3.066_479_806_614_716e1,
        2.506_628_277_459_239,
    ];
    const B: [f64; 5] = [
        -5.447_609_879_822_406e1,
        1.615_858_368_580_409e2,
        -1.556_989_798_598_866e2,
        6.680_131_188_771_972e1,
        -1.328_068_155_288_572e1,
    ];
    const C: [f64; 6] = [
        -7.784_894_002_430_293e-3,
        -3.223_964_580_411_365e-1,
        -2.400_758_277_161_838,
        -2.549_732_539_343_734,
        4.374_664_141_464_968,
        2.938_163_982_698_783,
    ];
    const D: [f64; 4] = [
        7.784_695_709_041_462e-3,
        3.224_671_290_700_398e-1,
        2.445_134_137_142_996,
        3.754_408_661_907_416,
    ];
    let pl = 0.02425;
    if p < pl {
        let q = (-2.0 * p.ln()).sqrt();
        (((((C[0] * q + C[1]) * q + C[2]) * q + C[3]) * q + C[4]) * q + C[5])
            / ((((D[0] * q + D[1]) * q + D[2]) * q + D[3]) * q + 1.0)
    } else if p <= 1.0 - pl {
        let q = p - 0.5;
        let r = q * q;
        (((((A[0] * r + A[1]) * r + A[2]) * r + A[3]) * r + A[4]) * r + A[5]) * q
            / (((((B[0] * r + B[1]) * r + B[2]) * r + B[3]) * r + B[4]) * r + 1.0)
    } else {
        -normal_quantile(1.0 - p)
    }
}

/// Mean of log10(Δv) (Δv in m/s) at χ = log10(A/m) for an explosion or a collision.
pub fn mean_log_dv(collision: bool, chi: f64) -> f64 {
    if collision {
        0.9 * chi + 2.9
    } else {
        0.2 * chi + 1.85
    }
}

/// Fragments of characteristic length `lc_m` or larger: explosion `6 S Lc^-1.6`, collision
/// `0.1 M^0.75 Lc^-1.71`.
pub fn fragment_count(collision: bool, s_or_m: f64, lc_m: f64) -> f64 {
    if collision {
        0.1 * s_or_m.powf(0.75) * lc_m.powf(-1.71)
    } else {
        6.0 * s_or_m * lc_m.powf(-1.6)
    }
}

/// The collision mass M (kg) and regime from the target and projectile masses (kg) and the
/// impact speed (km/s).
pub fn collision_mass(mt: f64, mp: f64, v_km_s: f64) -> (f64, &'static str) {
    let e = mp * (v_km_s * 1e3).powi(2) / (2.0 * mt);
    if e >= CATASTROPHIC_J_PER_KG {
        (mt + mp, "catastrophic")
    } else {
        (mp * v_km_s * v_km_s, "non-catastrophic")
    }
}

fn dot(a: [f64; 3], b: [f64; 3]) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn norm(a: [f64; 3]) -> f64 {
    dot(a, a).sqrt()
}
fn cross(a: [f64; 3], b: [f64; 3]) -> [f64; 3] {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

/// Perigee radius, apogee radius (m; infinite when unbound) and inclination (deg) of the
/// two-body orbit through `r`, `v`.
pub fn two_body(r: [f64; 3], v: [f64; 3]) -> (f64, f64, f64) {
    let rn = norm(r);
    let v2 = dot(v, v);
    let hv = cross(r, v);
    let hn = norm(hv);
    let energy = v2 / 2.0 - MU_M3_S2 / rn;
    let p = hn * hn / MU_M3_S2;
    let e = (1.0 + 2.0 * energy * hn * hn / (MU_M3_S2 * MU_M3_S2))
        .max(0.0)
        .sqrt();
    let inc = (hv[2] / hn).clamp(-1.0, 1.0).acos().to_degrees();
    let rp = p / (1.0 + e);
    let ra = if e < 1.0 {
        p / (1.0 - e)
    } else {
        f64::INFINITY
    };
    (rp, ra, inc)
}

/// The shell from the parent's state and the bounding ejection speed.
pub fn shell(r: [f64; 3], v: [f64; 3], dv_max: f64, directions: usize) -> (f64, f64, f64) {
    let n = directions.max(16);
    let golden = std::f64::consts::PI * (3.0 - 5f64.sqrt());
    let (mut rp_min, mut ra_max, mut lat_max) = (f64::INFINITY, 0.0f64, 0.0f64);
    for k in 0..=n {
        let (dv, d) = if k == n {
            (0.0, [0.0; 3])
        } else {
            let z = 1.0 - 2.0 * (k as f64 + 0.5) / n as f64;
            let rr = (1.0 - z * z).sqrt();
            let th = golden * k as f64;
            (dv_max, [rr * th.cos(), rr * th.sin(), z])
        };
        let vk = [v[0] + dv * d[0], v[1] + dv * d[1], v[2] + dv * d[2]];
        let (rp, ra, inc) = two_body(r, vk);
        rp_min = rp_min.min(rp);
        ra_max = ra_max.max(ra);
        lat_max = lat_max.max(inc.min(180.0 - inc));
    }
    (rp_min, ra_max, lat_max)
}

/// Parse a UTC epoch `YYYY-MM-DDTHH:MM:SS[.fff][Z]` to a two-part Julian date.
pub fn parse_epoch(s: &str) -> Option<Jd2> {
    let s = s.trim().trim_end_matches('Z');
    let (d, t) = s.split_once('T').unwrap_or((s, "00:00:00"));
    let mut dp = d.split('-');
    let (y, m, dd) = (
        dp.next()?.parse::<i64>().ok()?,
        dp.next()?.parse::<u32>().ok()?,
        dp.next()?.parse::<u32>().ok()?,
    );
    let mut tp = t.split(':');
    let (hh, mm, ss) = (
        tp.next()?.parse::<f64>().ok()?,
        tp.next()?.parse::<f64>().ok()?,
        tp.next().unwrap_or("0").parse::<f64>().ok()?,
    );
    if !(1..=12).contains(&m) || !(1..=31).contains(&dd) {
        return None;
    }
    let days = crate::gnss_time::days_from_civil(y, m, dd);
    let frac = (hh * 3600.0 + mm * 60.0 + ss) / 86_400.0;
    Some(Jd2::from_parts(2_440_587.5 + days as f64, frac))
}

fn omm_object(o: &serde_json::Value) -> Result<CatalogueObject, String> {
    let f = |k: &str| -> Result<f64, String> {
        o.get(k)
            .and_then(|v| {
                v.as_f64()
                    .or_else(|| v.as_str().and_then(|s| s.parse().ok()))
            })
            .ok_or_else(|| format!("OMM record without {k}"))
    };
    let norad = f("NORAD_CAT_ID")? as u32;
    let epoch = o
        .get("EPOCH")
        .and_then(|v| v.as_str())
        .and_then(parse_epoch)
        .ok_or_else(|| format!("OMM record {norad} with a bad EPOCH"))?;
    Ok(CatalogueObject {
        norad,
        name: o
            .get("OBJECT_NAME")
            .and_then(|v| v.as_str())
            .unwrap_or("")
            .to_string(),
        set: MeanElementSet {
            epoch_utc: epoch,
            no_kozai: f("MEAN_MOTION")? * std::f64::consts::TAU / 1440.0,
            ecco: f("ECCENTRICITY")?,
            inclo: f("INCLINATION")?.to_radians(),
            nodeo: f("RA_OF_ASC_NODE")?.to_radians(),
            argpo: f("ARG_OF_PERICENTER")?.to_radians(),
            mo: f("MEAN_ANOMALY")?.to_radians(),
            bstar: f("BSTAR").unwrap_or(0.0),
        },
    })
}

/// Parse a catalogue file: OMM JSON (one record or an array, CelesTrak/Space-Track GP keywords)
/// or two- or three-line element sets.
pub fn parse_catalogue(text: &str) -> Result<Vec<CatalogueObject>, String> {
    let t = text.trim_start_matches('\u{feff}').trim();
    if t.starts_with('[') || t.starts_with('{') {
        let v: serde_json::Value = serde_json::from_str(t).map_err(|e| e.to_string())?;
        return match &v {
            serde_json::Value::Array(a) => a.iter().map(omm_object).collect(),
            o => Ok(vec![omm_object(o)?]),
        };
    }
    let lines: Vec<&str> = t
        .lines()
        .map(str::trim_end)
        .filter(|l| !l.is_empty())
        .collect();
    let mut out = Vec::new();
    let mut i = 0;
    while i < lines.len() {
        let (name, l1, l2) = if lines[i].starts_with("1 ")
            && lines.get(i + 1).is_some_and(|l| l.starts_with("2 "))
        {
            i += 2;
            (String::new(), lines[i - 2], lines[i - 1])
        } else if lines.get(i + 1).is_some_and(|l| l.starts_with("1 "))
            && lines.get(i + 2).is_some_and(|l| l.starts_with("2 "))
        {
            i += 3;
            (
                lines[i - 3].trim_start_matches("0 ").trim().to_string(),
                lines[i - 2],
                lines[i - 1],
            )
        } else {
            return Err(format!(
                "line {}: not a two- or three-line element set",
                i + 1
            ));
        };
        let orbit = SgpOrbit::from_tle(l1, l2)?;
        let norad = crate::tle::parse_tle_identity(l1)?.norad_cat_id;
        out.push(CatalogueObject {
            norad,
            name,
            set: orbit.set,
        });
    }
    Ok(out)
}

fn mean_alt(set: &MeanElementSet) -> (f64, f64) {
    // Kozai mean motion is close enough for a perigee/apogee screen (WGS-72 xke, radians/min).
    let a_er = (0.074_366_916_133_173_41 / set.no_kozai).powf(2.0 / 3.0);
    let a_km = a_er * 6378.135;
    (
        a_km * (1.0 - set.ecco) - 6378.135,
        a_km * (1.0 + set.ecco) - 6378.135,
    )
}

/// Build the report. `files` are (name, bytes) of the catalogue inputs; the event file's name and
/// bytes are recorded with them.
pub fn evaluate(
    event_name: &str,
    event_bytes: &[u8],
    files: &[(String, Vec<u8>)],
) -> Result<Report, String> {
    let ev: EventFile = toml::from_str(&String::from_utf8_lossy(event_bytes))
        .map_err(|e| format!("{event_name}: {e}"))?;
    let m = ev.model.clone();
    if !(m.min_characteristic_length_m > 0.0
        && m.area_to_mass_max_m2_kg > 0.0
        && m.delta_v_percentile > 0.0
        && m.delta_v_percentile < 100.0
        && m.hours > 0.0
        && m.step_s > 0.0
        && m.hours * 3600.0 / m.step_s <= 1_000_000.0)
    {
        return Err("model settings out of range (positive lengths and ratios, a percentile between 0 and 100, at most 1e6 steps)".into());
    }
    let t0 = parse_epoch(&ev.event.epoch)
        .ok_or_else(|| format!("bad event epoch {}", ev.event.epoch))?;
    let collision = match ev.event.kind.as_str() {
        "explosion" => false,
        "collision" => true,
        k => return Err(format!("kind {k} is neither explosion nor collision")),
    };
    let (count, regime) = if collision {
        let (Some(mt), Some(mp), Some(v)) = (
            ev.event.target_mass_kg,
            ev.event.projectile_mass_kg,
            ev.event.impact_speed_km_s,
        ) else {
            return Err(
                "a collision needs target_mass_kg, projectile_mass_kg and impact_speed_km_s".into(),
            );
        };
        let (mass, regime) = collision_mass(mt, mp, v);
        (
            fragment_count(true, mass, m.min_characteristic_length_m),
            Some(regime),
        )
    } else {
        let s = ev.event.scaling_factor.unwrap_or(1.0);
        (
            fragment_count(false, s, m.min_characteristic_length_m),
            None,
        )
    };
    // Latest element set per object.
    let mut cat: BTreeMap<u32, CatalogueObject> = BTreeMap::new();
    let mut inputs = vec![serde_json::json!({"path": event_name, "role": "event",
        "sha256": hex::encode(Sha256::digest(event_bytes))})];
    for (name, bytes) in files {
        let objs =
            parse_catalogue(&String::from_utf8_lossy(bytes)).map_err(|e| format!("{name}: {e}"))?;
        inputs.push(
            serde_json::json!({"path": name, "role": "catalogue", "records": objs.len(),
            "sha256": hex::encode(Sha256::digest(bytes))}),
        );
        for o in objs {
            let newer = cat
                .get(&o.norad)
                .is_none_or(|c| o.set.epoch_utc.total() > c.set.epoch_utc.total());
            if newer {
                cat.insert(o.norad, o);
            }
        }
    }
    let parent = cat
        .get(&ev.event.parent_norad)
        .ok_or_else(|| format!("parent {} is not in the catalogue", ev.event.parent_norad))?
        .clone();
    let parent_orbit = SgpOrbit::new(parent.set);
    let (r0, v0) = parent_orbit.teme_state(t0)?;
    let chi = m.area_to_mass_max_m2_kg.log10();
    let mu = mean_log_dv(collision, chi);
    let dv_max = 10f64.powf(mu + SIGMA_LOG_DV * normal_quantile(m.delta_v_percentile / 100.0));
    let (rp, ra, lat) = shell(r0, v0, dv_max, m.directions);
    let (r_lo, r_hi) = (rp, ra);
    let steps = (m.hours * 3600.0 / m.step_s).round() as usize;
    let centre: Vec<Option<[f64; 3]>> = (0..=steps)
        .map(|k| {
            parent_orbit
                .teme_state(t0.add_seconds(k as f64 * m.step_s))
                .ok()
                .map(|s| s.0)
        })
        .collect();
    let mut rows = Vec::new();
    let mut skipped = Vec::new();
    let mut screened = 0;
    for o in cat.values().filter(|o| o.norad != parent.norad) {
        screened += 1;
        let (q, qa) = mean_alt(&o.set);
        if (qa + 6378.135) * 1e3 < r_lo || (q + 6378.135) * 1e3 > r_hi {
            continue;
        }
        let orbit = SgpOrbit::new(o.set);
        let (mut inside, mut first, mut dmin, mut dmin_t) = (0usize, None, f64::INFINITY, 0.0);
        let mut failed = None;
        for (k, c) in centre.iter().enumerate() {
            let t = t0.add_seconds(k as f64 * m.step_s);
            match orbit.teme_state(t) {
                Ok((r, _)) => {
                    let rn = norm(r);
                    let la = (r[2] / rn).asin().to_degrees().abs();
                    if rn >= r_lo && rn <= r_hi && la <= lat {
                        inside += 1;
                        first.get_or_insert(k as f64 * m.step_s / 3600.0);
                    }
                    if let Some(c) = c {
                        let d = norm([r[0] - c[0], r[1] - c[1], r[2] - c[2]]) / 1e3;
                        if d < dmin {
                            dmin = d;
                            dmin_t = k as f64 * m.step_s / 3600.0;
                        }
                    }
                }
                Err(e) => {
                    failed = Some(e);
                    break;
                }
            }
        }
        if let Some(e) = failed {
            skipped.push(serde_json::json!({"norad": o.norad, "reason": e}));
            continue;
        }
        let hours_in = inside as f64 * m.step_s / 3600.0;
        rows.push(Exposure {
            rank: 0,
            norad: o.norad,
            name: o.name.clone(),
            perigee_km: q,
            apogee_km: qa,
            inclination_deg: o.set.inclo.to_degrees(),
            hours_in_shell: hours_in,
            percent_in_shell: 100.0 * inside as f64 / (steps + 1) as f64,
            first_entry_h: first,
            min_distance_to_centre_km: dmin,
            min_distance_at_h: dmin_t,
        });
    }
    rows.sort_by(|a, b| {
        b.hours_in_shell
            .total_cmp(&a.hours_in_shell)
            .then(
                a.min_distance_to_centre_km
                    .total_cmp(&b.min_distance_to_centre_km),
            )
            .then(a.norad.cmp(&b.norad))
    });
    for (i, r) in rows.iter_mut().enumerate() {
        r.rank = i + 1;
    }
    Ok(Report {
        format: FORMAT,
        label: "MODELLED",
        event: ev.event.name.clone(),
        epoch: ev.event.epoch.clone(),
        kind: ev.event.kind.clone(),
        parent: serde_json::json!({"norad": parent.norad, "name": parent.name}),
        model: m,
        fragments_at_or_above_min_length: count,
        collision_regime: regime,
        shell: Shell {
            delta_v_max_m_s: dv_max,
            delta_v_median_m_s: 10f64.powf(mu),
            perigee_min_km: r_lo / 1e3 - RE_M / 1e3,
            apogee_max_km: r_hi / 1e3 - RE_M / 1e3,
            latitude_max_deg: lat,
            parent_altitude_km: norm(r0) / 1e3 - RE_M / 1e3,
        },
        sources: SOURCES
            .iter()
            .map(|(t, u)| serde_json::json!({"title": t, "url": u}))
            .collect(),
        assumptions: ASSUMPTIONS.to_vec(),
        inputs,
        objects_screened: screened,
        objects_intersecting: rows.len() + skipped.len(),
        objects_skipped: skipped,
        exposure: rows,
        disclaimer: DISCLAIMER,
    })
}

/// `kshana breakup-exposure <event.toml> <catalogue> ... [--json] [--out <file>]`
pub fn run_cli(args: &[String]) -> i32 {
    let usage = || {
        eprintln!("{}", crate::t!("breakup-exposure-usage"));
        2
    };
    if args.iter().any(|a| a == "--help" || a == "-h") {
        println!("{}", crate::t!("breakup-exposure-usage"));
        return 0;
    }
    let mut json = false;
    let mut out = None;
    let mut files = Vec::new();
    let mut i = 0;
    while i < args.len() {
        match args[i].as_str() {
            "--json" => json = true,
            "--out" => match args.get(i + 1) {
                Some(p) => {
                    out = Some(p.clone());
                    i += 1;
                }
                None => return usage(),
            },
            a if a.starts_with("--") => return usage(),
            a => files.push(a.to_string()),
        }
        i += 1;
    }
    if files.len() < 2 {
        return usage();
    }
    let mut read = Vec::new();
    for f in &files {
        match std::fs::read(f) {
            Ok(b) => read.push((f.clone(), b)),
            Err(e) => {
                eprintln!(
                    "{}",
                    crate::terr!(
                        "e-breakup-exposure-cannot-read",
                        path = f.clone(),
                        e = e.to_string()
                    )
                );
                return 2;
            }
        }
    }
    let r = match evaluate(&read[0].0, &read[0].1, &read[1..]) {
        Ok(r) => r,
        Err(e) => {
            eprintln!("{}", crate::terr!("e-breakup-exposure-bad-input", e = e));
            return 2;
        }
    };
    let text = serde_json::to_string_pretty(&r).unwrap_or_default();
    if let Some(p) = &out {
        if let Err(e) = std::fs::write(p, format!("{text}\n")) {
            eprintln!(
                "{}",
                crate::terr!(
                    "e-breakup-exposure-cannot-write",
                    path = p.clone(),
                    e = e.to_string()
                )
            );
            return 2;
        }
    }
    if json {
        println!("{text}");
        return 0;
    }
    let f1 = |x: f64| crate::i18n::localise_decimal(format!("{x:.1}"));
    println!(
        "{}",
        crate::t!(
            "breakup-exposure-head",
            event = r.event.clone(),
            n = f1(r.fragments_at_or_above_min_length),
            lc = f1(r.model.min_characteristic_length_m * 100.0),
            lo = f1(r.shell.perigee_min_km),
            hi = f1(r.shell.apogee_max_km),
            lat = f1(r.shell.latitude_max_deg),
            dv = f1(r.shell.delta_v_max_m_s),
            hours = f1(r.model.hours),
            hit = r.objects_intersecting,
            screened = r.objects_screened
        )
    );
    for e in &r.exposure {
        println!(
            "{}",
            crate::t!(
                "breakup-exposure-row",
                rank = e.rank,
                norad = e.norad,
                name = e.name.clone(),
                hours = f1(e.hours_in_shell),
                dist = f1(e.min_distance_to_centre_km),
                at = f1(e.min_distance_at_h)
            )
        );
    }
    println!("{DISCLAIMER}");
    0
}
