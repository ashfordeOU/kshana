// SPDX-License-Identifier: AGPL-3.0-only
//! LunaNet AFS interoperability planning: how far apart the AFS-Q code family sits from the GPS
//! L1 C/A and Galileo E1 families and from itself, and a user-equipment register schema.
//!
//! **The study.** Each code is sampled at a common rate `fs` (default 10.23 MHz, two samples per
//! AFS-Q chip) over a common integration time `T` (default 2 ms: one AFS-Q period, two GPS C/A
//! periods, half a Galileo E1 period) as ±1 values, the sign of the
//! code's value at that instant (for Galileo E1-B the CBOC subcarrier is included before the sign,
//! so the composite is approximated by its sign). For every pair the cross-correlation is computed
//! over every sample lag of the window, circularly (the window repeats):
//!
//! * at zero Doppler, exactly, by XOR and population count on 64-sample words;
//! * over a Doppler sweep within stated bounds (`±max_doppler_hz` in `step_hz`), for the pairs
//!   worst at zero Doppler, from 64-sample partial sums rotated by the Doppler phase at each word's
//!   centre. Within a word the phase moves by at most `2π·f·64/fs` (0.39 rad at 10 kHz), so the
//!   partial-sum method underestimates by at most the matching sinc factor (3 % at 10 kHz); the
//!   report states that factor.
//!
//! The window repeats, so with a whole number of code periods in it (AFS-Q, GPS C/A at 2 ms) the
//! figures are the periodic correlations; a code with a longer period (Galileo E1, 4 ms) is cut
//! and its figures are those of the 2 ms segment (stated). Results are in dB relative to the
//! window length `N` (the autocorrelation peak), with the largest out-of-phase autocorrelation
//! of each code (lags within one chip of zero excluded) for comparison.
//!
//! **What it is not.** The AFS is broadcast at 2492.028 MHz and GPS L1 and Galileo E1 at
//! 1575.42 MHz: radio-frequency filtering separates them in any receiver. The figures are
//! code-family separation as if the codes were co-channel and chip-synchronous in rate, the worst
//! case a multi-system receiver design or a reuse of the code families would face; they are not a
//! prediction of interference between the broadcast signals. Planning only, MODELLED.
//!
//! Galileo E1 memory codes are not bundled (their terms allow use, not redistribution; see
//! [`crate::iq::signals::galileo`]): the family is included when the user supplies the tables, and
//! reported as unavailable otherwise. AFS-I needs the LSIS attachments and is not included.
//!
//! **The register.** [`check_register`] validates a user-equipment register
//! (`kshana.lunar-ue-register/1`): one entry per piece of user equipment, with the signals and
//! PRNs it uses and the time scale and frame it reports, so a service provider can plan PRN and
//! code allocations against the users that depend on them. It holds no personal data: an entry
//! names an organisation, never a person.

use crate::iq::signals::{galileo, gps, lunanet};
use crate::iq::SpreadingCode;
use crate::portable_math::PortableFloat;
use serde::Serialize;
use serde_json::Value;

/// The honesty label.
pub const LABEL: &str = "MODELLED, planning only: code-family separation as if co-channel; the AFS (2492.028 MHz) and \
GPS L1 / Galileo E1 (1575.42 MHz) are separated by RF filtering in any receiver. Doppler sweep by 64-sample partial \
sums (small-angle loss stated).";

/// A code family.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
pub enum Family {
    /// LunaNet AFS-Q primary (10230 chips, 5.115 Mcps).
    #[serde(rename = "afs-q")]
    AfsQ,
    /// GPS L1 C/A (1023 chips, 1.023 Mcps).
    #[serde(rename = "gps-l1ca")]
    GpsL1Ca,
    /// Galileo E1-B (4092 chips, 1.023 Mcps, CBOC; user-supplied tables).
    #[serde(rename = "galileo-e1b")]
    GalileoE1b,
}

impl Family {
    /// Parse a name.
    pub fn parse(s: &str) -> Option<Family> {
        match s {
            "afs-q" => Some(Family::AfsQ),
            "gps-l1ca" => Some(Family::GpsL1Ca),
            "galileo-e1b" => Some(Family::GalileoE1b),
            _ => None,
        }
    }
    /// Chip rate, Hz.
    pub fn chip_rate_hz(self) -> f64 {
        match self {
            Family::AfsQ => 5.115e6,
            Family::GpsL1Ca | Family::GalileoE1b => 1.023e6,
        }
    }
    /// Primary code length, chips.
    pub fn code_len(self) -> usize {
        match self {
            Family::AfsQ => 10_230,
            Family::GpsL1Ca => 1_023,
            Family::GalileoE1b => 4_092,
        }
    }
    /// Name.
    pub fn name(self) -> &'static str {
        match self {
            Family::AfsQ => "afs-q",
            Family::GpsL1Ca => "gps-l1ca",
            Family::GalileoE1b => "galileo-e1b",
        }
    }
}

/// One code sampled into the window: ±1 as bits (1 for −1).
#[derive(Clone, Debug)]
pub struct Sampled {
    /// Family.
    pub family: Family,
    /// PRN.
    pub prn: u16,
    /// Bits, `n` of them.
    pub bits: Vec<u8>,
}

/// Sample a code into `n` samples at `fs`; `None` when the code is not available.
pub fn sample(family: Family, prn: u16, fs: f64, n: usize) -> Option<Sampled> {
    let bits: Vec<u8> = match family {
        Family::AfsQ => {
            let c = lunanet::afs_q_primary_bits(prn).ok()?;
            let rate = 5.115e6;
            (0..n)
                .map(|k| c[((k as f64 * rate / fs).floor() as usize) % c.len()])
                .collect()
        }
        Family::GpsL1Ca | Family::GalileoE1b => {
            let code = match family {
                Family::GpsL1Ca => gps::l1ca(prn).ok()?,
                _ => galileo::e1b(prn).ok()?,
            }
            .primary_only();
            let rate = code.chip_rate_hz();
            (0..n)
                .map(|k| u8::from(code.value_at(k as f64 * rate / fs) < 0.0))
                .collect()
        }
    };
    Some(Sampled { family, prn, bits })
}

fn pack(bits: &[u8]) -> Vec<u64> {
    let n = bits.len();
    let mut w = vec![0u64; (2 * n).div_ceil(64)];
    for i in 0..2 * n {
        if bits[i % n] == 1 {
            w[i / 64] |= 1u64 << (i % 64);
        }
    }
    w
}

fn window(w: &[u64], off: usize, n: usize) -> Vec<u64> {
    let words = n.div_ceil(64);
    let (q, r) = (off / 64, off % 64);
    let mut out = vec![0u64; words];
    for (k, o) in out.iter_mut().enumerate() {
        let lo = w.get(q + k).copied().unwrap_or(0) >> r;
        let hi = if r == 0 {
            0
        } else {
            w.get(q + k + 1).copied().unwrap_or(0) << (64 - r)
        };
        *o = lo | hi;
    }
    if !n.is_multiple_of(64) {
        out[words - 1] &= (1u64 << (n % 64)) - 1;
    }
    out
}

/// Per-word partial correlations of `a` with `b` shifted by `lag` (each in `[-64, 64]`).
fn partials(aw: &[u64], bw2: &[u64], lag: usize, n: usize) -> Vec<i32> {
    let bk = window(bw2, lag, n);
    aw.iter()
        .zip(&bk)
        .enumerate()
        .map(|(i, (x, y))| {
            let len = if (i + 1) * 64 <= n { 64 } else { n - i * 64 };
            len as i32 - 2 * (x ^ y).count_ones() as i32
        })
        .collect()
}

/// Largest |circular correlation| over all lags at zero Doppler. For an autocorrelation
/// (`exclude > 0`) the lags within `exclude` samples of a multiple of `period` samples (the
/// main peak, its oversampled skirt, and its repeats when the window holds several periods) are
/// skipped.
pub fn max_zero_doppler(a: &Sampled, b: &Sampled, exclude: usize, period: f64) -> i64 {
    let n = a.bits.len();
    let aw = window(&pack(&a.bits), 0, n);
    let bw = pack(&b.bits);
    let near_peak = |l: usize| {
        let r = (l as f64 / period).round() * period;
        (l as f64 - r).abs() < exclude as f64
    };
    (0..n)
        .filter(|&l| exclude == 0 || !near_peak(l))
        .map(|l| {
            partials(&aw, &bw, l, n)
                .iter()
                .map(|&p| i64::from(p))
                .sum::<i64>()
                .abs()
        })
        .max()
        .unwrap_or(0)
}

/// Largest |correlation| over all lags and the Doppler bins, by word partial sums.
pub fn max_with_doppler(a: &Sampled, b: &Sampled, fs: f64, dopplers: &[f64]) -> Vec<(f64, f64)> {
    let n = a.bits.len();
    let aw = window(&pack(&a.bits), 0, n);
    let bw = pack(&b.bits);
    let words = n.div_ceil(64);
    // Phasors at each word's centre.
    let ph: Vec<Vec<(f64, f64)>> = dopplers
        .iter()
        .map(|&f| {
            (0..words)
                .map(|i| {
                    let c = (i * 64) as f64 + 32.0;
                    let x = 2.0 * std::f64::consts::PI * f * c / fs;
                    x.psin_cos()
                })
                .map(|(s, c)| (c, s))
                .collect()
        })
        .collect();
    let mut best = vec![0.0f64; dopplers.len()];
    for l in 0..n {
        let p = partials(&aw, &bw, l, n);
        for (d, phs) in ph.iter().enumerate() {
            let (mut re, mut im) = (0.0, 0.0);
            for (v, (c, s)) in p.iter().zip(phs) {
                re += f64::from(*v) * c;
                im += f64::from(*v) * s;
            }
            best[d] = best[d].max((re * re + im * im).sqrt());
        }
    }
    dopplers.iter().copied().zip(best).collect()
}

fn db(x: f64, n: usize) -> f64 {
    if x <= 0.0 {
        f64::NEG_INFINITY
    } else {
        20.0 * (x / n as f64).plog10()
    }
}

/// Study settings.
#[derive(Clone, Debug, Serialize)]
pub struct Settings {
    /// Sample rate, Hz.
    pub fs_hz: f64,
    /// Integration time, s.
    pub integration_s: f64,
    /// AFS-Q PRNs.
    pub afs_prns: Vec<u16>,
    /// GPS L1 C/A PRNs.
    pub gps_prns: Vec<u16>,
    /// Galileo E1-B PRNs (used when the tables are available).
    pub galileo_prns: Vec<u16>,
    /// Doppler bound, Hz.
    pub max_doppler_hz: f64,
    /// Doppler step, Hz.
    pub doppler_step_hz: f64,
    /// Pairs swept in Doppler (the worst at zero Doppler).
    pub sweep_pairs: usize,
}

impl Default for Settings {
    fn default() -> Self {
        Self {
            fs_hz: 10.23e6,
            integration_s: 2e-3,
            afs_prns: (1..=12).collect(),
            gps_prns: (1..=32).collect(),
            galileo_prns: (1..=36).collect(),
            max_doppler_hz: 10_000.0,
            doppler_step_hz: 1_000.0,
            sweep_pairs: 3,
        }
    }
}

/// One pair's figure.
#[derive(Clone, Debug, Serialize)]
pub struct Pair {
    /// First code.
    pub a: (Family, u16),
    /// Second code.
    pub b: (Family, u16),
    /// Zero-Doppler largest |cross-correlation|, dB.
    pub zero_doppler_db: f64,
}

/// Family-pair summary.
#[derive(Clone, Debug, Serialize)]
pub struct FamilySummary {
    /// The two families.
    pub families: (Family, Family),
    /// Pairs computed.
    pub pairs: usize,
    /// Worst (largest) zero-Doppler cross-correlation, dB.
    pub worst_db: f64,
    /// Mean of the per-pair worst, dB.
    pub mean_db: f64,
}

/// A Doppler sweep of one pair.
#[derive(Clone, Debug, Serialize)]
pub struct Sweep {
    /// The pair.
    pub pair: Pair,
    /// `(doppler_hz, worst dB)`.
    pub bins: Vec<(f64, f64)>,
    /// Worst over the sweep, dB.
    pub worst_db: f64,
}

/// The study report.
#[derive(Clone, Debug, Serialize)]
pub struct Study {
    /// Document schema.
    pub schema: &'static str,
    /// Label.
    pub label: &'static str,
    /// Settings.
    pub settings: Settings,
    /// Window length, samples.
    pub samples: usize,
    /// Families not available, with the reason.
    pub unavailable: Vec<(Family, &'static str)>,
    /// Largest out-of-phase autocorrelation per family (worst over its PRNs), dB.
    pub autocorrelation_db: Vec<(Family, f64)>,
    /// Family-pair summaries.
    pub families: Vec<FamilySummary>,
    /// The worst pairs at zero Doppler.
    pub worst_pairs: Vec<Pair>,
    /// Doppler sweeps of the worst pairs.
    pub sweeps: Vec<Sweep>,
    /// Largest partial-sum loss in the sweep (sinc at the bound), as a fraction.
    pub sweep_max_loss: f64,
}

/// Run the study.
pub fn study(s: &Settings) -> Result<Study, String> {
    let n = (s.fs_hz * s.integration_s).round() as usize;
    if !(64..=200_000).contains(&n)
        || s.doppler_step_hz <= 0.0
        || s.doppler_step_hz.is_nan()
        || s.max_doppler_hz < 0.0
    {
        return Err(crate::terr!("e-afs-interop-bad-settings"));
    }
    let mut codes: Vec<Sampled> = Vec::new();
    let mut unavailable = Vec::new();
    for (fam, prns) in [
        (Family::AfsQ, &s.afs_prns),
        (Family::GpsL1Ca, &s.gps_prns),
        (Family::GalileoE1b, &s.galileo_prns),
    ] {
        let got: Vec<Sampled> = prns
            .iter()
            .filter_map(|&p| sample(fam, p, s.fs_hz, n))
            .collect();
        if got.is_empty() && !prns.is_empty() {
            unavailable.push((
                fam,
                match fam {
                    Family::GalileoE1b => {
                        "E1 memory codes not supplied (KSHANA_GALILEO_E1B; not bundled)"
                    }
                    _ => "no PRN of the list generated",
                },
            ));
        }
        codes.extend(got);
    }
    let mut auto: Vec<(Family, f64)> = Vec::new();
    for c in &codes {
        let spc = (s.fs_hz / c.family.chip_rate_hz()).ceil() as usize;
        let period = c.family.code_len() as f64 * s.fs_hz / c.family.chip_rate_hz();
        let a = db(max_zero_doppler(c, c, spc.max(1), period) as f64, n);
        match auto.iter_mut().find(|x| x.0 == c.family) {
            Some(x) => x.1 = x.1.max(a),
            None => auto.push((c.family, a)),
        }
    }
    let mut pairs = Vec::new();
    for i in 0..codes.len() {
        for j in i + 1..codes.len() {
            let (a, b) = (&codes[i], &codes[j]);
            // Within GPS and within Galileo the families are long published; compare them only
            // with the AFS family.
            if a.family == b.family && a.family != Family::AfsQ {
                continue;
            }
            if a.family != Family::AfsQ && b.family != Family::AfsQ {
                continue;
            }
            pairs.push(Pair {
                a: (a.family, a.prn),
                b: (b.family, b.prn),
                zero_doppler_db: db(max_zero_doppler(a, b, 0, n as f64) as f64, n),
            });
        }
    }
    let mut fams: Vec<FamilySummary> = Vec::new();
    for p in &pairs {
        let key = (p.a.0, p.b.0);
        match fams.iter_mut().find(|f| f.families == key) {
            Some(f) => {
                f.worst_db = f.worst_db.max(p.zero_doppler_db);
                f.mean_db += p.zero_doppler_db;
                f.pairs += 1;
            }
            None => fams.push(FamilySummary {
                families: key,
                pairs: 1,
                worst_db: p.zero_doppler_db,
                mean_db: p.zero_doppler_db,
            }),
        }
    }
    for f in &mut fams {
        f.mean_db /= f.pairs as f64;
    }
    let mut worst = pairs.clone();
    worst.sort_by(|x, y| y.zero_doppler_db.total_cmp(&x.zero_doppler_db));
    worst.truncate(s.sweep_pairs.max(1).min(worst.len()));
    let k = (s.max_doppler_hz / s.doppler_step_hz).floor() as i64;
    let dopplers: Vec<f64> = (-k..=k).map(|i| i as f64 * s.doppler_step_hz).collect();
    let find = |f: Family, p: u16| codes.iter().find(|c| c.family == f && c.prn == p);
    let mut sweeps = Vec::new();
    for w in worst.iter().take(s.sweep_pairs) {
        let (Some(a), Some(b)) = (find(w.a.0, w.a.1), find(w.b.0, w.b.1)) else {
            continue;
        };
        let bins: Vec<(f64, f64)> = max_with_doppler(a, b, s.fs_hz, &dopplers)
            .into_iter()
            .map(|(f, v)| (f, db(v, n)))
            .collect();
        let worst_db = bins.iter().map(|x| x.1).fold(f64::NEG_INFINITY, f64::max);
        sweeps.push(Sweep {
            pair: w.clone(),
            bins,
            worst_db,
        });
    }
    let x = std::f64::consts::PI * s.max_doppler_hz * 64.0 / s.fs_hz;
    let loss = if x == 0.0 { 0.0 } else { 1.0 - x.psin() / x };
    Ok(Study {
        schema: "kshana.afs-interop-study/1",
        label: LABEL,
        settings: s.clone(),
        samples: n,
        unavailable,
        autocorrelation_db: auto,
        families: fams,
        worst_pairs: worst,
        sweeps,
        sweep_max_loss: loss,
    })
}

// ───────────────────────────── user-equipment register ─────────────────────────────

/// The register's format tag.
pub const REGISTER_FORMAT: &str = "kshana.lunar-ue-register/1";
/// A template register (synthetic entries).
pub const REGISTER_TEMPLATE: &str = include_str!("../data/lunar/ue-register-template.json");

const PLATFORMS: &[&str] = &[
    "lander",
    "rover",
    "orbiter",
    "relay",
    "surface-station",
    "crewed-vehicle",
    "suit",
    "other",
];
const SIGNALS: &[&str] = &[
    "afs-i",
    "afs-q",
    "gps-l1ca",
    "gps-l1c",
    "galileo-e1",
    "other",
];
const STATUS: &[&str] = &["planned", "in-development", "active", "retired"];
const SCALES: &[&str] = &[
    "TT", "TDB", "TCB", "TCG", "TCL", "LTC", "UTC", "GPST", "other",
];
const FRAMES: &[&str] = &[
    "ICRF",
    "MOON_PA_DE440",
    "MOON_PA",
    "MOON_ME",
    "ILURF",
    "other",
];
/// Fields an entry may not have: a register names organisations, never people.
const PERSONAL: &[&str] = &["email", "phone", "person", "name_of_contact", "contact"];

/// One register finding.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct RegisterFinding {
    /// Entry index (0-based), or none for the document.
    pub entry: Option<usize>,
    /// The field.
    pub field: String,
    /// What is wrong.
    pub rule: &'static str,
}

/// The register check.
#[derive(Clone, Debug, Serialize)]
pub struct RegisterReport {
    /// Document schema.
    pub schema: &'static str,
    /// Entries.
    pub entries: usize,
    /// Findings.
    pub findings: Vec<RegisterFinding>,
    /// AFS-Q PRNs in use and how many entries use each.
    pub afs_q_prn_users: Vec<(u64, usize)>,
    /// True without findings.
    pub valid: bool,
}

/// Validate a register's text.
pub fn check_register(text: &str) -> Result<RegisterReport, String> {
    let doc: Value = serde_json::from_str(text)
        .map_err(|e| crate::terr!("e-afs-interop-bad-register", e = e))?;
    let mut f = Vec::new();
    let mut bad = |entry: Option<usize>, field: &str, rule: &'static str| {
        f.push(RegisterFinding {
            entry,
            field: field.to_string(),
            rule,
        })
    };
    if doc["format"] != REGISTER_FORMAT {
        bad(None, "format", "must be kshana.lunar-ue-register/1");
    }
    let entries = doc["entries"].as_array().cloned().unwrap_or_default();
    let mut ids: Vec<String> = Vec::new();
    let mut prn_users: Vec<(u64, usize)> = Vec::new();
    for (i, e) in entries.iter().enumerate() {
        let s = |k: &str| e[k].as_str().filter(|x| !x.trim().is_empty());
        let one_of = |k: &str, set: &[&str]| s(k).is_some_and(|x| set.contains(&x));
        match s("ue_id") {
            None => bad(Some(i), "ue_id", "required"),
            Some(id) if ids.iter().any(|x| x == id) => bad(Some(i), "ue_id", "must be unique"),
            Some(id) => ids.push(id.to_string()),
        }
        if s("organisation").is_none() {
            bad(Some(i), "organisation", "required");
        }
        if !one_of("platform", PLATFORMS) {
            bad(Some(i), "platform", "must be a known platform");
        }
        if !one_of("status", STATUS) {
            bad(
                Some(i),
                "status",
                "must be planned, in-development, active or retired",
            );
        }
        if !one_of("time_scale", SCALES) {
            bad(Some(i), "time_scale", "must be a known time scale");
        }
        if !one_of("frame", FRAMES) {
            bad(Some(i), "frame", "must be a known frame");
        }
        match e["signals"].as_array() {
            Some(a) if !a.is_empty() => {
                if a.iter()
                    .any(|x| !x.as_str().is_some_and(|x| SIGNALS.contains(&x)))
                {
                    bad(Some(i), "signals", "must name known signals");
                }
            }
            _ => bad(Some(i), "signals", "must be a non-empty list"),
        }
        if let Some(a) = e["afs_q_prns"].as_array() {
            for p in a {
                match p.as_u64() {
                    Some(p) if (1..=210).contains(&p) => {
                        match prn_users.iter_mut().find(|x| x.0 == p) {
                            Some(x) => x.1 += 1,
                            None => prn_users.push((p, 1)),
                        }
                    }
                    _ => bad(Some(i), "afs_q_prns", "must be 1 to 210"),
                }
            }
        }
        if let Some(o) = e.as_object() {
            for k in o.keys() {
                if PERSONAL.iter().any(|p| k.to_ascii_lowercase().contains(p)) {
                    bad(Some(i), k, "personal contact fields are not allowed");
                }
            }
        }
    }
    prn_users.sort_unstable();
    Ok(RegisterReport {
        schema: "kshana.lunar-ue-register-check/1",
        entries: entries.len(),
        valid: f.is_empty(),
        findings: f,
        afs_q_prn_users: prn_users,
    })
}

// ───────────────────────────── command line ─────────────────────────────

fn prn_list(opt: &str, v: &str) -> Result<Vec<u16>, String> {
    let bad = || crate::terr!("e-afs-interop-bad-number", option = opt, value = v);
    let mut out = Vec::new();
    for part in v.split(',').filter(|p| !p.is_empty()) {
        match part.split_once('-') {
            Some((a, b)) => {
                let (a, b): (u16, u16) =
                    (a.parse().map_err(|_| bad())?, b.parse().map_err(|_| bad())?);
                if a > b || b - a > 300 {
                    return Err(bad());
                }
                out.extend(a..=b);
            }
            None => out.push(part.parse().map_err(|_| bad())?),
        }
    }
    Ok(out)
}

/// `kshana afs-interop <study|ue-register>`: JSON to standard output or `--out`. Exit 0, 1 when a
/// register is invalid, 2 on a usage or input error.
pub fn run_cli(args: &[String]) -> i32 {
    match cli(args) {
        Ok(c) => c,
        Err(e) => {
            eprintln!("{e}");
            2
        }
    }
}

fn cli(args: &[String]) -> Result<i32, String> {
    let Some(sub) = args.first() else {
        return Err(crate::t!("afs-interop-usage"));
    };
    if sub == "--help" || sub == "-h" || args.iter().any(|a| a == "--help") {
        println!("{}", crate::t!("afs-interop-usage"));
        return Ok(0);
    }
    let mut pos = Vec::new();
    let mut kv: Vec<(String, String)> = Vec::new();
    let mut template = false;
    let mut it = args[1..].iter();
    while let Some(a) = it.next() {
        if a == "--template" {
            template = true;
        } else if a.starts_with("--") {
            let v = it
                .next()
                .ok_or_else(|| crate::terr!("e-afs-interop-missing-value", option = a))?;
            kv.push((a.clone(), v.clone()));
        } else {
            pos.push(a.clone());
        }
    }
    let get = |k: &str| kv.iter().rev().find(|p| p.0 == k).map(|p| p.1.clone());
    let num = |k: &str| -> Result<Option<f64>, String> {
        get(k)
            .map(|v| {
                v.parse::<f64>()
                    .ok()
                    .filter(|x| x.is_finite())
                    .ok_or_else(|| crate::terr!("e-afs-interop-bad-number", option = k, value = v))
            })
            .transpose()
    };
    let out = get("--out");
    let emit = |text: String| -> Result<(), String> {
        match &out {
            Some(p) => std::fs::write(p, text)
                .map_err(|e| crate::terr!("e-afs-interop-cannot-write", path = p, e = e)),
            None => {
                print!("{text}");
                Ok(())
            }
        }
    };
    match sub.as_str() {
        "study" => {
            let known = [
                "--afs-prns",
                "--gps-prns",
                "--galileo-prns",
                "--fs",
                "--integration-ms",
                "--max-doppler",
                "--doppler-step",
                "--sweep-pairs",
                "--out",
            ];
            if let Some((k, _)) = kv.iter().find(|(k, _)| !known.contains(&k.as_str())) {
                return Err(crate::terr!("e-afs-interop-unknown-option", option = k));
            }
            let mut s = Settings::default();
            if let Some(v) = get("--afs-prns") {
                s.afs_prns = prn_list("--afs-prns", &v)?;
            }
            if let Some(v) = get("--gps-prns") {
                s.gps_prns = prn_list("--gps-prns", &v)?;
            }
            if let Some(v) = get("--galileo-prns") {
                s.galileo_prns = prn_list("--galileo-prns", &v)?;
            }
            if let Some(v) = num("--fs")? {
                s.fs_hz = v;
            }
            if let Some(v) = num("--integration-ms")? {
                s.integration_s = v / 1000.0;
            }
            if let Some(v) = num("--max-doppler")? {
                s.max_doppler_hz = v;
            }
            if let Some(v) = num("--doppler-step")? {
                s.doppler_step_hz = v;
            }
            if let Some(v) = num("--sweep-pairs")? {
                s.sweep_pairs = v.max(0.0) as usize;
            }
            let st = study(&s)?;
            emit(serde_json::to_string_pretty(&st).map_err(|e| e.to_string())? + "\n")?;
            Ok(0)
        }
        "ue-register" => {
            if let Some((k, _)) = kv.iter().find(|(k, _)| k != "--out") {
                return Err(crate::terr!("e-afs-interop-unknown-option", option = k));
            }
            if template {
                emit(REGISTER_TEMPLATE.to_string())?;
                return Ok(0);
            }
            let text = match pos.first() {
                Some(p) => std::fs::read_to_string(p)
                    .map_err(|e| crate::terr!("e-afs-interop-cannot-read", path = p, e = e))?,
                None => REGISTER_TEMPLATE.to_string(),
            };
            let r = check_register(&text)?;
            emit(serde_json::to_string_pretty(&r).map_err(|e| e.to_string())? + "\n")?;
            Ok(i32::from(!r.valid))
        }
        _ => Err(crate::t!("afs-interop-usage")),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn small() -> Settings {
        Settings {
            afs_prns: vec![1, 2],
            gps_prns: vec![1, 2, 3],
            galileo_prns: vec![],
            max_doppler_hz: 2000.0,
            doppler_step_hz: 1000.0,
            sweep_pairs: 1,
            ..Settings::default()
        }
    }

    #[test]
    fn a_code_against_itself_peaks_at_the_window_length() {
        let a = sample(Family::GpsL1Ca, 1, 10.23e6, 10_230).unwrap();
        // One full C/A period sampled ten times per chip: the in-phase product is N.
        let n = a.bits.len();
        let aw = window(&pack(&a.bits), 0, n);
        let full: i32 = partials(&aw, &pack(&a.bits), 0, n).iter().sum();
        assert_eq!(full as usize, n);
        // Out of phase, a Gold code stays far below.
        let side = max_zero_doppler(&a, &a, 10, 10_230.0) as f64 / n as f64;
        assert!(side < 0.15, "{side}");
        // The Doppler path agrees with the exact zero-Doppler figure at 0 Hz.
        let b = sample(Family::GpsL1Ca, 2, 10.23e6, 10_230).unwrap();
        let z = max_zero_doppler(&a, &b, 0, n as f64) as f64;
        let d = max_with_doppler(&a, &b, 10.23e6, &[0.0]);
        assert!((d[0].1 - z).abs() < 1e-9);
    }

    #[test]
    fn the_small_study_runs_and_reports_galileo_unavailable_when_asked_without_tables() {
        let mut s = small();
        let st = study(&s).unwrap();
        assert_eq!(st.samples, 20_460);
        // GPS C/A out-of-phase autocorrelation: the Gold-code bound, 65/1023, is -23.9 dB.
        let ca = st
            .autocorrelation_db
            .iter()
            .find(|a| a.0 == Family::GpsL1Ca)
            .unwrap()
            .1;
        assert!(ca < -20.0, "{ca}");
        assert!(st
            .families
            .iter()
            .any(|f| f.families == (Family::AfsQ, Family::AfsQ)));
        assert!(st
            .families
            .iter()
            .any(|f| f.families == (Family::AfsQ, Family::GpsL1Ca)));
        assert_eq!(st.sweeps.len(), 1);
        assert_eq!(st.sweeps[0].bins.len(), 5);
        for f in &st.families {
            assert!(f.worst_db < -15.0, "{f:?}");
        }
        s.galileo_prns = vec![1];
        if crate::iq::signals::galileo::e1b(1).is_err() {
            let st = study(&s).unwrap();
            assert!(st.unavailable.iter().any(|u| u.0 == Family::GalileoE1b));
        }
        s.doppler_step_hz = 0.0;
        assert!(study(&s).is_err());
    }

    #[test]
    fn the_register_template_is_valid_and_violations_are_named() {
        let r = check_register(REGISTER_TEMPLATE).unwrap();
        assert!(r.valid, "{:?}", r.findings);
        assert!(r.entries >= 2);
        let bad = r#"{"format":"kshana.lunar-ue-register/1","entries":[
          {"ue_id":"a","organisation":"x","platform":"rover","status":"active","time_scale":"TCL","frame":"MOON_ME","signals":["afs-q"],"afs_q_prns":[300],"contact_email":"x"},
          {"ue_id":"a","platform":"tank","status":"maybe","signals":[]}]}"#;
        let r = check_register(bad).unwrap();
        let got: Vec<(Option<usize>, &str)> = r
            .findings
            .iter()
            .map(|f| (f.entry, f.field.as_str()))
            .collect();
        for want in [
            (Some(0), "afs_q_prns"),
            (Some(0), "contact_email"),
            (Some(1), "ue_id"),
            (Some(1), "organisation"),
            (Some(1), "platform"),
            (Some(1), "status"),
            (Some(1), "signals"),
        ] {
            assert!(got.contains(&want), "{want:?} not in {got:?}");
        }
        assert!(check_register("nope").is_err());
    }
}
