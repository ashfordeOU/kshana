// SPDX-License-Identifier: AGPL-3.0-only
//! Bias-SINEX (SINEX BIAS version 1.00) reader: GNSS signal biases, read-only.
//!
//! The format is the IGS "SINEX_BIAS — Solution (Software/technique) INdependent EXchange Format
//! for GNSS Biases, Version 1.00" (2016). A file has a `%=BIA` header line and blocks; the biases
//! are the data lines of the mandatory `BIAS/SOLUTION` block, one bias per line in fixed columns
//! (section 4.8):
//!
//! | Field | Format | Columns (0-based) |
//! |---|---|---|
//! | bias type (`DSB`, `ISB`, `OSB`) | 1X,A4 | 1–4 |
//! | SVN | 1X,A4 | 6–9 |
//! | PRN | 1X,A3 | 11–13 |
//! | station | 1X,A9 | 15–23 |
//! | OBS1, OBS2 | 2(1X,A4) | 25–28, 30–33 |
//! | start, end `YYYY:DDD:SSSSS` | 1X,I4.4,':',I3.3,':',I5.5 | 35–48, 50–63 |
//! | unit (`ns`, `cyc`) | 1X,A4 | 65–68 |
//! | estimate | 1X,E21.15 | 70–90 |
//! | standard deviation | 1X,E11.6 | 92–102 |
//! | slope, its standard deviation (optional) | 1X,E21.15, 1X,E11.6 | 104–124, 126–136 |
//!
//! A start or end of `0000:000:00000` is undefined (an open interval). Lines of other blocks are
//! not read beyond the header and the `BIAS/DESCRIPTION` keywords. Lines that cannot be read are
//! counted with their line numbers and reasons, never dropped silently.
//!
//! What real files do that the format does not say: the header's count of estimates need not
//! equal the number of data lines (both are reported), and some producers write the header's file
//! time with a two-digit year (read as 20YY).
//!
//! MODELLED: checked on hand-written lines and, when the files are present, on two public files
//! (`tests/bias_sinex.rs`). Applying the biases in PPP is pre-registered as item R1.3
//! (`docs/design/evidence/r1-3-bias-sinex-osb/PREREGISTRATION.md`) and not done here.

use serde::Serialize;

/// The kind of bias a line carries.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
pub enum BiasKind {
    /// Differential signal bias (between OBS1 and OBS2).
    Dsb,
    /// Ionosphere-free linear combination signal bias.
    Isb,
    /// Observable-specific signal bias (absolute; OBS2 blank).
    Osb,
}

/// A time `YYYY:DDD:SSSSS`: year, day of year, seconds of day.
#[derive(Clone, Copy, Debug, PartialEq, Eq, PartialOrd, Ord, Serialize)]
pub struct SinexTime {
    /// Year (four digits).
    pub year: u16,
    /// Day of year.
    pub doy: u16,
    /// Seconds of day.
    pub sod: u32,
}

impl SinexTime {
    /// Seconds since 2000-001-00000 (no leap seconds; for ordering and interval tests).
    pub fn seconds_since_2000(self) -> i64 {
        let days_before = |y: i64| -> i64 {
            // Days from 2000-01-01 to the first day of year `y`.
            let leaps = |y: i64| (y - 1) / 4 - (y - 1) / 100 + (y - 1) / 400;
            365 * (y - 2000) + leaps(y) - leaps(2000)
        };
        (days_before(i64::from(self.year)) + i64::from(self.doy) - 1) * 86_400 + i64::from(self.sod)
    }
}

/// One bias of the `BIAS/SOLUTION` block.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Bias {
    /// The kind.
    pub kind: BiasKind,
    /// Satellite SVN (`G063`), when given.
    pub svn: Option<String>,
    /// Satellite PRN (`G01`), when given.
    pub prn: Option<String>,
    /// Station or receiver-group name, when given.
    pub station: Option<String>,
    /// First observable code (RINEX 3, e.g. `C1C`).
    pub obs1: String,
    /// Second observable code (DSB and ISB).
    pub obs2: Option<String>,
    /// Start of validity (`None`: undefined).
    pub start: Option<SinexTime>,
    /// End of validity (`None`: undefined).
    pub end: Option<SinexTime>,
    /// Unit as written (`ns` for code biases; `cyc` or `ns` for phase biases).
    pub unit: String,
    /// The estimate, in `unit`.
    pub value: f64,
    /// Its standard deviation (0 for values taken from another source), when given.
    pub std_dev: Option<f64>,
    /// Slope, in `unit` per second, when given.
    pub slope: Option<f64>,
    /// The slope's standard deviation, when given.
    pub slope_std_dev: Option<f64>,
    /// Line number in the file (1-based).
    pub line: usize,
}

impl Bias {
    /// Whether this is a phase bias (by its observable code, as the format says: `L…`).
    pub fn is_phase(&self) -> bool {
        self.obs1.starts_with('L')
    }
}

/// The `%=BIA` header line.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct BiasHeader {
    /// Format version (`1.00`).
    pub version: String,
    /// Agency creating the file.
    pub file_agency: String,
    /// File creation time.
    pub created: Option<SinexTime>,
    /// Agency providing the data.
    pub data_agency: String,
    /// Start of the data.
    pub start: Option<SinexTime>,
    /// End of the data.
    pub end: Option<SinexTime>,
    /// Bias mode flag (`R` relative, `A` absolute).
    pub mode: String,
    /// Number of estimates the header states.
    pub estimates: usize,
}

/// A read file.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct BiasFile {
    /// The header.
    pub header: BiasHeader,
    /// `BIAS/DESCRIPTION` keywords and their values, in file order.
    pub description: Vec<(String, String)>,
    /// The biases, in file order.
    pub biases: Vec<Bias>,
    /// Data lines of `BIAS/SOLUTION` that could not be read: line number and reason.
    pub unreadable: Vec<(usize, String)>,
}

fn field(line: &str, a: usize, b: usize) -> &str {
    line.get(a..b.min(line.len())).unwrap_or("").trim()
}

fn opt(s: &str) -> Option<String> {
    (!s.is_empty()).then(|| s.to_string())
}

/// `YYYY:DDD:SSSSS` (or `YY:DDD:SSSSS`, read as 20YY); `0000:000:00000` is `None`.
pub fn parse_time(s: &str) -> Result<Option<SinexTime>, String> {
    let parts: Vec<&str> = s.trim().split(':').collect();
    let [y, d, sec] = parts[..] else {
        return Err(crate::terr!("e-bias-sinex-bad-time", v = s));
    };
    let num = |t: &str| {
        t.parse::<u32>()
            .map_err(|_| crate::terr!("e-bias-sinex-bad-time", v = s))
    };
    let (y, d, sec) = (num(y)?, num(d)?, num(sec)?);
    if y == 0 && d == 0 && sec == 0 {
        return Ok(None);
    }
    let year = if parts[0].len() == 2 { 2000 + y } else { y };
    if !(1..=366).contains(&d) || sec > 86_400 {
        return Err(crate::terr!("e-bias-sinex-bad-time", v = s));
    }
    Ok(Some(SinexTime {
        year: year as u16,
        doy: d as u16,
        sod: sec,
    }))
}

fn parse_header(line: &str) -> Result<BiasHeader, String> {
    let t: Vec<&str> = line.split_whitespace().collect();
    if t.len() < 9 || t[0] != "%=BIA" {
        return Err(crate::terr!("e-bias-sinex-no-header"));
    }
    Ok(BiasHeader {
        version: t[1].to_string(),
        file_agency: t[2].to_string(),
        created: parse_time(t[3])?,
        data_agency: t[4].to_string(),
        start: parse_time(t[5])?,
        end: parse_time(t[6])?,
        mode: t[7].to_string(),
        estimates: t[8]
            .parse()
            .map_err(|_| crate::terr!("e-bias-sinex-bad-count", v = t[8]))?,
    })
}

fn parse_bias(line: &str, n: usize) -> Result<Bias, String> {
    let kind = match field(line, 1, 5) {
        "DSB" => BiasKind::Dsb,
        "ISB" => BiasKind::Isb,
        "OSB" => BiasKind::Osb,
        other => return Err(crate::terr!("e-bias-sinex-bad-type", v = other)),
    };
    let obs1 = field(line, 25, 29);
    if obs1.is_empty() {
        return Err(crate::terr!("e-bias-sinex-no-obs1"));
    }
    let obs2 = opt(field(line, 30, 34));
    if (kind == BiasKind::Osb) != obs2.is_none() {
        return Err(crate::terr!("e-bias-sinex-obs2"));
    }
    // Each numeric field: blank is `None`; anything else must parse.
    let num = |a: usize, b: usize| -> Result<Option<f64>, String> {
        let s = field(line, a, b);
        if s.is_empty() {
            return Ok(None);
        }
        s.replace(['D', 'd'], "E")
            .parse::<f64>()
            .map(Some)
            .map_err(|_| s.to_string())
    };
    let value = num(70, 91)
        .map_err(|v| crate::terr!("e-bias-sinex-bad-estimate", v = v))?
        .ok_or_else(|| crate::terr!("e-bias-sinex-no-estimate"))?;
    let std_dev = num(92, 103).map_err(|v| crate::terr!("e-bias-sinex-bad-std-dev", v = v))?;
    let slope = num(104, 125).map_err(|v| crate::terr!("e-bias-sinex-bad-slope", v = v))?;
    let slope_std_dev =
        num(126, 137).map_err(|v| crate::terr!("e-bias-sinex-bad-slope-std-dev", v = v))?;
    Ok(Bias {
        kind,
        svn: opt(field(line, 6, 10)),
        prn: opt(field(line, 11, 14)),
        station: opt(field(line, 15, 24)),
        obs1: obs1.to_string(),
        obs2,
        start: parse_time(field(line, 35, 49))?,
        end: parse_time(field(line, 50, 64))?,
        unit: field(line, 65, 69).to_string(),
        value,
        std_dev,
        slope,
        slope_std_dev,
        line: n,
    })
}

/// Read a Bias-SINEX file. Fails only when the header is missing or unreadable; unreadable data
/// lines are listed in [`BiasFile::unreadable`].
pub fn read(text: &str) -> Result<BiasFile, String> {
    let mut lines = text.lines().enumerate();
    let header = loop {
        match lines.next() {
            Some((_, l)) if l.trim().is_empty() => continue,
            Some((_, l)) => break parse_header(l)?,
            None => return Err(crate::terr!("e-bias-sinex-empty")),
        }
    };
    let mut out = BiasFile {
        header,
        description: Vec::new(),
        biases: Vec::new(),
        unreadable: Vec::new(),
    };
    let mut block = String::new();
    for (i, l) in lines {
        let n = i + 1;
        if let Some(name) = l.strip_prefix('+') {
            block = name.trim().to_string();
            continue;
        }
        if l.starts_with('-') || l.starts_with("%=ENDBIA") {
            block.clear();
            continue;
        }
        if l.starts_with('*') || l.trim().is_empty() {
            continue;
        }
        match block.as_str() {
            "BIAS/SOLUTION" => match parse_bias(l, n) {
                Ok(b) => out.biases.push(b),
                Err(e) => out.unreadable.push((n, e)),
            },
            "BIAS/DESCRIPTION" => {
                let k = field(l, 1, 40);
                if !k.is_empty() {
                    out.description
                        .push((k.to_string(), l.get(41..).unwrap_or("").trim().to_string()));
                }
            }
            _ => {}
        }
    }
    Ok(out)
}

impl BiasFile {
    /// The observable-specific bias (in its unit) of satellite `prn` (`G01`) for observable `obs`
    /// (`C1C`), satellite-specific (no station), valid at `t` (start ≤ t < end; an undefined end
    /// is open).
    pub fn satellite_osb(&self, prn: &str, obs: &str, t: SinexTime) -> Option<&Bias> {
        let ts = t.seconds_since_2000();
        self.biases.iter().find(|b| {
            b.kind == BiasKind::Osb
                && b.station.is_none()
                && b.prn.as_deref() == Some(prn)
                && b.obs1 == obs
                && b.start.is_none_or(|s| s.seconds_since_2000() <= ts)
                && b.end.is_none_or(|e| ts < e.seconds_since_2000())
        })
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    // Hand-written lines in the fixed columns of section 4.8 (values invented, not from any
    // product): a satellite OSB, a phase OSB in cycles with a slope, a station DSB with an open
    // end, a satellite ISB, and two malformed lines.
    const FILE: &str = "\
%=BIA 1.00 TST 2024:040:00000 TST 2024:035:00000 2024:036:00000 A 00000005
+BIAS/DESCRIPTION
*KEYWORD________________________________ VALUE(S)_______________________________
 BIAS_MODE                               ABSOLUTE
 TIME_SYSTEM                             G
-BIAS/DESCRIPTION
+BIAS/SOLUTION
*BIAS SVN_ PRN STATION__ OBS1 OBS2 BIAS_START____ BIAS_END______ UNIT __ESTIMATED_VALUE____ _STD_DEV___ __ESTIMATED_SLOPE____ _STD_DEV___
 OSB  G063 G01           C1C       2024:035:00000 2024:036:00000 ns                 -1.4477      0.0065
 OSB  E201 E11           L1C       2024:035:00000 2024:036:00000 cyc                 0.1250      0.0010             1.250E-06  2.000E-07
 DSB           WTZR00DEU C1C  C1W  2024:035:43200 0000:000:00000 ns                  2.3000      0.0500
 ISB  G063 G01           C1C  C2W  2024:035:00000 2024:036:00000 ns                  0.4000      0.0000
 XSB  G063 G01           C1C       2024:035:00000 2024:036:00000 ns                  0.1000      0.0000
 OSB  G063 G01           C1C  C1W  2024:035:00000 2024:036:00000 ns                  0.1000      0.0000
-BIAS/SOLUTION
%=ENDBIA
";

    #[test]
    fn hand_written_lines_read_as_laid_out() {
        let f = read(FILE).unwrap();
        assert_eq!(f.header.file_agency, "TST");
        assert_eq!(f.header.mode, "A");
        assert_eq!(f.header.estimates, 5);
        assert_eq!(
            f.header.start,
            Some(SinexTime {
                year: 2024,
                doy: 35,
                sod: 0
            })
        );
        assert_eq!(f.description[0], ("BIAS_MODE".into(), "ABSOLUTE".into()));
        assert_eq!(f.biases.len(), 4);
        let b = &f.biases[0];
        assert_eq!(
            (b.kind, b.svn.as_deref(), b.prn.as_deref()),
            (BiasKind::Osb, Some("G063"), Some("G01"))
        );
        assert_eq!(
            (b.obs1.as_str(), b.obs2.as_deref(), b.station.as_deref()),
            ("C1C", None, None)
        );
        assert_eq!(
            (b.value, b.std_dev, b.unit.as_str(), b.line),
            (-1.4477, Some(0.0065), "ns", 9)
        );
        let p = &f.biases[1];
        assert!(p.is_phase() && !b.is_phase());
        assert_eq!(
            (p.unit.as_str(), p.value, p.slope, p.slope_std_dev),
            ("cyc", 0.125, Some(1.25e-6), Some(2e-7))
        );
        let d = &f.biases[2];
        assert_eq!(
            (d.kind, d.station.as_deref(), d.prn.as_deref()),
            (BiasKind::Dsb, Some("WTZR00DEU"), None)
        );
        assert_eq!(
            (d.obs2.as_deref(), d.end, d.start.unwrap().sod),
            (Some("C1W"), None, 43_200)
        );
        assert_eq!(f.biases[3].kind, BiasKind::Isb);
        // The unknown type and the OSB with an OBS2 are listed, with their line numbers.
        assert_eq!(f.unreadable.len(), 2);
        assert_eq!(f.unreadable[0].0, 13);
        assert_eq!(f.unreadable[1].0, 14);
    }

    #[test]
    fn a_satellite_osb_is_found_inside_its_interval_only() {
        let f = read(FILE).unwrap();
        let t = |doy, sod| SinexTime {
            year: 2024,
            doy,
            sod,
        };
        assert_eq!(
            f.satellite_osb("G01", "C1C", t(35, 3600)).unwrap().value,
            -1.4477
        );
        assert!(f.satellite_osb("G01", "C1C", t(36, 0)).is_none());
        assert!(f.satellite_osb("G02", "C1C", t(35, 3600)).is_none());
        assert!(f.satellite_osb("G01", "C1W", t(35, 3600)).is_none());
    }

    #[test]
    fn times_read_with_four_and_two_digit_years_and_undefined_is_none() {
        assert_eq!(
            parse_time("24:037:49688").unwrap(),
            parse_time("2024:037:49688").unwrap()
        );
        assert_eq!(parse_time("0000:000:00000").unwrap(), None);
        assert!(parse_time("2024:367:00000").is_err());
        assert!(parse_time("2024:037").is_err());
        let a = parse_time("2024:001:00000").unwrap().unwrap();
        let b = parse_time("2023:365:86000").unwrap().unwrap();
        assert_eq!(a.seconds_since_2000() - b.seconds_since_2000(), 400);
        assert_eq!(
            parse_time("2000:001:00001")
                .unwrap()
                .unwrap()
                .seconds_since_2000(),
            1
        );
    }
}
