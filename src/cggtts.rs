// SPDX-License-Identifier: AGPL-3.0-only
//! CGGTTS version 2E track files (BIPM common-view format) and the common-view difference
//! between two laboratories.
//!
//! A data line holds one satellite track: `SAT CL MJD STTIME TRKL ELV AZTH REFSV SRSV REFSYS
//! ... CK`. `REFSV` is the laboratory reference minus the satellite's time and `REFSYS` the
//! reference minus the GNSS system time, both in units of 0.1 ns. A line counts only when its
//! `CK` checksum holds: the sum, modulo 256, of the byte values of every character before `CK`
//! (including the separating space). Lines that fail are counted, never silently dropped. A field
//! of all 9s is a missing value. The time of a track is its start (`MJD`, `STTIME` in UTC) plus
//! half its length `TRKL`, in seconds from 1980-01-06 00:00 UTC as the other clock-log readers
//! count them.
//!
//! [`common_view`] differences two laboratories' tracks on the same satellite and start time:
//! `REFSV(a) − REFSV(b)` cancels the satellite clock and leaves `ref(a) − ref(b)`. Per epoch it
//! takes the median over common satellites.
//!
//! MODELLED: the reader's checksum rule was checked on public files; the common-view estimate
//! is scored against Circular T in `docs/design/evidence/r6-1-cggtts/PREREGISTRATION.md`.
use serde::Serialize;

/// One CGGTTS track.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Track {
    /// Satellite (`G04`, `E11`, ...).
    pub sat: String,
    /// Modified Julian Date of the track start (UTC).
    pub mjd: i64,
    /// Start time of day (s, UTC).
    pub start_s: u32,
    /// Track length (s).
    pub trkl_s: u32,
    /// Midpoint of the track, seconds from 1980-01-06 00:00 UTC.
    pub t: f64,
    /// Elevation (degrees).
    pub elv_deg: f64,
    /// Reference minus satellite time (s); `None` when missing.
    pub refsv_s: Option<f64>,
    /// Reference minus GNSS system time (s); `None` when missing.
    pub refsys_s: Option<f64>,
}

/// The tracks of a file and the lines that were not tracks.
#[derive(Clone, Debug, Default, Serialize)]
pub struct TrackFile {
    /// Tracks with a valid checksum, in file order.
    pub tracks: Vec<Track>,
    /// Data-shaped lines whose `CK` did not match.
    pub bad_checksum: usize,
    /// Data-shaped lines whose fields could not be read.
    pub malformed: usize,
}

/// The CGGTTS data-line checksum of `body` (every character before `CK`).
pub fn checksum(body: &str) -> u8 {
    body.bytes().fold(0u8, |a, b| a.wrapping_add(b))
}

fn looks_like_data(tok: &str) -> bool {
    let b = tok.as_bytes();
    b.len() == 3 && b[0].is_ascii_uppercase() && b[1].is_ascii_digit() && b[2].is_ascii_digit()
}

fn tenths_ns(tok: &str) -> Option<Option<f64>> {
    let digits = tok.trim_start_matches(['-', '+']);
    if digits.len() >= 4 && digits.bytes().all(|c| c == b'9') {
        return Some(None);
    }
    let v: i64 = tok.parse().ok()?;
    Some(Some(v as f64 * 1e-10))
}

/// Read every data line of a CGGTTS file.
pub fn read_tracks(text: &str) -> TrackFile {
    let mut out = TrackFile::default();
    for raw in text.lines() {
        let line = raw.trim_end();
        let toks: Vec<&str> = line.split_whitespace().collect();
        if toks.len() < 11 || !looks_like_data(toks[0]) {
            continue;
        }
        let (body, ck) = line.split_at(line.len() - 2);
        let Ok(ck) = u8::from_str_radix(ck, 16) else {
            out.malformed += 1;
            continue;
        };
        if checksum(body) != ck {
            out.bad_checksum += 1;
            continue;
        }
        let track = (|| {
            let mjd: i64 = toks[2].parse().ok()?;
            let st = toks[3];
            if st.len() != 6 {
                return None;
            }
            let (h, m, s): (u32, u32, u32) = (
                st[0..2].parse().ok()?,
                st[2..4].parse().ok()?,
                st[4..6].parse().ok()?,
            );
            if h > 23 || m > 59 || s > 60 {
                return None;
            }
            let start_s = h * 3600 + m * 60 + s;
            let trkl_s: u32 = toks[4].parse().ok()?;
            let elv: i64 = toks[5].parse().ok()?;
            let refsv_s = tenths_ns(toks[7])?;
            let refsys_s = tenths_ns(toks[9])?;
            let t = (mjd - 44_244) as f64 * 86_400.0 + start_s as f64 + trkl_s as f64 / 2.0;
            Some(Track {
                sat: toks[0].to_string(),
                mjd,
                start_s,
                trkl_s,
                t,
                elv_deg: elv as f64 / 10.0,
                refsv_s,
                refsys_s,
            })
        })();
        match track {
            Some(t) => out.tracks.push(t),
            None => out.malformed += 1,
        }
    }
    out
}

fn median(v: &mut [f64]) -> f64 {
    v.sort_by(|a, b| a.total_cmp(b));
    let n = v.len();
    if n % 2 == 1 {
        v[n / 2]
    } else {
        (v[n / 2 - 1] + v[n / 2]) / 2.0
    }
}

/// One epoch of a per-epoch series: time (s from 1980-01-06), value (s), satellites used.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Epoch {
    /// Track midpoint, seconds from 1980-01-06 00:00 UTC.
    pub t: f64,
    /// Median over the satellites of the epoch (s).
    pub value_s: f64,
    /// Satellites in the median.
    pub n_sats: usize,
}

fn per_epoch(mut keyed: Vec<((i64, u32), f64, f64)>) -> Vec<Epoch> {
    keyed.sort_by(|a, b| a.0.cmp(&b.0));
    let mut out = Vec::new();
    let mut i = 0;
    while i < keyed.len() {
        let mut j = i;
        while j < keyed.len() && keyed[j].0 == keyed[i].0 {
            j += 1;
        }
        let mut vals: Vec<f64> = keyed[i..j].iter().map(|k| k.2).collect();
        out.push(Epoch {
            t: keyed[i].1,
            value_s: median(&mut vals),
            n_sats: j - i,
        });
        i = j;
    }
    out
}

/// All-in-view series: per track start, the median `REFSYS` over satellites (reference minus
/// GNSS system time). With `sat`, that satellite's `REFSYS` only.
pub fn all_in_view(tracks: &[Track], sat: Option<&str>) -> Vec<Epoch> {
    per_epoch(
        tracks
            .iter()
            .filter(|t| sat.is_none_or(|s| t.sat == s))
            .filter_map(|t| t.refsys_s.map(|v| ((t.mjd, t.start_s), t.t, v)))
            .collect(),
    )
}

/// Common view: for each track start seen in both files, the median over common satellites of
/// `REFSV(a) − REFSV(b)`, which is `ref(a) − ref(b)`.
pub fn common_view(a: &[Track], b: &[Track]) -> Vec<Epoch> {
    use std::collections::HashMap;
    let index: HashMap<(&str, i64, u32), f64> = b
        .iter()
        .filter_map(|t| t.refsv_s.map(|v| ((t.sat.as_str(), t.mjd, t.start_s), v)))
        .collect();
    per_epoch(
        a.iter()
            .filter_map(|t| {
                let va = t.refsv_s?;
                let vb = index.get(&(t.sat.as_str(), t.mjd, t.start_s))?;
                Some(((t.mjd, t.start_s), t.t, va - vb))
            })
            .collect(),
    )
}

/// Linear interpolation of a series at `t`, from the nearest epochs before and after, each
/// within `max_gap_s`. `None` when either side is missing.
pub fn interpolate(series: &[Epoch], t: f64, max_gap_s: f64) -> Option<f64> {
    let before = series.iter().rev().find(|e| e.t <= t)?;
    let after = series.iter().find(|e| e.t >= t)?;
    if t - before.t > max_gap_s || after.t - t > max_gap_s {
        return None;
    }
    if after.t == before.t {
        return Some(before.value_s);
    }
    let w = (t - before.t) / (after.t - before.t);
    Some(before.value_s + w * (after.value_s - before.value_s))
}

#[cfg(test)]
mod tests {
    use super::*;

    // Synthetic lines; the CK values were computed by an independent script.
    const LAB_A: &str = "CGGTTS   GENERIC DATA FORMAT VERSION = 2E\n\
SAT CL  MJD  STTIME TRKL ELV AZTH   REFSV      SRSV     REFSYS    SRSYS  DSG IOE MDTR SMDT MDIO SMDI MSIO SMSI ISG FR HC FRC CK\n\
G04 FF 60672 001400  780 227  856    -5033017    -95       -4834    -35   45 200  211   41  406   64  406   64  33  0  0 L3P 4F\n\
G07 FF 60672 001400  780 687  856      139047    -95       -4782    -35   45 200  211   41  406   64  406   64  33  0  0 L3P 46\n\
G09 FF 60672 001400  780 497  856    -5056516    -95       -4829    -35   45 200  211   41  406   64  406   64  33  0  0 L3P 6A\n\
G04 FF 60672 003000  780 181  856    -5033074    -95       -4834    -35   45 200  211   41  406   64  406   64  33  0  0 L3P 4F\n\
G07 FF 60672 003000  780 622  856      139036    -95       -4786    -35   45 200  211   41  406   64  406   64  33  0  0 L3P 3B\n\
G09 FF 60672 003000  780 454  856    -5056677    -95 99999999999    -35   45 200  211   41  406   64  406   64  33  0  0 L3P 18\n\
G04 FF 60672 004600  780 135  856    -5033142    -95       -4844    -35   45 200  211   41  406   64  406   64  33  0  0 L3P 52\n\
G07 FF 60672 004600  780 559  856      139015    -95       -4799    -35   45 200  211   41  406   64  406   64  33  0  0 L3P 00\n";

    #[test]
    fn checksums_are_checked_and_bad_lines_counted() {
        let f = read_tracks(LAB_A);
        // The last line's CK was altered (4C -> 00).
        assert_eq!(f.tracks.len(), 7);
        assert_eq!(f.bad_checksum, 1);
        assert_eq!(f.malformed, 0);
        let t = &f.tracks[0];
        assert_eq!(t.sat, "G04");
        assert_eq!(t.start_s, 14 * 60);
        assert!((t.refsv_s.unwrap() - (-5_033_017e-10)).abs() < 1e-15);
        assert_eq!(t.elv_deg, 22.7);
        assert_eq!(t.t, (60_672 - 44_244) as f64 * 86_400.0 + 840.0 + 390.0);
        assert_eq!(f.tracks[5].refsys_s, None);
    }

    #[test]
    fn all_in_view_takes_the_median_and_skips_missing_values() {
        let f = read_tracks(LAB_A);
        let s = all_in_view(&f.tracks, None);
        assert_eq!(s.len(), 3);
        assert_eq!(s[0].n_sats, 3);
        assert!((s[0].value_s - (-4829e-10)).abs() < 1e-15);
        assert_eq!(s[1].n_sats, 2);
        assert!((s[1].value_s - (-4810e-10)).abs() < 1e-15);
        let g04 = all_in_view(&f.tracks, Some("G04"));
        assert_eq!(g04.len(), 3);
    }

    #[test]
    fn common_view_cancels_the_satellite_clock() {
        let a = read_tracks(LAB_A).tracks;
        // Lab B: same satellites, reference 25 ns later, so REFSV is 25 ns smaller.
        let b: Vec<Track> = a
            .iter()
            .map(|t| Track {
                refsv_s: t.refsv_s.map(|v| v - 25e-9),
                ..t.clone()
            })
            .collect();
        let cv = common_view(&a, &b);
        assert_eq!(cv.len(), 3);
        for e in &cv {
            assert!((e.value_s - 25e-9).abs() < 1e-15);
        }
        let mid = (cv[0].t + cv[1].t) / 2.0;
        assert!((interpolate(&cv, mid, 3600.0).unwrap() - 25e-9).abs() < 1e-15);
        assert_eq!(interpolate(&cv, cv[0].t - 7200.0, 3600.0), None);
    }
}
