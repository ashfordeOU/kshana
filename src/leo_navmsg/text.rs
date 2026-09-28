// SPDX-License-Identifier: AGPL-3.0-only
//! Text exports of LEO navigation messages: a RINEX-4-style record block and a CSV table.
//!
//! **RINEX 4.02 defines no LEO navigation records.** Its system letters are G, R, E, J, C,
//! I and S only (IGS RINEX 4.02, files.igs.org/pub/data/format/rinex_4.02.pdf). The block
//! written here borrows the RINEX 4 shape (a `> EPH` record header, a satellite and epoch
//! line with three clock terms, then broadcast-orbit lines of four `D19.12` fields) and is
//! a **documented Kshana extension**: system letter `L`, record types `KP16` (Galileo
//! 16-parameter set), `KRAC` (with along/cross/radial corrections), `LU22` (Liu et al.
//! 2025) and `APOL` (ECEF polynomial). A header comment says so in every file. Prior art
//! for carrying LEO orbits in RINEX-4-style navigation records: arXiv 2401.17767, which
//! converts two-line element sets into RINEX 4 navigation records with small format
//! changes.
//!
//! Record layout (each orbit line is four spaces then four `D19.12` fields):
//!
//! ```text
//! > EPH L04 KRAC
//! L04 yyyy mm dd hh mm ss  af0 af1 af2          epoch = toc (or toe / tref, zero clock)
//!      IOD      Crs      deltaN   M0            (KP16, KRAC, LU22)
//!      Cuc      e        Cus      sqrtA
//!      toe      Cic      Omega0   Cis
//!      i0       Crc      omega    OmegaDot
//!      IDOT     Band     Week     Health
//!      txTOW    clock    p1       p2            KRAC: degA degC; LU22: aDot nDot; KP16: 0 0
//!      ...                                     KRAC: degR, tau_s, a_k, c_k, r_k; LU22: Crs3 Crc3 Crs1 Crc1
//! ```
//!
//! `APOL`: the epoch line, then `IOD Band Week Health`, then `txTOW clock degP tref`, then
//! the x, y and z coefficients, four per line. Angles are in radians, as in RINEX; the
//! epoch is a calendar date on the leap-second-free system time scale counted from the
//! GPS origin (1980-01-06), as a RINEX GPS epoch is.
//!
//! The CSV table carries the Keplerian and correction models one message per row. The
//! default column schema uses the Galileo ICD parameter names; [`CsvSchema`] lets a preset
//! supply its own spellings.

use super::elements::{
    ClockPoly, EcefPoly, EphemerisModel, Keplerian, LeoNavMessage, Liu22Extra, RacPoly, Services,
};

/// Days from 1980-01-06 to a civil date and back.
fn civil_from_days(z: i64) -> (i64, u32, u32) {
    // Days since 1970-01-01 to civil (Howard Hinnant's algorithm).
    let z = z + 719_468;
    let era = z.div_euclid(146_097);
    let doe = z.rem_euclid(146_097);
    let yoe = (doe - doe / 1460 + doe / 36_524 - doe / 146_096) / 365;
    let y = yoe + era * 400;
    let doy = doe - (365 * yoe + yoe / 4 - yoe / 100);
    let mp = (5 * doy + 2) / 153;
    let d = (doy - (153 * mp + 2) / 5 + 1) as u32;
    let m = if mp < 10 { mp + 3 } else { mp - 9 } as u32;
    (if m <= 2 { y + 1 } else { y }, m, d)
}

fn days_from_civil(y: i64, m: u32, d: u32) -> i64 {
    let y = if m <= 2 { y - 1 } else { y };
    let era = y.div_euclid(400);
    let yoe = y.rem_euclid(400);
    let mp = if m > 2 { m - 3 } else { m + 9 } as i64;
    let doy = (153 * mp + 2) / 5 + d as i64 - 1;
    let doe = yoe * 365 + yoe / 4 - yoe / 100 + doy;
    era * 146_097 + doe - 719_468
}

/// Days from 1970-01-01 to the GPS origin 1980-01-06.
const GPS_ORIGIN_DAYS: i64 = 3657;

/// Calendar epoch `(y, m, d, hh, mm, ss)` of a week and time of week.
pub fn calendar(week: u32, tow: f64) -> (i64, u32, u32, u32, u32, f64) {
    let total = week as f64 * 7.0 * 86_400.0 + tow;
    let days = (total / 86_400.0).floor();
    let sod = total - days * 86_400.0;
    let (y, m, d) = civil_from_days(GPS_ORIGIN_DAYS + days as i64);
    let hh = (sod / 3600.0).floor();
    let mm = ((sod - hh * 3600.0) / 60.0).floor();
    let ss = sod - hh * 3600.0 - mm * 60.0;
    (y, m, d, hh as u32, mm as u32, ss)
}

/// Week and time of week of a calendar epoch.
pub fn from_calendar(y: i64, m: u32, d: u32, hh: u32, mm: u32, ss: f64) -> (u32, f64) {
    let days = days_from_civil(y, m, d) - GPS_ORIGIN_DAYS;
    let week = days.div_euclid(7);
    let dow = days.rem_euclid(7);
    (
        week as u32,
        dow as f64 * 86_400.0 + hh as f64 * 3600.0 + mm as f64 * 60.0 + ss,
    )
}

/// A value in RINEX `D19.12` form.
fn d19(v: f64) -> String {
    let s = format!("{v:.12E}");
    // Rust prints "1.234000000000E-9"; RINEX wants a signed two-digit exponent.
    let (mant, exp) = s.split_once('E').unwrap_or((&s, "0"));
    let e: i32 = exp.parse().unwrap_or(0);
    let sign = if e < 0 { '-' } else { '+' };
    format!("{:>19}", format!("{mant}E{sign}{:02}", e.abs()))
}

fn orbit_line(vals: &[f64]) -> String {
    let mut s = String::from("    ");
    for v in vals {
        s.push_str(&d19(*v));
    }
    s.push('\n');
    s
}

fn record_type(m: &EphemerisModel) -> &'static str {
    match m {
        EphemerisModel::Kepler16 { .. } => "KP16",
        EphemerisModel::KeplerRac { .. } => "KRAC",
        EphemerisModel::Liu22 { .. } => "LU22",
        EphemerisModel::EcefPoly { .. } => "APOL",
    }
}

/// The file header of the RINEX-style export.
pub fn rinex_header() -> String {
    let lines = [
        (
            "     4.02           N: GNSS NAV DATA    L: LEO (KSHANA EXT)",
            "RINEX VERSION / TYPE",
        ),
        ("kshana leo-navmsg", "PGM / RUN BY / DATE"),
        (
            "KSHANA LEO NAVIGATION EXTENSION 1: NOT PART OF RINEX 4.02",
            "COMMENT",
        ),
        (
            "SYSTEM L AND TYPES KP16 KRAC LU22 APOL ARE KSHANA'S OWN",
            "COMMENT",
        ),
        (
            "PRIOR ART FOR LEO RECORDS IN RINEX 4 FORM: ARXIV 2401.17767",
            "COMMENT",
        ),
        ("", "END OF HEADER"),
    ];
    lines.iter().map(|(a, b)| format!("{a:<60}{b}\n")).collect()
}

/// One message as a RINEX-style record block.
pub fn rinex_record(msg: &LeoNavMessage) -> String {
    let id = format!("L{:02}", msg.svid);
    let mut s = format!("> EPH {id} {}\n", record_type(&msg.ephemeris));
    let (epoch_tow, clk) = match (&msg.clock, &msg.ephemeris) {
        (Some(c), _) => (c.toc, [c.af0, c.af1, c.af2]),
        (None, EphemerisModel::EcefPoly { poly }) => (poly.t_ref, [0.0; 3]),
        (None, m) => (m.kepler().map(|k| k.toe).unwrap_or(0.0), [0.0; 3]),
    };
    let (y, mo, d, hh, mi, ss) = calendar(msg.week, epoch_tow);
    s.push_str(&format!(
        "{id} {y:04} {mo:02} {d:02} {hh:02} {mi:02} {:02}{}{}{}\n",
        ss.round() as u32,
        d19(clk[0]),
        d19(clk[1]),
        d19(clk[2])
    ));
    let clock_flag = msg.clock.is_some() as u8 as f64;
    let aux = [msg.band as f64, msg.week as f64, msg.health as f64];
    match &msg.ephemeris {
        EphemerisModel::EcefPoly { poly } => {
            s.push_str(&orbit_line(&[msg.iod as f64, aux[0], aux[1], aux[2]]));
            let n = poly.coeffs[0].len();
            s.push_str(&orbit_line(&[
                msg.tow,
                clock_flag,
                (n - 1) as f64,
                poly.t_ref,
            ]));
            let all: Vec<f64> = poly.coeffs.iter().flatten().copied().collect();
            for ch in all.chunks(4) {
                s.push_str(&orbit_line(ch));
            }
        }
        m => {
            let k = m.kepler().expect("Keplerian models carry a Keplerian set");
            s.push_str(&orbit_line(&[msg.iod as f64, k.crs, k.delta_n, k.m0]));
            s.push_str(&orbit_line(&[k.cuc, k.e, k.cus, k.sqrt_a]));
            s.push_str(&orbit_line(&[k.toe, k.cic, k.omega0, k.cis]));
            s.push_str(&orbit_line(&[k.i0, k.crc, k.omega, k.omega_dot]));
            s.push_str(&orbit_line(&[k.i_dot, aux[0], aux[1], aux[2]]));
            match m {
                EphemerisModel::Kepler16 { .. } => {
                    s.push_str(&orbit_line(&[msg.tow, clock_flag, 0.0, 0.0]));
                }
                EphemerisModel::KeplerRac { rac, .. } => {
                    s.push_str(&orbit_line(&[
                        msg.tow,
                        clock_flag,
                        (rac.along.len() - 1) as f64,
                        (rac.cross.len() - 1) as f64,
                    ]));
                    let mut rest = vec![(rac.radial.len() - 1) as f64, rac.tau_s];
                    rest.extend(&rac.along);
                    rest.extend(&rac.cross);
                    rest.extend(&rac.radial);
                    for ch in rest.chunks(4) {
                        s.push_str(&orbit_line(ch));
                    }
                }
                EphemerisModel::Liu22 { extra, .. } => {
                    s.push_str(&orbit_line(&[
                        msg.tow,
                        clock_flag,
                        extra.a_dot,
                        extra.n_dot,
                    ]));
                    s.push_str(&orbit_line(&[
                        extra.crs3, extra.crc3, extra.crs1, extra.crc1,
                    ]));
                }
                EphemerisModel::EcefPoly { .. } => unreachable!(),
            }
        }
    }
    s
}

/// A whole RINEX-style file: header plus one record per message.
pub fn rinex_export(msgs: &[LeoNavMessage]) -> String {
    let mut s = rinex_header();
    for m in msgs {
        s.push_str(&rinex_record(m));
    }
    s
}

fn parse_fields(line: &str) -> Result<Vec<f64>, String> {
    let body = line.get(4..).unwrap_or("");
    let chars: Vec<char> = body.chars().collect();
    let mut out = Vec::new();
    for ch in chars.chunks(19) {
        let f: String = ch.iter().collect();
        if f.trim().is_empty() {
            continue;
        }
        out.push(crate::rinex::parse_d(&f)?);
    }
    Ok(out)
}

/// Parse a RINEX-style file written by [`rinex_export`]. Services are not carried in the
/// text records; they come back empty.
pub fn rinex_import(text: &str) -> Result<Vec<LeoNavMessage>, String> {
    let lines: Vec<&str> = text.lines().collect();
    let mut i = lines
        .iter()
        .position(|l| l.contains("END OF HEADER"))
        .map(|p| p + 1)
        .ok_or("no END OF HEADER line")?;
    let mut out = Vec::new();
    while i < lines.len() {
        let head = lines[i];
        if head.trim().is_empty() {
            i += 1;
            continue;
        }
        let parts: Vec<&str> = head.split_whitespace().collect();
        if parts.len() < 4 || parts[0] != ">" || parts[1] != "EPH" {
            return Err(format!("expected a '> EPH' record header, got {head:?}"));
        }
        let svid: u8 = parts[2]
            .strip_prefix('L')
            .and_then(|s| s.parse().ok())
            .ok_or_else(|| format!("bad satellite id {:?}", parts[2]))?;
        let rtype = parts[3];
        let ep = lines.get(i + 1).ok_or("missing epoch line")?;
        let ew: Vec<&str> = ep.get(..23).unwrap_or("").split_whitespace().collect();
        if ew.len() != 7 {
            return Err(format!("bad epoch line {ep:?}"));
        }
        let num = |k: usize| -> Result<i64, String> {
            ew[k]
                .parse()
                .map_err(|_| format!("bad epoch field in {ep:?}"))
        };
        let (week_e, tow_e) = from_calendar(
            num(1)?,
            num(2)? as u32,
            num(3)? as u32,
            num(4)? as u32,
            num(5)? as u32,
            num(6)? as f64,
        );
        let clk: Vec<f64> = {
            let body = ep.get(23..).unwrap_or("");
            let chars: Vec<char> = body.chars().collect();
            chars
                .chunks(19)
                .map(|c| crate::rinex::parse_d(&c.iter().collect::<String>()))
                .collect::<Result<_, _>>()?
        };
        if clk.len() != 3 {
            return Err(format!("epoch line needs three clock terms: {ep:?}"));
        }
        let mut j = i + 2;
        let mut next = |n: usize| -> Result<Vec<f64>, String> {
            let mut v = Vec::new();
            while v.len() < n {
                let l = lines.get(j).ok_or("record truncated")?;
                v.extend(parse_fields(l)?);
                j += 1;
            }
            Ok(v)
        };
        let msg = if rtype == "APOL" {
            let a = next(4)?;
            let b = next(4)?;
            let n = b[2] as usize + 1;
            let c = next(3 * n)?;
            let week = a[2] as u32;
            let clock = (b[1] != 0.0).then_some(ClockPoly {
                toc: tow_e + (week_e as f64 - week as f64) * 604_800.0,
                af0: clk[0],
                af1: clk[1],
                af2: clk[2],
            });
            LeoNavMessage {
                svid,
                iod: a[0] as u16,
                band: a[1] as u8,
                health: a[3] as u8,
                week,
                tow: b[0],
                clock,
                ephemeris: EphemerisModel::EcefPoly {
                    poly: EcefPoly {
                        t_ref: b[3],
                        coeffs: [
                            c[..n].to_vec(),
                            c[n..2 * n].to_vec(),
                            c[2 * n..3 * n].to_vec(),
                        ],
                    },
                },
                services: Services::default(),
            }
        } else {
            let o = next(20)?;
            let week = o[18] as u32;
            let k = Keplerian {
                crs: o[1],
                delta_n: o[2],
                m0: o[3],
                cuc: o[4],
                e: o[5],
                cus: o[6],
                sqrt_a: o[7],
                toe: o[8],
                cic: o[9],
                omega0: o[10],
                cis: o[11],
                i0: o[12],
                crc: o[13],
                omega: o[14],
                omega_dot: o[15],
                i_dot: o[16],
            };
            let t = next(4)?;
            let ephemeris = match rtype {
                "KP16" => EphemerisModel::Kepler16 { kepler: k },
                "KRAC" => {
                    let na = t[2] as usize + 1;
                    let nc = t[3] as usize + 1;
                    let first = next(1)?;
                    let nr = first[0] as usize + 1;
                    let total = 2 + na + nc + nr;
                    // `first` may already hold up to four values of the tail.
                    let mut tail = first;
                    if tail.len() < total {
                        tail.extend(next(total - tail.len())?);
                    }
                    EphemerisModel::KeplerRac {
                        kepler: k,
                        rac: RacPoly {
                            tau_s: tail[1],
                            along: tail[2..2 + na].to_vec(),
                            cross: tail[2 + na..2 + na + nc].to_vec(),
                            radial: tail[2 + na + nc..total].to_vec(),
                        },
                    }
                }
                "LU22" => {
                    let x = next(4)?;
                    EphemerisModel::Liu22 {
                        kepler: k,
                        extra: Liu22Extra {
                            a_dot: t[2],
                            n_dot: t[3],
                            crs3: x[0],
                            crc3: x[1],
                            crs1: x[2],
                            crc1: x[3],
                        },
                    }
                }
                other => return Err(format!("unknown record type {other:?}")),
            };
            let clock = (t[1] != 0.0).then_some(ClockPoly {
                toc: tow_e + (week_e as f64 - week as f64) * 604_800.0,
                af0: clk[0],
                af1: clk[1],
                af2: clk[2],
            });
            LeoNavMessage {
                svid,
                iod: o[0] as u16,
                band: o[17] as u8,
                health: o[19] as u8,
                week,
                tow: t[0],
                clock,
                ephemeris,
                services: Services::default(),
            }
        };
        out.push(msg);
        i = j;
    }
    Ok(out)
}

/// A CSV column schema: `(key, header)` pairs. Keys are Kshana's canonical names; a
/// preset may give its own header spellings for them.
#[derive(Clone, Debug)]
pub struct CsvSchema {
    /// Schema name.
    pub name: String,
    /// `(canonical key, column header)` pairs in column order.
    pub columns: Vec<(String, String)>,
}

/// Canonical keys of the Keplerian block, in the default column order.
const KEP_KEYS: [&str; 16] = [
    "toe", "M0", "sqrtA", "e", "deltaN", "Omega0", "OmegaDot", "iDot", "i0", "omega", "Crc", "Crs",
    "Cic", "Cis", "Cuc", "Cus",
];

/// The default schema for correction degrees `[along, cross, radial]` (header = key).
pub fn default_schema(degrees: [usize; 3]) -> CsvSchema {
    let mut keys: Vec<String> = [
        "SVID",
        "IOD",
        "Band",
        "WeekNumber",
        "ToW",
        "Health",
        "toc",
        "af0",
        "af1",
        "af2",
    ]
    .iter()
    .map(|s| s.to_string())
    .collect();
    keys.extend(KEP_KEYS.iter().map(|s| s.to_string()));
    for (p, d) in [("a", degrees[0]), ("c", degrees[1]), ("r", degrees[2])] {
        for k in 0..=d {
            keys.push(format!("{p}{k}"));
        }
    }
    keys.push("racTau".to_string());
    CsvSchema {
        name: "kshana".to_string(),
        columns: keys.iter().map(|k| (k.clone(), k.clone())).collect(),
    }
}

fn get_value(msg: &LeoNavMessage, key: &str) -> Option<f64> {
    let k = msg.ephemeris.kepler()?;
    let c = msg.clock.unwrap_or_default();
    let rac = match &msg.ephemeris {
        EphemerisModel::KeplerRac { rac, .. } => Some(rac),
        _ => None,
    };
    let idx = |list: Option<&Vec<f64>>, i: &str| -> Option<f64> {
        let n: usize = i.parse().ok()?;
        list.and_then(|l| l.get(n).copied())
    };
    Some(match key {
        "SVID" => msg.svid as f64,
        "IOD" => msg.iod as f64,
        "Band" => msg.band as f64,
        "WeekNumber" => msg.week as f64,
        "ToW" => msg.tow,
        "Health" => msg.health as f64,
        "toc" => c.toc,
        "af0" => c.af0,
        "af1" => c.af1,
        "af2" => c.af2,
        "toe" => k.toe,
        "M0" => k.m0,
        "sqrtA" => k.sqrt_a,
        "e" => k.e,
        "deltaN" => k.delta_n,
        "Omega0" => k.omega0,
        "OmegaDot" => k.omega_dot,
        "iDot" => k.i_dot,
        "i0" => k.i0,
        "omega" => k.omega,
        "Crc" => k.crc,
        "Crs" => k.crs,
        "Cic" => k.cic,
        "Cis" => k.cis,
        "Cuc" => k.cuc,
        "Cus" => k.cus,
        "racTau" => rac?.tau_s,
        _ => {
            let (p, i) = key.split_at(1);
            match p {
                "a" => idx(rac.map(|r| &r.along), i)?,
                "c" => idx(rac.map(|r| &r.cross), i)?,
                "r" => idx(rac.map(|r| &r.radial), i)?,
                _ => return None,
            }
        }
    })
}

/// Export Keplerian-family messages (`kepler16`, `kepler-rac`) as CSV under `schema`.
/// A column whose key the message does not carry is left empty.
pub fn csv_export(msgs: &[LeoNavMessage], schema: &CsvSchema) -> Result<String, String> {
    let mut s = schema
        .columns
        .iter()
        .map(|(_, h)| h.as_str())
        .collect::<Vec<_>>()
        .join(",");
    s.push('\n');
    for m in msgs {
        if !matches!(
            m.ephemeris,
            EphemerisModel::Kepler16 { .. } | EphemerisModel::KeplerRac { .. }
        ) {
            return Err(format!(
                "the CSV table carries kepler16 and kepler-rac messages; got {}",
                m.ephemeris.code()
            ));
        }
        let row: Vec<String> = schema
            .columns
            .iter()
            .map(|(k, _)| {
                get_value(m, k)
                    .map(|v| format!("{v:e}"))
                    .unwrap_or_default()
            })
            .collect();
        s.push_str(&row.join(","));
        s.push('\n');
    }
    Ok(s)
}

/// Import a CSV table written by [`csv_export`] under `schema`.
pub fn csv_import(text: &str, schema: &CsvSchema) -> Result<Vec<LeoNavMessage>, String> {
    let mut lines = text.lines().filter(|l| !l.trim().is_empty());
    let header: Vec<&str> = lines.next().ok_or("empty CSV")?.split(',').collect();
    let keys: Vec<Option<&str>> = header
        .iter()
        .map(|h| {
            schema
                .columns
                .iter()
                .find(|(_, hh)| hh == h.trim())
                .map(|(k, _)| k.as_str())
        })
        .collect();
    let mut out = Vec::new();
    for line in lines {
        let cells: Vec<&str> = line.split(',').collect();
        if cells.len() != header.len() {
            return Err(format!(
                "row has {} cells, header {}",
                cells.len(),
                header.len()
            ));
        }
        let mut map = std::collections::BTreeMap::new();
        for (k, c) in keys.iter().zip(&cells) {
            if let (Some(k), false) = (k, c.trim().is_empty()) {
                let v: f64 = c
                    .trim()
                    .parse()
                    .map_err(|_| format!("bad number {c:?} in column {k}"))?;
                map.insert(k.to_string(), v);
            }
        }
        let g = |k: &str| -> Result<f64, String> {
            map.get(k)
                .copied()
                .ok_or_else(|| format!("CSV row lacks {k}"))
        };
        let kep = Keplerian {
            toe: g("toe")?,
            m0: g("M0")?,
            sqrt_a: g("sqrtA")?,
            e: g("e")?,
            delta_n: g("deltaN")?,
            omega0: g("Omega0")?,
            omega_dot: g("OmegaDot")?,
            i_dot: g("iDot")?,
            i0: g("i0")?,
            omega: g("omega")?,
            crc: g("Crc")?,
            crs: g("Crs")?,
            cic: g("Cic")?,
            cis: g("Cis")?,
            cuc: g("Cuc")?,
            cus: g("Cus")?,
        };
        let series = |p: &str| -> Vec<f64> {
            (0..8)
                .map_while(|k| map.get(&format!("{p}{k}")).copied())
                .collect()
        };
        let (a, c, r) = (series("a"), series("c"), series("r"));
        let ephemeris = if a.is_empty() && c.is_empty() && r.is_empty() {
            EphemerisModel::Kepler16 { kepler: kep }
        } else {
            EphemerisModel::KeplerRac {
                kepler: kep,
                rac: RacPoly {
                    tau_s: map
                        .get("racTau")
                        .copied()
                        .unwrap_or(super::elements::RAC_TAU_S),
                    along: a,
                    cross: c,
                    radial: r,
                },
            }
        };
        let clock = map.get("toc").map(|&toc| ClockPoly {
            toc,
            af0: map.get("af0").copied().unwrap_or(0.0),
            af1: map.get("af1").copied().unwrap_or(0.0),
            af2: map.get("af2").copied().unwrap_or(0.0),
        });
        out.push(LeoNavMessage {
            svid: g("SVID")? as u8,
            iod: g("IOD")? as u16,
            band: map.get("Band").copied().unwrap_or(0.0) as u8,
            health: map.get("Health").copied().unwrap_or(0.0) as u8,
            week: g("WeekNumber")? as u32,
            tow: g("ToW")?,
            clock,
            ephemeris,
            services: Services::default(),
        });
    }
    Ok(out)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn calendar_round_trips_and_knows_the_gps_origin() {
        assert_eq!(calendar(0, 0.0), (1980, 1, 6, 0, 0, 0.0));
        // 2026-04-16 is a Thursday of GPS week 2414.
        let (w, t) = from_calendar(2026, 4, 16, 8, 0, 0.0);
        assert_eq!(w, 2414);
        assert_eq!(t, 4.0 * 86_400.0 + 8.0 * 3600.0);
        assert_eq!(calendar(w, t), (2026, 4, 16, 8, 0, 0.0));
    }

    #[test]
    fn d19_is_rinex_shaped() {
        assert_eq!(d19(-1.5e-9), "-1.500000000000E-09");
        assert_eq!(d19(1.5e-9), " 1.500000000000E-09");
        assert_eq!(d19(0.0).len(), 19);
        assert_eq!(crate::rinex::parse_d(&d19(123456.789)).unwrap(), 123456.789);
    }
}
