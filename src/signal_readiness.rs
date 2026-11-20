// SPDX-License-Identifier: AGPL-3.0-only
//! Future-signal readiness of a receiver configuration (`kshana signal-readiness`).
//!
//! A receiver, a log converter or an avionics data path is often built for the constellations as
//! they were: GPS PRNs up to 32, SBAS PRNs up to 138, no L1C, BeiDou as an extra rather than a
//! core constellation. This module checks a declared receiver **profile** (per system: the
//! highest PRN or satellite number it accepts, the RINEX observation codes it tracks, and whether
//! it uses the system in its solution) against the published numbering and signal plans, and
//! checks **observation files** (RINEX 3/4) against the profile: satellites or signals present in
//! the data that the profile would drop.
//!
//! The reference values, each from a public document:
//!
//! | System | Range | Source |
//! |---|---|---|
//! | GPS | PRN 1–63 reserved for GPS | gps.gov, "L1 C/A PRN Code Assignments", January 2026 edition |
//! | SBAS | PRN 120–158 (allocations as listed) | the same table |
//! | Galileo | SVID 1–36 (codes assigned to SVID n, n = 1 to 36) | Galileo OS SIS ICD, Issue 2.1, November 2023 |
//! | BeiDou | PRN 1–63 | BDS SIS ICD Open Service Signal B2a, Version 1.0, December 2017, section 7.1 ("effective value in the range of 1 to 63"; B1C and B2a of one satellite share the PRN) |
//! | QZSS | RINEX J01–J10 | RINEX 4.01 (10 July 2023), section 4.5 and Table 6 |
//!
//! Signal codes are those of RINEX 4.01 Tables 10 (GPS), 12 (Galileo), 13 (SBAS) and 15 (BDS):
//! GPS L1C `C1S` / `C1L` / `C1X`, L5 `C5I` / `C5Q` / `C5X`; Galileo E1 OS `C1B` / `C1C` / `C1X`,
//! E5a `C5I` / `C5Q` / `C5X`; BDS B1C `C1D` / `C1P` / `C1X`, B2a `C5D` / `C5P` / `C5X`; SBAS L5
//! `C5I` / `C5Q` / `C5X`. This is a readiness check of declared numbers and codes against those
//! documents; it does not test a receiver, and it is not a statement about any avionics standard.

use serde::{Deserialize, Serialize};
use std::collections::{BTreeMap, BTreeSet};

/// The reference numbering of one system.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Reference {
    /// The RINEX system letter.
    pub system: char,
    /// The system's name.
    pub name: &'static str,
    /// The lowest number.
    pub min: u32,
    /// The highest number.
    pub max: u32,
    /// What the number is (`PRN`, `SVID`, RINEX satellite number).
    pub number: &'static str,
    /// Where the range comes from.
    pub source: &'static str,
}

/// The reference ranges.
pub const REFERENCES: [Reference; 5] = [
    Reference {
        system: 'G',
        name: "GPS",
        min: 1,
        max: 63,
        number: "PRN",
        source: "gps.gov L1 C/A PRN Code Assignments, January 2026 edition: PRN 1-63 reserved for GPS",
    },
    Reference {
        system: 'S',
        name: "SBAS",
        min: 120,
        max: 158,
        number: "PRN (RINEX Snn = PRN - 100)",
        source: "gps.gov L1 C/A PRN Code Assignments, January 2026 edition: PRN 120-158 reserved for SBAS",
    },
    Reference {
        system: 'E',
        name: "Galileo",
        min: 1,
        max: 36,
        number: "SVID",
        source: "Galileo OS SIS ICD Issue 2.1 (November 2023): codes assigned to SVID n, n = 1 to 36",
    },
    Reference {
        system: 'C',
        name: "BeiDou",
        min: 1,
        max: 63,
        number: "PRN",
        source: "BDS SIS ICD Open Service Signal B2a Version 1.0 (December 2017), section 7.1: PRN 1 to 63",
    },
    Reference {
        system: 'J',
        name: "QZSS",
        min: 1,
        max: 10,
        number: "RINEX satellite number (J01-J10)",
        source: "RINEX 4.01 (10 July 2023), section 4.5 and Table 6",
    },
];

/// SBAS PRNs above 138 that the January 2026 table allocates (PRN, allocation as printed).
pub const SBAS_ALLOCATED_ABOVE_138: [(u32, &str); 11] = [
    (139, "MSAS (QZS-7)"),
    (140, "SDCM (Luch-5V)"),
    (141, "SDCM (Luch-5A)"),
    (142, "KASS (KOREASAT-116N)"),
    (143, "BDSBAS (G3)"),
    (144, "BDSBAS (G2)"),
    (145, "Pak-SBAS (PakSat-MM1)"),
    (147, "ASECNA (ANGA)"),
    (148, "A-SBAS (Alcomsat-1)"),
    (150, "EGNOS (HOTBIRD 13G)"),
    (158, "UK SBAS (Inmarsat 3F5)"),
];

/// A signal group whose codes the check looks for.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct SignalGroup {
    /// The system letter.
    pub system: char,
    /// The signal's name.
    pub signal: &'static str,
    /// Its RINEX 4.01 pseudorange codes.
    pub codes: &'static [&'static str],
}

/// The future and dual-frequency signals checked.
pub const SIGNALS: [SignalGroup; 7] = [
    SignalGroup {
        system: 'G',
        signal: "GPS L1C",
        codes: &["C1S", "C1L", "C1X"],
    },
    SignalGroup {
        system: 'G',
        signal: "GPS L5",
        codes: &["C5I", "C5Q", "C5X"],
    },
    SignalGroup {
        system: 'E',
        signal: "Galileo E1 OS",
        codes: &["C1B", "C1C", "C1X"],
    },
    SignalGroup {
        system: 'E',
        signal: "Galileo E5a",
        codes: &["C5I", "C5Q", "C5X"],
    },
    SignalGroup {
        system: 'C',
        signal: "BDS B1C",
        codes: &["C1D", "C1P", "C1X"],
    },
    SignalGroup {
        system: 'C',
        signal: "BDS B2a",
        codes: &["C5D", "C5P", "C5X"],
    },
    SignalGroup {
        system: 'S',
        signal: "SBAS L5",
        codes: &["C5I", "C5Q", "C5X"],
    },
];

/// One system of a receiver profile.
#[derive(Clone, Debug, Default, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SystemProfile {
    /// The highest PRN (SBAS: the PRN, not Snn; QZSS: the RINEX number) the receiver accepts.
    pub max_number: u32,
    /// The RINEX pseudorange codes it tracks.
    #[serde(default)]
    pub codes: Vec<String>,
    /// Whether it uses the system in its solution.
    #[serde(default)]
    pub in_solution: bool,
}

/// A receiver profile.
#[derive(Clone, Debug, Default, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Profile {
    /// A name.
    pub name: String,
    /// Per system, keyed by `gps`, `sbas`, `galileo`, `beidou`, `qzss`.
    #[serde(default)]
    pub gps: Option<SystemProfile>,
    /// SBAS.
    #[serde(default)]
    pub sbas: Option<SystemProfile>,
    /// Galileo.
    #[serde(default)]
    pub galileo: Option<SystemProfile>,
    /// BeiDou.
    #[serde(default)]
    pub beidou: Option<SystemProfile>,
    /// QZSS.
    #[serde(default)]
    pub qzss: Option<SystemProfile>,
}

impl Profile {
    /// The profile of the system with RINEX letter `s`.
    pub fn system(&self, s: char) -> Option<&SystemProfile> {
        match s {
            'G' => self.gps.as_ref(),
            'S' => self.sbas.as_ref(),
            'E' => self.galileo.as_ref(),
            'C' => self.beidou.as_ref(),
            'J' => self.qzss.as_ref(),
            _ => None,
        }
    }
}

/// How serious a finding is.
#[derive(Clone, Copy, Debug, PartialEq, Eq, PartialOrd, Ord, Serialize)]
#[serde(rename_all = "kebab-case")]
pub enum Level {
    /// For the record.
    Info,
    /// The configuration falls short of the published plan.
    Gap,
    /// Data present would be dropped by the configuration.
    Drop,
}

/// One finding.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Finding {
    /// How serious.
    pub level: Level,
    /// A stable machine name.
    pub check: String,
    /// The system letter.
    pub system: char,
    /// The values behind it (numbers, codes, satellites).
    pub detail: BTreeMap<String, serde_json::Value>,
    /// The source of the reference value, when one applies.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub source: Option<String>,
}

fn finding(
    level: Level,
    check: &str,
    system: char,
    detail: Vec<(&str, serde_json::Value)>,
    source: Option<&str>,
) -> Finding {
    Finding {
        level,
        check: check.to_string(),
        system,
        detail: detail
            .into_iter()
            .map(|(k, v)| (k.to_string(), v))
            .collect(),
        source: source.map(str::to_string),
    }
}

/// Check a profile against the reference ranges and signal plans.
pub fn check_profile(p: &Profile) -> Vec<Finding> {
    let mut out = Vec::new();
    for r in REFERENCES {
        let Some(s) = p.system(r.system) else {
            out.push(finding(Level::Gap, "system-absent", r.system, vec![], None));
            continue;
        };
        if s.max_number < r.max {
            let mut detail = vec![
                ("profile_max", s.max_number.into()),
                ("reference_max", r.max.into()),
            ];
            if r.system == 'S' {
                let mut above: Vec<(u32, &str)> = SBAS_ALLOCATED_ABOVE_138
                    .iter()
                    .copied()
                    .filter(|(prn, _)| *prn > s.max_number)
                    .collect();
                above.sort();
                detail.push((
                    "allocated_prns_dropped",
                    serde_json::json!(above
                        .iter()
                        .map(|(prn, who)| serde_json::json!({"prn": prn, "allocation": who}))
                        .collect::<Vec<_>>()),
                ));
            }
            out.push(finding(
                Level::Gap,
                "number-range",
                r.system,
                detail,
                Some(r.source),
            ));
        }
        if !s.in_solution && matches!(r.system, 'G' | 'E' | 'C') {
            out.push(finding(
                Level::Gap,
                "not-in-solution",
                r.system,
                vec![],
                None,
            ));
        }
    }
    for g in SIGNALS {
        let Some(s) = p.system(g.system) else {
            continue;
        };
        if !g.codes.iter().any(|c| s.codes.iter().any(|x| x == c)) {
            out.push(finding(
                Level::Gap,
                "signal-not-tracked",
                g.system,
                vec![
                    ("signal", g.signal.into()),
                    ("codes", serde_json::json!(g.codes)),
                ],
                Some("RINEX 4.01 observation code tables"),
            ));
        }
    }
    out
}

/// What an observation file holds, per system.
#[derive(Clone, Debug, Default, PartialEq, Serialize)]
pub struct FileSummary {
    /// The file's RINEX version.
    pub version: f64,
    /// Satellites seen, per system letter.
    pub satellites: BTreeMap<char, BTreeSet<String>>,
    /// Observation codes declared, per system letter.
    pub codes: BTreeMap<char, Vec<String>>,
    /// Epochs.
    pub epochs: usize,
}

/// Summarise a RINEX 3/4 observation file.
pub fn summarise_rinex(text: &str) -> Result<FileSummary, String> {
    let r = crate::rinex_obs::parse_obs(text)?;
    let mut s = FileSummary {
        version: r.header.version,
        epochs: r.epochs.len(),
        ..Default::default()
    };
    for (sys, codes) in &r.header.obs_types {
        s.codes.insert(*sys, codes.clone());
    }
    for e in &r.epochs {
        for so in &e.sats {
            if let Some(c) = so.sat.chars().next() {
                s.satellites.entry(c).or_default().insert(so.sat.clone());
            }
        }
    }
    Ok(s)
}

fn sat_number(sat: &str) -> Option<u32> {
    sat.get(1..)?.trim().parse().ok()
}

/// Check a file summary against a profile: satellites beyond the profile's range, codes the
/// profile does not track, and future signals present in the data.
pub fn check_file(p: &Profile, f: &FileSummary) -> Vec<Finding> {
    let mut out = Vec::new();
    for (sys, sats) in &f.satellites {
        let Some(sp) = p.system(*sys) else {
            if REFERENCES.iter().any(|r| r.system == *sys) {
                out.push(finding(
                    Level::Drop,
                    "system-dropped",
                    *sys,
                    vec![("satellites", serde_json::json!(sats))],
                    None,
                ));
            }
            continue;
        };
        let beyond: Vec<&String> = sats
            .iter()
            .filter(|s| {
                sat_number(s).is_some_and(|n| {
                    let n = if *sys == 'S' { n + 100 } else { n };
                    n > sp.max_number
                })
            })
            .collect();
        if !beyond.is_empty() {
            out.push(finding(
                Level::Drop,
                "satellites-beyond-range",
                *sys,
                vec![
                    ("profile_max", sp.max_number.into()),
                    ("satellites", serde_json::json!(beyond)),
                ],
                None,
            ));
        }
    }
    for (sys, codes) in &f.codes {
        let Some(sp) = p.system(*sys) else { continue };
        let untracked: Vec<&String> = codes
            .iter()
            .filter(|c| c.starts_with('C') && !sp.codes.contains(c))
            .collect();
        if !untracked.is_empty() {
            out.push(finding(
                Level::Drop,
                "codes-not-tracked",
                *sys,
                vec![("codes", serde_json::json!(untracked))],
                None,
            ));
        }
        for g in SIGNALS.iter().filter(|g| g.system == *sys) {
            let present: Vec<&String> = codes
                .iter()
                .filter(|c| g.codes.contains(&c.as_str()))
                .collect();
            if !present.is_empty() {
                out.push(finding(
                    Level::Info,
                    "signal-in-data",
                    *sys,
                    vec![
                        ("signal", g.signal.into()),
                        ("codes", serde_json::json!(present)),
                    ],
                    None,
                ));
            }
        }
    }
    out
}

/// The readiness report.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Report {
    /// The schema id.
    pub schema: String,
    /// The profile's name.
    pub profile: String,
    /// The reference ranges used.
    pub references: Vec<Reference>,
    /// Profile findings.
    pub profile_findings: Vec<Finding>,
    /// Per file, its summary and findings.
    pub files: Vec<FileReport>,
    /// Findings per level.
    pub counts: BTreeMap<String, usize>,
}

/// One file's part of the report.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct FileReport {
    /// The file's name as given.
    pub name: String,
    /// Its summary.
    pub summary: FileSummary,
    /// Its findings.
    pub findings: Vec<Finding>,
}

/// Build the report for a profile and files (name, RINEX text).
pub fn report(p: &Profile, files: &[(String, String)]) -> Result<Report, String> {
    let profile_findings = check_profile(p);
    let mut out_files = Vec::new();
    for (name, text) in files {
        let summary = summarise_rinex(text).map_err(|e| {
            crate::terr!("e-signal-readiness-bad-rinex", path = name.clone(), e = e)
        })?;
        let findings = check_file(p, &summary);
        out_files.push(FileReport {
            name: name.clone(),
            summary,
            findings,
        });
    }
    let mut counts = BTreeMap::new();
    for f in profile_findings
        .iter()
        .chain(out_files.iter().flat_map(|f| f.findings.iter()))
    {
        let k = match f.level {
            Level::Info => "info",
            Level::Gap => "gap",
            Level::Drop => "drop",
        };
        *counts.entry(k.to_string()).or_insert(0) += 1;
    }
    Ok(Report {
        schema: "kshana.signal-readiness/1".to_string(),
        profile: p.name.clone(),
        references: REFERENCES.to_vec(),
        profile_findings,
        files: out_files,
        counts,
    })
}

/// `kshana signal-readiness <profile.toml> [<obs.rnx>...]`: the report as JSON; exit status 0.
pub fn run(args: &[String]) -> Result<(), String> {
    if let Some(a) = args.iter().find(|a| a.starts_with("--")) {
        if a == "--help" {
            return Err(crate::t!("signal-readiness-usage"));
        }
        return Err(crate::terr!(
            "e-signal-readiness-unknown-option",
            option = a.clone()
        ));
    }
    let Some((profile_path, files)) = args.split_first() else {
        return Err(crate::t!("signal-readiness-usage"));
    };
    let read = |p: &String| {
        std::fs::read_to_string(p).map_err(|e| {
            crate::terr!(
                "e-signal-readiness-cannot-read",
                path = p.clone(),
                e = e.to_string()
            )
        })
    };
    let profile: Profile = toml::from_str(&read(profile_path)?).map_err(|e| {
        crate::terr!(
            "e-signal-readiness-bad-profile",
            path = profile_path.clone(),
            e = e.to_string()
        )
    })?;
    let mut inputs = Vec::new();
    for f in files {
        inputs.push((f.clone(), read(f)?));
    }
    let r = report(&profile, &inputs)?;
    println!(
        "{}",
        serde_json::to_string_pretty(&r).map_err(|e| e.to_string())?
    );
    Ok(())
}
