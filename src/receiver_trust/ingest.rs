// SPDX-License-Identifier: AGPL-3.0-only
//! Receiver-log readers: one real receiver log in, one time-tagged [`Timeline`] out.
//!
//! Four formats are read, each into the same shape (epochs in time order, records that
//! share an instant merged, `t_s` counted from the first epoch):
//!
//! * **u-blox UBX** binary ([`read_ubx`]): UBX-NAV-SAT gives per-satellite
//!   carrier-to-noise density (C/N0), UBX-NAV-PVT the receiver's position-velocity-time
//!   (PVT) fix and UTC date, UBX-NAV-TIMEGPS the GPS week, and UBX-MON-RF the automatic
//!   gain control (AGC) count and the continuous-wave (CW) jamming indicator. Epochs
//!   are keyed by the GPS time of week (iTOW) every navigation message carries.
//! * **RINEX 3 observations** ([`read_rinex`]): the receiver independent exchange
//!   format; its `S` (signal strength) codes are the C/N0, read through
//!   [`crate::rinex_obs::parse_obs`].
//! * **Android GnssLogger CSV** ([`read_android`]): `Raw` rows (C/N0, AGC in dB) and
//!   `Fix` rows (the phone's own position), with columns located by the names in the
//!   `# Raw,...` / `# Fix,...` header comments.
//! * **NMEA 0183** ([`read_nmea`]): the National Marine Electronics Association text
//!   protocol; GSV gives per-satellite signal-to-noise ratio (SNR, which NMEA states in
//!   dB-Hz, i.e. a C/N0), GGA the time and fix, RMC the date.
//!
//! The readers are pure functions on bytes or text (no file access) and are built to
//! survive hostile input: truncated buffers, corrupt frames and garbage lines are
//! skipped and counted in [`Timeline::skipped_records`], never a panic.

use super::{LogEpoch, LogFormat, MarineObs, OsnmaStatus, ReportedFix, SatCn0, Timeline};
use crate::rinex_obs::parse_obs;
use std::collections::BTreeMap;

/// Milliseconds in one day.
const DAY_MS: i64 = 86_400_000;
/// Milliseconds in one GPS week.
const WEEK_MS: i64 = 604_800_000;

/// Read a log of the given format. `bytes` is the raw file content (UBX is binary; the
/// others are UTF-8 text, decoded lossily so a stray invalid byte cannot abort the read).
///
/// Returns `Err` when the format's parser rejects the file outright or when the log
/// holds no epoch at all (empty, wrong format, or entirely corrupt).
pub fn read_log(format: LogFormat, bytes: &[u8]) -> Result<Timeline, String> {
    let (name, tl) = match format {
        LogFormat::Ubx => ("UBX", read_ubx(bytes)),
        LogFormat::Rinex => ("RINEX", read_rinex(&String::from_utf8_lossy(bytes))?),
        LogFormat::Android => (
            "Android GnssLogger",
            read_android(&String::from_utf8_lossy(bytes))?,
        ),
        LogFormat::Nmea => ("NMEA", read_nmea(&String::from_utf8_lossy(bytes))?),
    };
    if tl.epochs.is_empty() {
        return Err(format!(
            "the log holds no epochs: nothing in it was readable as {name} \
             ({} records skipped as corrupt or unparsable); check the format setting",
            tl.skipped_records
        ));
    }
    Ok(tl)
}

// ---------------------------------------------------------------------------------
// Shared epoch accumulator
// ---------------------------------------------------------------------------------

/// Everything gathered for one instant while a log is being read. Keys of the
/// surrounding map are milliseconds on the reader's own time scale.
#[derive(Default)]
struct Acc {
    /// Time label with a rank: a better-grounded label (UTC date) replaces a weaker
    /// one (time of week only).
    label: Option<(u8, String)>,
    cn0: Vec<SatCn0>,
    agc_sum: f64,
    agc_n: u32,
    jam: Option<f64>,
    fix: Option<ReportedFix>,
    marine: MarineObs,
}

impl Acc {
    fn set_label(&mut self, rank: u8, label: String) {
        if self.label.as_ref().is_none_or(|(r, _)| rank > *r) {
            self.label = Some((rank, label));
        }
    }

    /// Add one satellite's C/N0; a repeat of the same satellite and band at the same
    /// epoch (a re-sent message) replaces the earlier value instead of duplicating it.
    fn add_cn0(&mut self, sat: String, band: String, cn0_dbhz: f64) {
        if !cn0_dbhz.is_finite() || cn0_dbhz <= 0.0 {
            return;
        }
        if let Some(s) = self.cn0.iter_mut().find(|s| s.sat == sat && s.band == band) {
            s.cn0_dbhz = cn0_dbhz;
        } else {
            self.cn0.push(SatCn0 {
                sat,
                band,
                cn0_dbhz,
            });
        }
    }

    fn add_agc(&mut self, v: f64) {
        if v.is_finite() {
            self.agc_sum += v;
            self.agc_n += 1;
        }
    }

    fn add_jam(&mut self, v: f64) {
        if v.is_finite() {
            self.jam = Some(self.jam.map_or(v, |j| j.max(v)));
        }
    }
}

/// The epochs of the keyed accumulators: `t_s` counted from `first` (a key).
fn epochs_from(map: BTreeMap<i64, Acc>, first: i64) -> Vec<LogEpoch> {
    map.into_iter()
        .map(|(k, a)| LogEpoch {
            t_s: (k - first) as f64 / 1000.0,
            time_label: a.label.map(|(_, s)| s),
            cn0: a.cn0,
            agc: (a.agc_n > 0).then(|| a.agc_sum / a.agc_n as f64),
            jam_ind: a.jam,
            fix: a.fix,
            marine: (a.marine != MarineObs::default()).then_some(a.marine),
        })
        .collect()
}

/// A [`Timeline`] from epochs: the start label and the observables actually present.
fn timeline_from(epochs: Vec<LogEpoch>, skipped: usize) -> Timeline {
    let mut observables = Vec::new();
    if epochs.iter().any(|e| !e.cn0.is_empty()) {
        observables.push("cn0".to_string());
    }
    if epochs.iter().any(|e| e.agc.is_some()) {
        observables.push("agc".to_string());
    }
    if epochs.iter().any(|e| e.jam_ind.is_some()) {
        observables.push("jam_ind".to_string());
    }
    if epochs.iter().any(|e| e.fix.is_some()) {
        observables.push("fix".to_string());
    }
    Timeline {
        start_label: epochs.first().and_then(|e| e.time_label.clone()),
        epochs,
        observables,
        skipped_records: skipped,
    }
}

/// Turn the keyed accumulators into a [`Timeline`]: `t_s` from the first key, the
/// start label from the first epoch, and the observables actually present.
fn finalize(map: BTreeMap<i64, Acc>, skipped: usize) -> Timeline {
    let first = map.keys().next().copied().unwrap_or(0);
    timeline_from(epochs_from(map, first), skipped)
}

/// RINEX-style satellite id: system letter and two-digit number (`G05`).
fn sat_id(letter: char, n: u32) -> String {
    format!("{letter}{n:02}")
}

/// Days since 1970-01-01 of a proleptic Gregorian date (the standard civil-from-days
/// inverse; valid for any year, so no table or library is needed).
fn days_from_civil(y: i64, m: i64, d: i64) -> i64 {
    let y = if m <= 2 { y - 1 } else { y };
    let era = y.div_euclid(400);
    let yoe = y - era * 400;
    let mp = (m + 9) % 12;
    let doy = (153 * mp + 2) / 5 + d - 1;
    let doe = yoe * 365 + yoe / 4 - yoe / 100 + doy;
    era * 146_097 + doe - 719_468
}

/// The civil date `(year, month, day)` of a day count since 1970-01-01.
fn civil_from_days(z: i64) -> (i64, i64, i64) {
    let z = z + 719_468;
    let era = z.div_euclid(146_097);
    let doe = z - era * 146_097;
    let yoe = (doe - doe / 1460 + doe / 36_524 - doe / 146_096) / 365;
    let doy = doe - (365 * yoe + yoe / 4 - yoe / 100);
    let mp = (5 * doy + 2) / 153;
    let d = doy - (153 * mp + 2) / 5 + 1;
    let m = if mp < 10 { mp + 3 } else { mp - 9 };
    (
        if m <= 2 {
            yoe + era * 400 + 1
        } else {
            yoe + era * 400
        },
        m,
        d,
    )
}

/// ISO-8601 UTC label of a millisecond count since 1970-01-01T00:00:00Z.
fn iso_utc_ms(ms: i64) -> String {
    let (y, mo, d) = civil_from_days(ms.div_euclid(DAY_MS));
    let r = ms.rem_euclid(DAY_MS);
    format!(
        "{y:04}-{mo:02}-{d:02}T{:02}:{:02}:{:02}.{:03}Z",
        r / 3_600_000,
        r / 60_000 % 60,
        r / 1000 % 60,
        r % 1000
    )
}

/// True when the calendar fields are in range (day checked only against 31; the
/// day-count arithmetic tolerates a 31st of a short month without panicking).
fn plausible_date(y: i64, mo: i64, d: i64) -> bool {
    (1900..=2200).contains(&y) && (1..=12).contains(&mo) && (1..=31).contains(&d)
}

// ---------------------------------------------------------------------------------
// UBX
// ---------------------------------------------------------------------------------

const UBX_SYNC1: u8 = 0xB5;
const UBX_SYNC2: u8 = 0x62;
const CLASS_NAV: u8 = 0x01;
const ID_NAV_PVT: u8 = 0x07;
const ID_NAV_TIMEGPS: u8 = 0x20;
const ID_NAV_SAT: u8 = 0x35;
const CLASS_MON: u8 = 0x0A;
const ID_MON_RF: u8 = 0x38;
const CLASS_SEC: u8 = 0x27;
const ID_SEC_SIG: u8 = 0x09;

/// Label ranks: a UTC date from NAV-PVT outranks a GPS week from NAV-TIMEGPS.
const RANK_GPS_WEEK: u8 = 1;
const RANK_UTC: u8 = 2;

/// 8-bit Fletcher checksum over the class/id/length/payload bytes (UBX protocol).
fn ubx_checksum(body: &[u8]) -> (u8, u8) {
    let mut a: u8 = 0;
    let mut b: u8 = 0;
    for &byte in body {
        a = a.wrapping_add(byte);
        b = b.wrapping_add(a);
    }
    (a, b)
}

fn le_u16(p: &[u8], off: usize) -> Option<u16> {
    Some(u16::from_le_bytes([*p.get(off)?, *p.get(off + 1)?]))
}

fn le_u32(p: &[u8], off: usize) -> Option<u32> {
    let b = p.get(off..off + 4)?;
    Some(u32::from_le_bytes([b[0], b[1], b[2], b[3]]))
}

fn le_i32(p: &[u8], off: usize) -> Option<i32> {
    le_u32(p, off).map(|v| v as i32)
}

/// Reader state while walking a UBX stream.
#[derive(Default)]
struct UbxState {
    map: BTreeMap<i64, Acc>,
    /// Last iTOW seen (ms), to detect the end-of-week wrap.
    last_itow: Option<i64>,
    /// Whole weeks added to iTOW so keys keep increasing across a week rollover.
    week_off: i64,
    /// Key of the most recent navigation epoch; MON-RF (which carries no time of its
    /// own) attaches here.
    cur_key: Option<i64>,
    /// MON-RF blocks `(agcCnt, jamInd)` read before any iTOW, held for the first epoch.
    pending_rf: Vec<(f64, f64)>,
    /// A SEC-SIG `(jamming state, spoofing state)` read before any iTOW.
    pending_sec: Option<(u8, u8)>,
    /// A GPS week number and the key-week index it belongs to (from NAV-TIMEGPS), used
    /// to label epochs that carry no date of their own.
    week_ref: Option<(i64, i64)>,
}

impl UbxState {
    /// The epoch key for an iTOW, or `None` when the iTOW is outside one week (corrupt).
    fn epoch_key(&mut self, itow: u32) -> Option<i64> {
        let itow = i64::from(itow);
        if itow >= WEEK_MS {
            return None;
        }
        if let Some(last) = self.last_itow {
            // iTOW restarts at 0 each Sunday: a drop of more than half a week is the
            // rollover, not time running backwards (and a jump the other way undoes it,
            // for a stale message that straddles the rollover).
            if itow < last - WEEK_MS / 2 {
                self.week_off += 1;
            } else if itow > last + WEEK_MS / 2 {
                self.week_off -= 1;
            }
        }
        self.last_itow = Some(itow);
        let key = self.week_off * WEEK_MS + itow;
        self.cur_key = Some(key);
        let acc = self.map.entry(key).or_default();
        for (agc, jam) in self.pending_rf.drain(..) {
            acc.add_agc(agc);
            acc.add_jam(jam);
        }
        if let Some((j, sp)) = self.pending_sec.take() {
            acc.marine.sec_jam_state = Some(j);
            acc.marine.sec_spoof_state = Some(sp);
        }
        Some(key)
    }

    /// UBX-NAV-PVT: iTOW u4 @0; year u2 @4, month @6, day @7, hour @8, min @9, sec @10,
    /// valid @11 (bit0 validDate, bit1 validTime); nano i4 @16; fixType u1 @20; numSV
    /// u1 @23; lon i4 @24, lat i4 @28 (1e-7 deg); height i4 @32 (mm above ellipsoid).
    fn nav_pvt(&mut self, p: &[u8]) -> bool {
        if p.len() < 36 {
            return false;
        }
        let Some(key) = le_u32(p, 0).and_then(|t| self.epoch_key(t)) else {
            return false;
        };
        let acc = self.map.entry(key).or_default();
        let valid = p[11];
        if valid & 0b11 == 0b11 {
            let year = i64::from(le_u16(p, 4).unwrap_or(0));
            let (mo, d) = (i64::from(p[6]), i64::from(p[7]));
            let (h, mi, s) = (i64::from(p[8]), i64::from(p[9]), i64::from(p[10]));
            let nano = i64::from(le_i32(p, 16).unwrap_or(0));
            if plausible_date(year, mo, d) && h < 24 && mi < 60 && s <= 60 {
                // nano is a signed correction to the whole second (it may be negative).
                let ms = days_from_civil(year, mo, d) * DAY_MS
                    + ((h * 60 + mi) * 60 + s) * 1000
                    + (nano as f64 / 1e6).round() as i64;
                acc.set_label(RANK_UTC, iso_utc_ms(ms));
            }
        }
        // fixType 2 = 2D, 3 = 3D, 4 = GNSS + dead reckoning; 0/1/5 are no fix,
        // dead reckoning only and time only.
        if (2..=4).contains(&p[20]) {
            let lon = f64::from(le_i32(p, 24).unwrap_or(0)) * 1e-7;
            let lat = f64::from(le_i32(p, 28).unwrap_or(0)) * 1e-7;
            let h = f64::from(le_i32(p, 32).unwrap_or(0)) * 1e-3;
            if lat.abs() <= 90.0 && lon.abs() <= 180.0 {
                acc.fix = Some(ReportedFix {
                    lat_deg: lat,
                    lon_deg: lon,
                    height_m: h,
                    n_used: Some(u32::from(p[23])),
                });
            }
        }
        true
    }

    /// UBX-NAV-TIMEGPS: iTOW u4 @0, fTOW i4 @4 (ns), week i2 @8, valid @11 (bit0
    /// towValid, bit1 weekValid). Supplies the GPS week for labels.
    fn nav_timegps(&mut self, p: &[u8]) -> bool {
        if p.len() < 12 {
            return false;
        }
        let Some(itow) = le_u32(p, 0) else {
            return false;
        };
        let Some(key) = self.epoch_key(itow) else {
            return false;
        };
        if p[11] & 0b11 == 0b11 {
            let week = i64::from(le_u16(p, 8).unwrap_or(0) as i16);
            let ftow = f64::from(le_i32(p, 4).unwrap_or(0)) * 1e-9;
            let tow = f64::from(itow) / 1000.0 + ftow;
            self.week_ref = Some((week, key.div_euclid(WEEK_MS)));
            self.map
                .entry(key)
                .or_default()
                .set_label(RANK_GPS_WEEK, format!("GPS week {week} TOW {tow:.3} s"));
        }
        true
    }

    /// UBX-NAV-SAT: iTOW u4 @0, version @4, numSvs @5, then 12-byte blocks from @8 with
    /// gnssId @0, svId @1, cno @2 (dB-Hz; 0 = not tracked).
    fn nav_sat(&mut self, p: &[u8]) -> bool {
        if p.len() < 8 {
            return false;
        }
        let Some(key) = le_u32(p, 0).and_then(|t| self.epoch_key(t)) else {
            return false;
        };
        let acc = self.map.entry(key).or_default();
        let num_svs = usize::from(p[5]);
        for sv in 0..num_svs {
            let Some(b) = p.get(8 + sv * 12..8 + sv * 12 + 12) else {
                break;
            };
            let (gnss, sv_id, cno) = (b[0], u32::from(b[1]), b[2]);
            if cno == 0 {
                continue;
            }
            if let Some(sat) = ubx_sat(gnss, sv_id) {
                acc.add_cn0(sat, "L1".to_string(), f64::from(cno));
            }
        }
        true
    }

    /// UBX-SEC-SIG, layout version 1: version u1 @0 (must be 1), 3 reserved, jamFlags x1 @4
    /// (bit 0 detection enabled, bits 1-2 jamming state: 0 unknown or off, 1 ok, 2 warning,
    /// 3 critical), spfFlags x1 @5 (bit 0 detection enabled, bits 1-3 spoofing state: 0
    /// unknown or off, 1 none indicated, 2 indicated, 3 multiple indications). A state of a
    /// detector that is not enabled is read as 0. Other layout versions count as skipped.
    /// No time field of its own.
    fn sec_sig(&mut self, p: &[u8]) -> bool {
        if p.len() < 6 || p[0] != 1 {
            return false;
        }
        let jam = if p[4] & 1 == 1 { (p[4] >> 1) & 3 } else { 0 };
        let spf = if p[5] & 1 == 1 { (p[5] >> 1) & 7 } else { 0 };
        match self.cur_key {
            Some(k) => {
                let m = &mut self.map.entry(k).or_default().marine;
                m.sec_jam_state = Some(jam);
                m.sec_spoof_state = Some(spf);
            }
            None => self.pending_sec = Some((jam, spf)),
        }
        true
    }

    /// UBX-MON-RF: version @0, nBlocks @1, 2 reserved, then 24-byte blocks from @4 with
    /// agcCnt u2 @14 (0-8191) and jamInd u1 @16 (0-255). No time field of its own.
    fn mon_rf(&mut self, p: &[u8]) -> bool {
        if p.len() < 4 {
            return false;
        }
        let mut blocks = Vec::new();
        for blk in 0..usize::from(p[1]) {
            let off = 4 + blk * 24;
            let Some(b) = p.get(off..off + 24) else {
                break;
            };
            let agc = u16::from_le_bytes([b[14], b[15]]);
            blocks.push((f64::from(agc), f64::from(b[16])));
        }
        if blocks.is_empty() {
            return false;
        }
        match self.cur_key {
            Some(k) => {
                let acc = self.map.entry(k).or_default();
                for (agc, jam) in blocks {
                    acc.add_agc(agc);
                    acc.add_jam(jam);
                }
            }
            None => self.pending_rf.extend(blocks),
        }
        true
    }
}

/// RINEX satellite id for a u-blox `gnssId`/`svId` pair (u-blox numbers SBAS by PRN
/// 120-158, RINEX by PRN - 100; GLONASS svId 255 means the slot is unknown).
fn ubx_sat(gnss: u8, sv: u32) -> Option<String> {
    let (letter, n) = match gnss {
        0 => ('G', sv),
        1 => ('S', if sv >= 100 { sv - 100 } else { sv }),
        2 => ('E', sv),
        3 => ('C', sv),
        5 => ('J', sv),
        6 if sv != 255 => ('R', sv),
        7 => ('I', sv),
        _ => return None,
    };
    (n > 0).then(|| sat_id(letter, n))
}

/// Read a u-blox UBX binary stream. Only checksum-valid frames are decoded; the scanner
/// resynchronises byte by byte past corrupt data. Each frame that fails its checksum or
/// is too short for its message type counts as one skipped record, and a truncated
/// trailing frame counts as one more. Epochs are keyed by iTOW; an epoch with no
/// NAV-PVT date is labelled from NAV-TIMEGPS's week when one was seen, else by its
/// time of week alone.
pub fn read_ubx(bytes: &[u8]) -> Timeline {
    let mut st = UbxState::default();
    let mut skipped = 0usize;
    let mut truncated = false;
    let n = bytes.len();
    let mut i = 0usize;
    while i + 2 <= n {
        if bytes[i] != UBX_SYNC1 || bytes[i + 1] != UBX_SYNC2 {
            i += 1;
            continue;
        }
        if i + 8 > n {
            truncated = true;
            break;
        }
        let (class, id) = (bytes[i + 2], bytes[i + 3]);
        let len = usize::from(u16::from_le_bytes([bytes[i + 4], bytes[i + 5]]));
        let frame_end = i + 8 + len;
        if frame_end > n {
            // Either the stream was cut mid-frame or the length field is corrupt; keep
            // scanning so a valid frame after a corrupt length is not lost.
            truncated = true;
            i += 1;
            continue;
        }
        let (ck_a, ck_b) = ubx_checksum(&bytes[i + 2..i + 6 + len]);
        if ck_a != bytes[i + 6 + len] || ck_b != bytes[i + 7 + len] {
            skipped += 1;
            i += 1;
            continue;
        }
        let payload = &bytes[i + 6..i + 6 + len];
        let ok = match (class, id) {
            (CLASS_NAV, ID_NAV_PVT) => st.nav_pvt(payload),
            (CLASS_NAV, ID_NAV_TIMEGPS) => st.nav_timegps(payload),
            (CLASS_NAV, ID_NAV_SAT) => st.nav_sat(payload),
            (CLASS_MON, ID_MON_RF) => st.mon_rf(payload),
            (CLASS_SEC, ID_SEC_SIG) => st.sec_sig(payload),
            _ => true, // a valid frame of a message this reader does not use
        };
        if !ok {
            skipped += 1;
        }
        i = frame_end;
    }
    if truncated {
        skipped += 1;
    }
    // MON-RF blocks that never met an iTOW are dropped: they cannot be placed in time.
    let week_ref = st.week_ref;
    for (k, acc) in st.map.iter_mut() {
        if acc.label.is_none() {
            let tow = k.rem_euclid(WEEK_MS) as f64 / 1000.0;
            let label = match week_ref {
                Some((week, idx)) => {
                    let w = week + (k.div_euclid(WEEK_MS) - idx);
                    format!("GPS week {w} TOW {tow:.3} s")
                }
                None => format!("GPS TOW {tow:.3} s"),
            };
            acc.set_label(0, label);
        }
    }
    finalize(st.map, skipped)
}

// ---------------------------------------------------------------------------------
// RINEX 3 observations
// ---------------------------------------------------------------------------------

/// Plausible C/N0 window (dB-Hz), the same one [`crate::realdata`]'s RINEX adapter
/// uses: below 10 is the RINEX 1-9 signal-strength-indicator scale stored by mistake,
/// above 70 a malformed field.
const RINEX_MIN_CN0_DBHZ: f64 = 10.0;
const RINEX_MAX_CN0_DBHZ: f64 = 70.0;

/// The time-system suffix for labels: the `TIME OF FIRST OBS` record's time-system
/// field (columns 49-51) when present, else the single-system file's own scale, else
/// GPS time (the RINEX default).
fn rinex_time_system(text: &str, system: char) -> &'static str {
    let field = text
        .lines()
        .take_while(|l| !l.contains("END OF HEADER"))
        .find(|l| l.contains("TIME OF FIRST OBS"))
        .and_then(|l| l.get(48..51))
        .map(str::trim)
        .unwrap_or("");
    match (field, system) {
        ("GPS", _) => "GPST",
        ("GAL", _) => "GST",
        ("BDT", _) => "BDT",
        ("QZS", _) => "QZSST",
        ("GLO", _) => "GLONASST",
        ("IRN", _) => "IRNWT",
        ("UTC", _) => "UTC",
        (_, 'E') => "GST",
        (_, 'C') => "BDT",
        (_, 'R') => "GLONASST",
        (_, 'J') => "QZSST",
        _ => "GPST",
    }
}

/// Read RINEX 3 observation text. Every `S` code of every satellite at every OK epoch
/// (flag 0) becomes a [`SatCn0`] with the code as its band (`S1C`), when it lies in the
/// plausible 10-70 dB-Hz window. Event records (flag != 0) are not data and are passed
/// over; an epoch with an impossible date is counted as skipped. Labels are the epoch
/// time in the file's own time system (`2024-09-11T09:12:03.000 GPST`). Returns the
/// parser's error when the file is not a readable RINEX observation file.
pub fn read_rinex(text: &str) -> Result<Timeline, String> {
    let rinex = parse_obs(text)?;
    let ts = rinex_time_system(text, rinex.header.system);
    let mut map: BTreeMap<i64, Acc> = BTreeMap::new();
    let mut skipped = 0usize;
    for ep in &rinex.epochs {
        if ep.flag != 0 {
            continue;
        }
        let t = &ep.time;
        let (y, mo, d) = (i64::from(t.year), i64::from(t.month), i64::from(t.day));
        if !plausible_date(y, mo, d)
            || t.hour > 23
            || t.minute > 59
            || !(0.0..61.0).contains(&t.second)
        {
            skipped += 1;
            continue;
        }
        let day_ms = days_from_civil(y, mo, d) * DAY_MS;
        let key = day_ms
            + (i64::from(t.hour) * 3600 + i64::from(t.minute) * 60) * 1000
            + (t.second * 1000.0).round() as i64;
        let acc = map.entry(key).or_default();
        acc.set_label(
            1,
            format!(
                "{y:04}-{mo:02}-{d:02}T{:02}:{:02}:{:06.3} {ts}",
                t.hour, t.minute, t.second
            ),
        );
        for sat in &ep.sats {
            let Some(system) = sat.sat.chars().next() else {
                continue;
            };
            let Some(codes) = rinex.header.codes_for(system) else {
                continue;
            };
            for (k, code) in codes.iter().enumerate() {
                if !code.starts_with('S') {
                    continue;
                }
                if let Some(Some(o)) = sat.obs.get(k) {
                    if (RINEX_MIN_CN0_DBHZ..=RINEX_MAX_CN0_DBHZ).contains(&o.value) {
                        acc.add_cn0(sat.sat.clone(), code.clone(), o.value);
                    }
                }
            }
        }
    }
    Ok(finalize(map, skipped))
}

// ---------------------------------------------------------------------------------
// Android GnssLogger CSV
// ---------------------------------------------------------------------------------

/// Column names of a GnssLogger record type, read from its `# <Tag>,...` header
/// comment. The names align positionally with the data rows (both start with the tag).
fn csv_header(text: &str, tag: &str) -> Option<Vec<String>> {
    let prefix = format!("{tag},");
    text.lines().find_map(|line| {
        let rest = line.trim_start().strip_prefix('#')?.trim_start();
        rest.starts_with(&prefix)
            .then(|| rest.split(',').map(|s| s.trim().to_string()).collect())
    })
}

fn col_of(cols: &[String], names: &[&str]) -> Option<usize> {
    names.iter().find_map(|n| cols.iter().position(|c| c == n))
}

fn field_f64(fields: &[&str], i: Option<usize>) -> Option<f64> {
    let v = fields.get(i?)?.trim().parse::<f64>().ok()?;
    v.is_finite().then_some(v)
}

fn field_i64(fields: &[&str], i: Option<usize>) -> Option<i64> {
    let s = fields.get(i?)?.trim();
    s.parse::<i64>().ok().or_else(|| {
        // Some exports write integers in floating notation (`1.726045923E12`).
        let v = s.parse::<f64>().ok()?;
        (v.is_finite() && v.abs() < 9.0e18).then_some(v as i64)
    })
}

/// Android `ConstellationType` to the RINEX system letter (1 GPS, 2 SBAS, 3 GLONASS,
/// 4 QZSS, 5 BeiDou, 6 Galileo, 7 NavIC). GLONASS rows whose Svid is a frequency
/// channel (93-106, slot unknown) cannot be named and are dropped.
fn android_sat(constellation: i64, svid: i64) -> Option<String> {
    let svid = u32::try_from(svid).ok()?;
    let (letter, n) = match constellation {
        1 => ('G', svid),
        2 => ('S', if svid >= 100 { svid - 100 } else { svid }),
        3 if svid <= 32 => ('R', svid),
        4 => ('J', if svid >= 193 { svid - 192 } else { svid }),
        5 => ('C', svid),
        6 => ('E', svid),
        7 => ('I', svid),
        _ => return None,
    };
    (n > 0 && n < 100).then(|| sat_id(letter, n))
}

/// Band label from a carrier frequency: L1/E1/B1C/G1 near 1575-1606 MHz, L2/G2 near
/// 1227-1246 MHz, L5/E5a/B2a at 1176.45 MHz, E5b/B2b at 1207.14 MHz ("L7"); "L1" when
/// the frequency is absent or unrecognised.
fn band_from_hz(hz: Option<f64>) -> &'static str {
    let Some(mhz) = hz.map(|h| h / 1e6) else {
        return "L1";
    };
    if (mhz - 1176.45).abs() < 3.0 {
        "L5"
    } else if (mhz - 1207.14).abs() < 3.0 {
        "L7"
    } else if (mhz - 1227.60).abs() < 3.0 || (1240.0..1252.0).contains(&mhz) {
        "L2"
    } else {
        "L1"
    }
}

/// One `Fix` row: `(Unix time ms, fix)`, or `None` when a needed field is unreadable.
fn android_fix(
    f: &[&str],
    lat_i: Option<usize>,
    lon_i: Option<usize>,
    alt_i: Option<usize>,
    t_i: Option<usize>,
) -> Option<(i64, ReportedFix)> {
    let lat = field_f64(f, lat_i)?;
    let lon = field_f64(f, lon_i)?;
    let h = field_f64(f, alt_i)?;
    let t = field_i64(f, t_i)?;
    (lat.abs() <= 90.0 && lon.abs() <= 180.0).then_some((
        t,
        ReportedFix {
            lat_deg: lat,
            lon_deg: lon,
            height_m: h,
            n_used: None,
        },
    ))
}

/// How far (ms) a `Fix` row may sit from a `Raw` epoch and still be merged into it: the
/// phone timestamps its fix and its measurement event separately.
const ANDROID_FIX_MERGE_MS: i64 = 500;

/// Read an Android GnssLogger CSV. `Raw` rows are grouped into epochs by
/// `utcTimeMillis` (or by `TimeNanos`, the receiver clock, in captures without it);
/// C/N0 per satellite and band, `AgcDb` averaged per epoch. `Fix` rows become a
/// [`ReportedFix`] (altitude is above the WGS 84 ellipsoid on Android) on the `Raw`
/// epoch within 500 ms, else on an epoch of their own. When the `Raw` rows are on the
/// `TimeNanos` scale the `Fix` rows (Unix time) cannot be aligned and are left out.
/// A row whose time cannot be read is counted as skipped.
pub fn read_android(text: &str) -> Result<Timeline, String> {
    let raw_cols = csv_header(text, "Raw");
    let fix_cols = csv_header(text, "Fix").unwrap_or_else(|| {
        // The column order GnssLogger has written since Android 12, assumed when a
        // capture lacks the `# Fix` header.
        [
            "Fix",
            "Provider",
            "LatitudeDegrees",
            "LongitudeDegrees",
            "AltitudeMeters",
            "SpeedMps",
            "AccuracyMeters",
            "BearingDegrees",
            "UnixTimeMillis",
        ]
        .iter()
        .map(|s| s.to_string())
        .collect()
    });
    let rc = raw_cols.as_deref().unwrap_or(&[]);
    let utc_i = col_of(rc, &["utcTimeMillis"]);
    let nanos_i = col_of(rc, &["TimeNanos"]);
    let svid_i = col_of(rc, &["Svid"]);
    let cons_i = col_of(rc, &["ConstellationType"]);
    let cn0_i = col_of(rc, &["Cn0DbHz"]);
    let freq_i = col_of(rc, &["CarrierFrequencyHz"]);
    let agc_i = col_of(rc, &["AgcDb"]);
    let lat_i = col_of(&fix_cols, &["LatitudeDegrees", "Latitude"]);
    let lon_i = col_of(&fix_cols, &["LongitudeDegrees", "Longitude"]);
    let alt_i = col_of(&fix_cols, &["AltitudeMeters", "Altitude"]);
    let fix_t_i = col_of(
        &fix_cols,
        &["UnixTimeMillis", "(UTC)TimeInMs", "UTCTimeInMs"],
    );
    let use_utc = utc_i.is_some();

    let mut map: BTreeMap<i64, Acc> = BTreeMap::new();
    let mut fixes: Vec<(i64, ReportedFix)> = Vec::new();
    let mut skipped = 0usize;
    let mut raw_rows = 0usize;
    for line in text.lines() {
        let line = line.trim();
        if line.starts_with("Raw,") {
            raw_rows += 1;
            let f: Vec<&str> = line.split(',').collect();
            let key = if use_utc {
                field_i64(&f, utc_i)
            } else {
                field_i64(&f, nanos_i).map(|ns| ns.div_euclid(1_000_000))
            };
            let Some(key) = key else {
                skipped += 1; // no header, or an unreadable time field
                continue;
            };
            let acc = map.entry(key).or_default();
            if use_utc {
                acc.set_label(1, iso_utc_ms(key));
            }
            if let (Some(c), Some(s)) = (field_i64(&f, cons_i), field_i64(&f, svid_i)) {
                if let (Some(sat), Some(cn0)) = (android_sat(c, s), field_f64(&f, cn0_i)) {
                    let band = band_from_hz(field_f64(&f, freq_i));
                    acc.add_cn0(sat, band.to_string(), cn0);
                }
            }
            if let Some(agc) = field_f64(&f, agc_i) {
                acc.add_agc(agc);
            }
        } else if line.starts_with("Fix,") {
            let f: Vec<&str> = line.split(',').collect();
            let parsed = android_fix(&f, lat_i, lon_i, alt_i, fix_t_i);
            match parsed {
                Some(fx) => fixes.push(fx),
                None => skipped += 1,
            }
        }
    }
    // Fixes are placed after all Raw rows are read, since a Fix row may precede the
    // measurements of its own instant in the file.
    if use_utc || raw_rows == 0 {
        for (t, fix) in fixes {
            let nearest = map
                .range(t - ANDROID_FIX_MERGE_MS..=t + ANDROID_FIX_MERGE_MS)
                .map(|(k, _)| *k)
                .min_by_key(|k| (k - t).abs());
            let key = nearest.unwrap_or(t);
            let acc = map.entry(key).or_default();
            acc.set_label(1, iso_utc_ms(key));
            acc.fix = Some(fix);
        }
    }
    Ok(finalize(map, skipped))
}

// ---------------------------------------------------------------------------------
// NMEA 0183
// ---------------------------------------------------------------------------------

/// XOR of the bytes between `$` and `*`: the NMEA sentence checksum.
fn nmea_xor(body: &str) -> u8 {
    body.bytes().fold(0u8, |a, b| a ^ b)
}

/// RINEX satellite id for an NMEA talker and satellite number.
///
/// System-specific talkers (GL GLONASS, GA Galileo, GB/BD BeiDou, GQ QZSS, GI NavIC)
/// accept both their native numbers and the extended ranges older receivers emit.
/// `GP` and `GN` use the NMEA 4.x numbering: 1-32 GPS, 33-64 SBAS (PRN = n + 87, so
/// RINEX `S` n - 13), 65-96 GLONASS (slot n - 64), plus the common vendor extensions
/// 120-158 SBAS PRN, 193-202 QZSS, 301-336 Galileo, 401-463 BeiDou (the 201-263
/// BeiDou range is accepted only under a BeiDou talker, since 201-202 would collide
/// with QZSS). Numbers outside every range are dropped rather than guessed.
fn nmea_sat(talker: &str, n: u32) -> Option<String> {
    let generic = |n: u32| -> Option<(char, u32)> {
        Some(match n {
            1..=32 => ('G', n),
            33..=64 => ('S', n - 13),
            65..=96 => ('R', n - 64),
            120..=158 => ('S', n - 100),
            193..=202 => ('J', n - 192),
            301..=336 => ('E', n - 300),
            401..=463 => ('C', n - 400),
            _ => return None,
        })
    };
    let (letter, num) = match talker {
        "GP" | "GN" => generic(n)?,
        "GL" => match n {
            1..=32 => ('R', n),
            65..=96 => ('R', n - 64),
            _ => return None,
        },
        "GA" => match n {
            1..=36 => ('E', n),
            301..=336 => ('E', n - 300),
            _ => return None,
        },
        "GB" | "BD" => match n {
            1..=63 => ('C', n),
            201..=263 => ('C', n - 200),
            401..=463 => ('C', n - 400),
            _ => return None,
        },
        "GQ" => match n {
            1..=10 => ('J', n),
            193..=202 => ('J', n - 192),
            _ => return None,
        },
        "GI" => match n {
            1..=14 => ('I', n),
            _ => return None,
        },
        _ => return None,
    };
    Some(sat_id(letter, num))
}

/// Band label for an NMEA 4.10+ GSV signal ID (a hex digit, per system); "L1" when the
/// sentence has none (pre-4.10 GSV is the L1 signal). IDs not in the table keep their
/// number (`sig9`) rather than being misnamed.
fn nmea_band(sat: &str, sig: Option<u8>) -> String {
    let Some(sig) = sig else {
        return "L1".to_string();
    };
    let letter = sat.chars().next().unwrap_or(' ');
    let band = match (letter, sig) {
        (_, 0) => "L1",
        ('G', 1..=3) | ('J', 1..=4) | ('S', 1) => "L1",
        ('G', 4..=6) | ('J', 5 | 6) => "L2",
        ('G', 7 | 8) | ('J', 7 | 8) => "L5",
        ('R', 1 | 2) => "L1",
        ('R', 3 | 4) => "L2",
        ('E', 6 | 7) => "L1",
        ('E', 1) => "L5",
        ('E', 2) => "L7",
        ('E', 3) => "L8",
        ('E', 4 | 5) => "L6",
        ('C', 1 | 2) => "L2",
        ('C', 3 | 4) => "L1",
        ('C', 5) => "L5",
        ('C', 6) => "L7",
        ('C', 8) => "L6",
        _ => return format!("sig{sig:X}"),
    };
    band.to_string()
}

/// `hhmmss.ss` to milliseconds of the day.
fn nmea_tod_ms(s: &str) -> Option<i64> {
    let h: i64 = s.get(0..2)?.parse().ok()?;
    let m: i64 = s.get(2..4)?.parse().ok()?;
    let sec: f64 = s.get(4..)?.parse().ok()?;
    (h < 24 && m < 60 && (0.0..61.0).contains(&sec))
        .then(|| (h * 60 + m) * 60_000 + (sec * 1000.0).round() as i64)
}

/// `ddmm.mmmm` / `dddmm.mmmm` with its hemisphere letter to signed degrees.
fn nmea_angle(v: &str, hemi: &str, neg: &str, max: f64) -> Option<f64> {
    let v: f64 = v.trim().parse().ok()?;
    if !v.is_finite() || v < 0.0 {
        return None;
    }
    let deg = (v / 100.0).trunc();
    let a = deg + (v - deg * 100.0) / 60.0;
    let a = if hemi.trim() == neg { -a } else { a };
    (a.abs() <= max).then_some(a)
}

/// Reader state while walking NMEA sentences.
#[derive(Default)]
struct NmeaState {
    map: BTreeMap<i64, Acc>,
    last_tod: Option<i64>,
    /// Days added to the time of day so keys keep increasing across midnight.
    day_off: i64,
    cur_key: Option<i64>,
    /// GSV satellites `(sat, band, snr)` seen before any timed sentence.
    pending: Vec<(String, String, f64)>,
    /// Days since 1970 of day offset 0, once an RMC date is seen.
    base_day: Option<i64>,
    /// Arrival time of the line being parsed (live input), s.
    arrival: Option<f64>,
    /// Key of the previous timed sentence, in arrival order.
    prev_key: Option<i64>,
}

impl NmeaState {
    fn epoch_key(&mut self, tod: i64) -> i64 {
        if let Some(last) = self.last_tod {
            // A time of day more than 12 h earlier than the last is the next day.
            if tod < last - DAY_MS / 2 {
                self.day_off += 1;
            }
        }
        self.last_tod = Some(tod);
        let key = self.day_off * DAY_MS + tod;
        self.cur_key = Some(key);
        let step = self.prev_key.map(|p| key - p).filter(|d| *d != 0);
        self.prev_key = Some(key);
        let arrival = self.arrival;
        let acc = self.map.entry(key).or_default();
        if let Some(d) = step {
            acc.marine.time_step_s = Some(d as f64 / 1000.0);
        }
        if acc.marine.arrival_s.is_none() {
            acc.marine.arrival_s = arrival;
        }
        for (sat, band, snr) in self.pending.drain(..) {
            acc.add_cn0(sat, band, snr);
        }
        key
    }
}

/// Outcome of one sentence: used, ignored (no information, not an error), corrupt.
enum Sentence {
    Used,
    Ignored,
    Corrupt,
}

/// A finite number from an NMEA field, `None` when empty or malformed.
fn num(s: &str) -> Option<f64> {
    s.trim().parse::<f64>().ok().filter(|v| v.is_finite())
}

/// Fold one validity statement into an epoch: valid only if every sentence says so.
fn and_valid(m: &mut MarineObs, v: bool) {
    m.fix_valid = Some(m.fix_valid.is_none_or(|o| o) && v);
}

/// A heading or course in degrees, accepted in `[0, 360]` and wrapped to `[0, 360)`.
fn bearing(s: &str) -> Option<f64> {
    num(s)
        .filter(|v| (0.0..=360.0).contains(v))
        .map(|v| v % 360.0)
}

/// The accumulator of the epoch NMEA sentences without a time of their own attach to
/// (the most recent timed sentence's), or `None` before any timed sentence.
fn cur_marine(st: &mut NmeaState) -> Option<&mut MarineObs> {
    let k = st.cur_key?;
    Some(&mut st.map.entry(k).or_default().marine)
}

/// GGA: 1 time, 2-3 latitude, 4-5 longitude, 6 fix quality (0 = no fix), 7 satellites
/// used, 8 HDOP, 9 altitude above mean sea level, 11 geoid separation. The height reported is
/// ellipsoidal (altitude + separation) when the separation is given, else MSL.
fn nmea_gga(st: &mut NmeaState, f: &[&str]) -> Sentence {
    let t = f.get(1).copied().unwrap_or("").trim();
    if t.is_empty() {
        return Sentence::Ignored; // receivers send empty GGA before their first fix
    }
    let Some(tod) = nmea_tod_ms(t) else {
        return Sentence::Corrupt;
    };
    let key = st.epoch_key(tod);
    let quality: u32 = f.get(6).and_then(|s| s.trim().parse().ok()).unwrap_or(0);
    let get = |i: usize| f.get(i).copied().unwrap_or("");
    {
        let m = &mut st.map.entry(key).or_default().marine;
        and_valid(m, quality > 0);
        if quality > 0 {
            m.hdop = num(get(8));
            m.alt_msl_m = num(get(9));
            m.geoid_sep_m = num(get(11));
        }
    }
    if quality == 0 {
        return Sentence::Used;
    }
    let lat = nmea_angle(get(2), get(3), "S", 90.0);
    let lon = nmea_angle(get(4), get(5), "W", 180.0);
    let alt: Option<f64> = get(9).trim().parse().ok().filter(|v: &f64| v.is_finite());
    let sep: f64 = get(11)
        .trim()
        .parse()
        .ok()
        .filter(|v: &f64| v.is_finite())
        .unwrap_or(0.0);
    if let (Some(lat), Some(lon), Some(alt)) = (lat, lon, alt) {
        st.map.entry(key).or_default().fix = Some(ReportedFix {
            lat_deg: lat,
            lon_deg: lon,
            height_m: alt + sep,
            n_used: get(7).trim().parse().ok(),
        });
    }
    Sentence::Used
}

/// RMC: 1 time, 2 status, 7 speed over ground, 8 course over ground, 9 date `ddmmyy`
/// (years 80-99 are 19xx, else 20xx), 12 mode.
fn nmea_rmc(st: &mut NmeaState, f: &[&str]) -> Sentence {
    let t = f.get(1).copied().unwrap_or("").trim();
    if t.is_empty() {
        return Sentence::Ignored;
    }
    let Some(tod) = nmea_tod_ms(t) else {
        return Sentence::Corrupt;
    };
    let key = st.epoch_key(tod);
    {
        // 2 status (A valid, V warning), 7 speed over ground (kn), 8 course over ground
        // (deg true), 12 mode indicator (N = not valid).
        let get = |i: usize| f.get(i).copied().unwrap_or("");
        let valid = get(2).trim() == "A" && get(12).trim() != "N";
        let m = &mut st.map.entry(key).or_default().marine;
        and_valid(m, valid);
        if valid {
            m.sog_kn = num(get(7)).filter(|v| *v >= 0.0);
            m.cog_deg = bearing(get(8));
        }
    }
    let date = f.get(9).copied().unwrap_or("").trim();
    if st.base_day.is_none() && date.len() == 6 {
        let num = |a: usize| date.get(a..a + 2).and_then(|s| s.parse::<i64>().ok());
        if let (Some(d), Some(m), Some(y)) = (num(0), num(2), num(4)) {
            let y = if y >= 80 { 1900 + y } else { 2000 + y };
            if plausible_date(y, m, d) {
                st.base_day = Some(days_from_civil(y, m, d) - st.day_off);
            }
        }
    }
    Sentence::Used
}

/// GSV: 1 sentence count, 2 sentence number, 3 satellites in view, then groups of
/// four (number, elevation, azimuth, SNR dB-Hz), and from NMEA 4.10 one trailing
/// signal ID. An empty SNR means not tracked.
fn nmea_gsv(st: &mut NmeaState, talker: &str, f: &[&str]) -> Sentence {
    if f.len() < 4 {
        return Sentence::Corrupt;
    }
    let rest = f.len() - 4;
    let sig = if rest % 4 == 1 {
        match f.last().map(|s| s.trim()) {
            Some("") | None => None,
            Some(s) => match u8::from_str_radix(s, 16) {
                Ok(v) => Some(v),
                Err(_) => return Sentence::Corrupt,
            },
        }
    } else {
        None
    };
    for g in 0..rest / 4 {
        let base = 4 + 4 * g;
        let Some(n) = f.get(base).and_then(|s| s.trim().parse::<u32>().ok()) else {
            continue;
        };
        let Some(snr) = f.get(base + 3).and_then(|s| s.trim().parse::<f64>().ok()) else {
            continue;
        };
        let Some(sat) = nmea_sat(talker, n) else {
            continue;
        };
        let band = nmea_band(&sat, sig);
        match st.cur_key {
            Some(k) => st.map.entry(k).or_default().add_cn0(sat, band, snr),
            None => st.pending.push((sat, band, snr)),
        }
    }
    Sentence::Used
}

/// VTG: 1 course over ground (deg true), 5 speed over ground (kn), 9 mode (N = not
/// valid). Fills the speed and course only where RMC has not.
fn nmea_vtg(st: &mut NmeaState, f: &[&str]) -> Sentence {
    let get = |i: usize| f.get(i).copied().unwrap_or("");
    let Some(m) = cur_marine(st) else {
        return Sentence::Ignored;
    };
    if get(9).trim() == "N" {
        return Sentence::Used;
    }
    if m.cog_deg.is_none() {
        m.cog_deg = bearing(get(1));
    }
    if m.sog_kn.is_none() {
        m.sog_kn = num(get(5)).filter(|v| *v >= 0.0);
    }
    Sentence::Used
}

/// HDT: 1 heading (deg true). THS: 1 heading (deg true), 2 mode (V = not valid).
fn nmea_heading(st: &mut NmeaState, f: &[&str], ths: bool) -> Sentence {
    let get = |i: usize| f.get(i).copied().unwrap_or("");
    let Some(m) = cur_marine(st) else {
        return Sentence::Ignored;
    };
    if ths && get(2).trim() == "V" {
        return Sentence::Used;
    }
    if let Some(h) = bearing(get(1)) {
        m.heading_deg = Some(h);
    }
    Sentence::Used
}

/// VHW: 1 heading true, 5 speed through the water (kn), 7 the same in km/h. The heading is
/// used only where no HDT or THS gave one.
fn nmea_vhw(st: &mut NmeaState, f: &[&str]) -> Sentence {
    let get = |i: usize| f.get(i).copied().unwrap_or("");
    let Some(m) = cur_marine(st) else {
        return Sentence::Ignored;
    };
    let stw = num(get(5)).or_else(|| num(get(7)).map(|k| k / 1.852));
    if let Some(v) = stw.filter(|v| *v >= 0.0) {
        m.stw_kn = Some(v);
    }
    if m.heading_deg.is_none() {
        m.heading_deg = bearing(get(1));
    }
    Sentence::Used
}

/// VBW: 1 longitudinal water speed (kn), 3 its status (A valid).
fn nmea_vbw(st: &mut NmeaState, f: &[&str]) -> Sentence {
    let get = |i: usize| f.get(i).copied().unwrap_or("");
    let Some(m) = cur_marine(st) else {
        return Sentence::Ignored;
    };
    if get(3).trim() == "A" {
        if let Some(v) = num(get(1)) {
            m.stw_kn = Some(v);
        }
    }
    Sentence::Used
}

/// ZDA: 1 time, 2-4 day, month, year. A timed sentence like GGA and RMC: it opens or joins
/// the epoch of its time, so a clock that disagrees with the other sentences shows as a
/// step in [`MarineObs::time_step_s`].
fn nmea_zda(st: &mut NmeaState, f: &[&str]) -> Sentence {
    let t = f.get(1).copied().unwrap_or("").trim();
    if t.is_empty() {
        return Sentence::Ignored;
    }
    let Some(tod) = nmea_tod_ms(t) else {
        return Sentence::Corrupt;
    };
    st.epoch_key(tod);
    Sentence::Used
}

/// The Kshana OSNMA-status input sentence `$PKSOS,<status>[,<sat>:<status>...]`: `A`
/// authenticated, `F` failed, `N` no result, overall and optionally per satellite (`E11:A`). A receiver's own report is translated into this by whatever
/// adapter reads the receiver; Kshana does not verify OSNMA.
fn nmea_osnma(st: &mut NmeaState, f: &[&str]) -> Sentence {
    let Some(m) = cur_marine(st) else {
        return Sentence::Ignored;
    };
    let status = |c: &str| match c.trim() {
        "A" => Some(OsnmaStatus::Authenticated),
        "F" => Some(OsnmaStatus::Failed),
        "N" => Some(OsnmaStatus::Unavailable),
        _ => None,
    };
    let Some(overall) = f.get(1).and_then(|c| status(c)) else {
        return Sentence::Corrupt;
    };
    // Optional per-satellite fields `E11:A`, `E19:F`.
    let mut sats = Vec::new();
    for field in f.iter().skip(2).filter(|x| !x.trim().is_empty()) {
        match field.split_once(':').and_then(|(id, c)| {
            let ok = id.len() == 3 && id.is_ascii() && id[1..].chars().all(|d| d.is_ascii_digit());
            ok.then(|| status(c).map(|s| (id.to_string(), s))).flatten()
        }) {
            Some(x) => sats.push(x),
            None => return Sentence::Corrupt,
        }
    }
    m.osnma = Some(overall);
    m.sat_auth = sats;
    Sentence::Used
}

/// Incremental NMEA 0183 reader: lines are fed one at a time (with, for live input, their
/// arrival time on a monotonic clock) and the epochs gathered so far are taken out whenever
/// the caller decides a cycle of sentences is complete. [`read_nmea`] is this reader run
/// over a whole text, so a file and a live stream parse identically.
#[derive(Default)]
pub struct NmeaFeed {
    st: NmeaState,
    skipped: usize,
    first_key: Option<i64>,
}

impl NmeaFeed {
    /// An empty reader.
    pub fn new() -> Self {
        Self::default()
    }

    /// Records skipped so far (bad checksum, no `$`, malformed fields).
    pub fn skipped(&self) -> usize {
        self.skipped
    }

    /// Parse one line. `arrival_s` is its arrival on a monotonic clock, kept on the epoch
    /// it opens.
    pub fn feed(&mut self, line: &str, arrival_s: Option<f64>) {
        self.st.arrival = arrival_s;
        let line = line.trim();
        if line.is_empty() {
            return;
        }
        let Some(start) = line.find('$') else {
            self.skipped += 1;
            return;
        };
        let s = &line[start + 1..];
        let body = match s.find('*') {
            Some(p) => {
                let want = s
                    .get(p + 1..p + 3)
                    .and_then(|h| u8::from_str_radix(h, 16).ok());
                let body = &s[..p];
                if want != Some(nmea_xor(body)) {
                    self.skipped += 1;
                    return;
                }
                body
            }
            None => s, // the checksum is optional in NMEA 0183
        };
        let f: Vec<&str> = body.split(',').collect();
        let addr = f[0];
        if addr.len() != 5 || !addr.is_ascii() {
            return; // proprietary ($P...) or unknown sentence
        }
        let st = &mut self.st;
        let (talker, kind) = (&addr[0..2], &addr[2..5]);
        let outcome = match (talker, kind) {
            ("PK", "SOS") => nmea_osnma(st, &f),
            (_, "GGA") => nmea_gga(st, &f),
            (_, "RMC") => nmea_rmc(st, &f),
            (_, "GSV") => nmea_gsv(st, talker, &f),
            (_, "VTG") => nmea_vtg(st, &f),
            (_, "HDT") => nmea_heading(st, &f, false),
            (_, "THS") => nmea_heading(st, &f, true),
            (_, "VHW") => nmea_vhw(st, &f),
            (_, "VBW") => nmea_vbw(st, &f),
            (_, "ZDA") => nmea_zda(st, &f),
            _ => Sentence::Ignored,
        };
        if matches!(outcome, Sentence::Corrupt) {
            self.skipped += 1;
        }
    }

    /// Epochs gathered and not yet taken, the one still being filled included.
    pub fn open_epochs(&self) -> usize {
        self.st.map.len()
    }

    /// Take every epoch except the one the most recent timed sentence opened or joined: the
    /// epochs a newer timed sentence has closed.
    pub fn take_closed_epochs(&mut self) -> Vec<LogEpoch> {
        let Some(cur) = self.st.cur_key else {
            return Vec::new();
        };
        let keep = self.st.map.remove(&cur);
        let closed = self.take_epochs();
        self.st.cur_key = Some(cur);
        if let Some(acc) = keep {
            self.st.map.insert(cur, acc);
        }
        closed
    }

    /// Take every epoch gathered so far, in time order, labelled; `t_s` counts from the
    /// first epoch this reader ever produced.
    pub fn take_epochs(&mut self) -> Vec<LogEpoch> {
        let mut map = std::mem::take(&mut self.st.map);
        if self.first_key.is_none() {
            self.first_key = map.keys().next().copied();
        }
        let base = self.st.base_day;
        for (k, acc) in map.iter_mut() {
            let label = match base {
                Some(b) => iso_utc_ms(b * DAY_MS + k),
                None => {
                    let r = k.rem_euclid(DAY_MS);
                    format!(
                        "{:02}:{:02}:{:02}.{:03} UTC (date not in log)",
                        r / 3_600_000,
                        r / 60_000 % 60,
                        r / 1000 % 60,
                        r % 1000
                    )
                }
            };
            acc.set_label(1, label);
        }
        // Everything gathered is out: a late sentence must not reopen a taken epoch.
        self.st.cur_key = None;
        epochs_from(map, self.first_key.unwrap_or(0))
    }
}

/// Read NMEA 0183 text. A sentence whose `*hh` checksum does not match, a line with no
/// `$`, or a GGA/RMC/GSV with malformed fields counts as skipped. Epochs are keyed by
/// the GGA/RMC time of day (rolling over at midnight); GSV satellites attach to the
/// most recent time (those before the first time wait for it). Labels are ISO-8601 UTC
/// once an RMC date is seen, else the time of day alone. Other sentence types are
/// ignored.
pub fn read_nmea(text: &str) -> Result<Timeline, String> {
    let mut feed = NmeaFeed::new();
    for line in text.lines() {
        feed.feed(line, None);
    }
    let skipped = feed.skipped();
    Ok(timeline_from(feed.take_epochs(), skipped))
}

#[cfg(test)]
mod tests {
    use super::*;

    // ---- UBX ----

    /// Wrap a class/id/payload into a complete, checksum-valid UBX frame.
    fn frame(class: u8, id: u8, payload: &[u8]) -> Vec<u8> {
        let len = (payload.len() as u16).to_le_bytes();
        let mut body = vec![class, id, len[0], len[1]];
        body.extend_from_slice(payload);
        let (a, b) = ubx_checksum(&body);
        let mut f = vec![UBX_SYNC1, UBX_SYNC2];
        f.extend_from_slice(&body);
        f.extend([a, b]);
        f
    }

    /// NAV-PVT payload (92 bytes) at `itow` ms: 2024-09-11 09:12:03 UTC (valid), the
    /// given fix type, 9 satellites, lat 69.3 deg, lon 16.0 deg, height 120.5 m.
    fn pvt(itow: u32, sec: u8, fix_type: u8) -> Vec<u8> {
        let mut p = vec![0u8; 92];
        p[0..4].copy_from_slice(&itow.to_le_bytes());
        p[4..6].copy_from_slice(&2024u16.to_le_bytes());
        p[6] = 9;
        p[7] = 11;
        p[8] = 9;
        p[9] = 12;
        p[10] = sec;
        p[11] = 0b11;
        p[20] = fix_type;
        p[23] = 9;
        p[24..28].copy_from_slice(&160_000_000i32.to_le_bytes());
        p[28..32].copy_from_slice(&693_000_000i32.to_le_bytes());
        p[32..36].copy_from_slice(&120_500i32.to_le_bytes());
        p
    }

    /// NAV-SAT payload at `itow` with `(gnssId, svId, cno)` entries.
    fn sat(itow: u32, svs: &[(u8, u8, u8)]) -> Vec<u8> {
        let mut p = itow.to_le_bytes().to_vec();
        p.extend([1, svs.len() as u8, 0, 0]);
        for &(g, s, c) in svs {
            let mut b = vec![0u8; 12];
            b[0] = g;
            b[1] = s;
            b[2] = c;
            p.extend(b);
        }
        p
    }

    /// MON-RF payload with one block per `(agcCnt, jamInd)`.
    fn rf(blocks: &[(u16, u8)]) -> Vec<u8> {
        let mut p = vec![0u8, blocks.len() as u8, 0, 0];
        for &(agc, jam) in blocks {
            let mut b = vec![0u8; 24];
            b[14..16].copy_from_slice(&agc.to_le_bytes());
            b[16] = jam;
            p.extend(b);
        }
        p
    }

    fn ubx_stream() -> Vec<u8> {
        let t0 = 345_600_000;
        let mut s = frame(CLASS_NAV, ID_NAV_PVT, &pvt(t0, 3, 3));
        s.extend(frame(
            CLASS_NAV,
            ID_NAV_SAT,
            &sat(t0, &[(0, 5, 42), (2, 11, 38), (6, 7, 0), (1, 128, 35)]),
        ));
        s.extend(frame(CLASS_MON, ID_MON_RF, &rf(&[(2000, 30), (3000, 80)])));
        // A corrupt frame (bad CK_B) between the two epochs.
        let mut bad = frame(CLASS_NAV, ID_NAV_SAT, &sat(t0 + 500, &[(0, 9, 40)]));
        let n = bad.len();
        bad[n - 1] ^= 0xFF;
        s.extend(bad);
        let t1 = t0 + 1000;
        // Epoch 2: NAV-SAT before NAV-PVT (same iTOW, so they merge); no fix.
        s.extend(frame(CLASS_NAV, ID_NAV_SAT, &sat(t1, &[(0, 5, 31)])));
        s.extend(frame(CLASS_NAV, ID_NAV_PVT, &pvt(t1, 4, 0)));
        s.extend(frame(CLASS_MON, ID_MON_RF, &rf(&[(1500, 200)])));
        s
    }

    #[test]
    fn ubx_two_epochs_with_all_observables() {
        let tl = read_ubx(&ubx_stream());
        assert_eq!(tl.epochs.len(), 2);
        assert_eq!(tl.observables, ["cn0", "agc", "jam_ind", "fix"]);
        assert_eq!(tl.skipped_records, 1, "the bad-checksum frame is counted");
        assert_eq!(tl.start_label.as_deref(), Some("2024-09-11T09:12:03.000Z"));
        let e0 = &tl.epochs[0];
        assert_eq!(e0.t_s, 0.0);
        let sats: Vec<&str> = e0.cn0.iter().map(|s| s.sat.as_str()).collect();
        assert_eq!(sats, ["G05", "E11", "S28"], "R07 has cno 0 and is dropped");
        assert!(e0.cn0.iter().all(|s| s.band == "L1"));
        assert_eq!(e0.agc, Some(2500.0));
        assert_eq!(e0.jam_ind, Some(80.0));
        let fix = e0.fix.expect("3D fix");
        assert!((fix.lat_deg - 69.3).abs() < 1e-9 && (fix.lon_deg - 16.0).abs() < 1e-9);
        assert!((fix.height_m - 120.5).abs() < 1e-9);
        assert_eq!(fix.n_used, Some(9));
        let e1 = &tl.epochs[1];
        assert_eq!(e1.t_s, 1.0);
        assert_eq!(e1.cn0.len(), 1);
        assert_eq!(e1.cn0[0].cn0_dbhz, 31.0);
        assert_eq!(e1.fix, None, "fixType 0 is no fix");
        assert_eq!(e1.agc, Some(1500.0));
        assert_eq!(e1.time_label.as_deref(), Some("2024-09-11T09:12:04.000Z"));
    }

    #[test]
    fn ubx_mon_rf_before_any_itow_waits_for_the_first_epoch() {
        let mut s = frame(CLASS_MON, ID_MON_RF, &rf(&[(1000, 10)]));
        s.extend(frame(CLASS_NAV, ID_NAV_SAT, &sat(1000, &[(0, 1, 40)])));
        let tl = read_ubx(&s);
        assert_eq!(tl.epochs.len(), 1);
        assert_eq!(tl.epochs[0].agc, Some(1000.0));
        assert_eq!(tl.epochs[0].jam_ind, Some(10.0));
        assert_eq!(tl.start_label.as_deref(), Some("GPS TOW 1.000 s"));
        assert_eq!(tl.observables, ["cn0", "agc", "jam_ind"]);
    }

    #[test]
    fn ubx_week_rollover_keeps_time_increasing_and_week_labels() {
        let mut tg = vec![0u8; 16];
        tg[0..4].copy_from_slice(&604_799_000u32.to_le_bytes());
        tg[8..10].copy_from_slice(&2331u16.to_le_bytes());
        tg[11] = 0b11;
        let mut s = frame(CLASS_NAV, ID_NAV_TIMEGPS, &tg);
        s.extend(frame(
            CLASS_NAV,
            ID_NAV_SAT,
            &sat(604_799_000, &[(0, 3, 40)]),
        ));
        s.extend(frame(CLASS_NAV, ID_NAV_SAT, &sat(0, &[(0, 3, 41)])));
        let tl = read_ubx(&s);
        assert_eq!(tl.epochs.len(), 2);
        assert_eq!(tl.epochs[1].t_s, 1.0);
        assert_eq!(
            tl.start_label.as_deref(),
            Some("GPS week 2331 TOW 604799.000 s")
        );
        assert_eq!(
            tl.epochs[1].time_label.as_deref(),
            Some("GPS week 2332 TOW 0.000 s")
        );
    }

    #[test]
    fn ubx_truncation_at_every_length_never_panics() {
        let s = ubx_stream();
        for n in 0..=s.len() {
            let tl = read_ubx(&s[..n]);
            assert!(tl.epochs.len() <= 2);
        }
        // Cut inside the last frame: the truncated tail is counted.
        let tl = read_ubx(&s[..s.len() - 3]);
        assert_eq!(tl.skipped_records, 2);
    }

    // ---- RINEX ----

    /// Place `(column, text)` fields at exact 0-indexed columns.
    fn place(fields: &[(usize, &str)]) -> String {
        let mut s = String::new();
        for (col, val) in fields {
            if s.len() < *col {
                s.push_str(&" ".repeat(col - s.len()));
            }
            s.push_str(val);
        }
        s
    }

    fn hdr(fields: &[(usize, &str)], label: &str) -> String {
        let mut s = place(fields);
        s.push_str(&" ".repeat(60usize.saturating_sub(s.len())));
        s.push_str(label);
        s
    }

    fn rec(sat: &str, vals: &[f64]) -> String {
        let fields: Vec<(usize, String)> = std::iter::once((0, sat.to_string()))
            .chain(
                vals.iter()
                    .enumerate()
                    .map(|(k, v)| (3 + k * 16, format!("{v:14.3}"))),
            )
            .collect();
        let refs: Vec<(usize, &str)> = fields.iter().map(|(c, s)| (*c, s.as_str())).collect();
        place(&refs)
    }

    fn rinex_text() -> String {
        [
            hdr(
                &[(0, "     3.04"), (20, "OBSERVATION DATA"), (40, "M")],
                "RINEX VERSION / TYPE",
            ),
            hdr(
                &[(0, "G"), (3, "  2"), (7, "C1C"), (11, "S1C")],
                "SYS / # / OBS TYPES",
            ),
            hdr(
                &[(0, "E"), (3, "  2"), (7, "C1X"), (11, "S1X")],
                "SYS / # / OBS TYPES",
            ),
            hdr(
                &[
                    (0, "  2024"),
                    (6, "     9"),
                    (12, "    11"),
                    (18, "     9"),
                    (24, "    12"),
                    (30, "    3.0000000"),
                    (48, "GPS"),
                ],
                "TIME OF FIRST OBS",
            ),
            hdr(&[], "END OF HEADER"),
            "> 2024 09 11 09 12  3.0000000  0  2".to_string(),
            rec("G05", &[23_456_789.123, 45.0]),
            rec("E11", &[24_456_789.123, 7.0]), // SSI scale value: rejected
            "> 2024 09 11 09 12 33.0000000  0  1".to_string(),
            rec("G05", &[23_456_999.123, 31.0]),
            // A second record at the same instant: merged into the epoch above.
            "> 2024 09 11 09 12 33.0000000  0  1".to_string(),
            rec("E11", &[24_456_999.123, 40.25]),
        ]
        .join("\n")
    }

    #[test]
    fn rinex_two_epochs_merged_and_windowed() {
        let tl = read_rinex(&rinex_text()).expect("parses");
        assert_eq!(tl.epochs.len(), 2);
        assert_eq!(tl.observables, ["cn0"]);
        assert_eq!(tl.skipped_records, 0);
        assert_eq!(
            tl.start_label.as_deref(),
            Some("2024-09-11T09:12:03.000 GPST")
        );
        let e0 = &tl.epochs[0];
        assert_eq!(e0.t_s, 0.0);
        assert_eq!(e0.cn0.len(), 1);
        assert_eq!(
            (e0.cn0[0].sat.as_str(), e0.cn0[0].band.as_str()),
            ("G05", "S1C")
        );
        let e1 = &tl.epochs[1];
        assert_eq!(e1.t_s, 30.0);
        let got: Vec<(&str, &str, f64)> = e1
            .cn0
            .iter()
            .map(|s| (s.sat.as_str(), s.band.as_str(), s.cn0_dbhz))
            .collect();
        assert_eq!(got, [("G05", "S1C", 31.0), ("E11", "S1X", 40.25)]);
        assert!(e1.agc.is_none() && e1.jam_ind.is_none() && e1.fix.is_none());
    }

    #[test]
    fn rinex_garbage_is_an_error() {
        assert!(read_rinex("not a rinex file").is_err());
        assert!(read_log(LogFormat::Rinex, b"").is_err());
    }

    // ---- Android ----

    const ANDROID: &str = "\
# Header Description:
# Raw,utcTimeMillis,TimeNanos,Svid,ConstellationType,Cn0DbHz,CarrierFrequencyHz,AgcDb
# Fix,Provider,LatitudeDegrees,LongitudeDegrees,AltitudeMeters,SpeedMps,AccuracyMeters,BearingDegrees,UnixTimeMillis
Fix,GPS,69.3,16.0,120.5,0,3,0,1726045923200
Raw,1726045923000,100,5,1,42.5,1575420030,2.0
Raw,1726045923000,100,5,1,38.0,1176450000,4.0
Raw,1726045923000,100,11,6,40.0,1575420030,
Raw,1726045924000,1000000100,5,1,30.0,1575420030,10.0
Raw,garbage
Fix,GPS,not-a-number,16.0,120.5,0,3,0,1726045925000
Fix,GPS,69.4,16.1,121.0,0,3,0,1726045930000
Status,1,2,3
";

    #[test]
    fn android_raw_and_fix_rows() {
        let tl = read_android(ANDROID).expect("reads");
        assert_eq!(tl.epochs.len(), 3);
        assert_eq!(tl.observables, ["cn0", "agc", "fix"]);
        assert_eq!(tl.skipped_records, 2, "one bad Raw row, one bad Fix row");
        assert_eq!(tl.start_label.as_deref(), Some("2024-09-11T09:12:03.000Z"));
        let t: Vec<f64> = tl.epochs.iter().map(|e| e.t_s).collect();
        assert_eq!(t, [0.0, 1.0, 7.0]);
        let e0 = &tl.epochs[0];
        let got: Vec<(&str, &str)> = e0
            .cn0
            .iter()
            .map(|s| (s.sat.as_str(), s.band.as_str()))
            .collect();
        assert_eq!(got, [("G05", "L1"), ("G05", "L5"), ("E11", "L1")]);
        assert_eq!(e0.agc, Some(3.0), "AgcDb averaged over the epoch's rows");
        assert!(
            e0.fix.is_some(),
            "the fix 200 ms later merges into this epoch"
        );
        assert_eq!(tl.epochs[1].agc, Some(10.0));
        assert!(tl.epochs[1].fix.is_none());
        let f2 = tl.epochs[2].fix.expect("fix-only epoch");
        assert!((f2.lat_deg - 69.4).abs() < 1e-12);
        assert!(tl.epochs[2].cn0.is_empty());
    }

    #[test]
    fn android_without_utc_groups_by_time_nanos() {
        let csv = "# Raw,TimeNanos,Svid,ConstellationType,Cn0DbHz\n\
                   Raw,5000000,3,1,40\nRaw,5000000,4,3,41\nRaw,1005000000,3,1,39\n";
        let tl = read_android(csv).expect("reads");
        assert_eq!(tl.epochs.len(), 2);
        assert_eq!(tl.epochs[1].t_s, 1.0);
        assert_eq!(tl.epochs[0].cn0[1].sat, "R04");
        assert_eq!(tl.start_label, None);
    }

    // ---- NMEA ----

    fn nmea(body: &str) -> String {
        format!("${body}*{:02X}", nmea_xor(body))
    }

    fn nmea_text() -> String {
        [
            nmea("GPRMC,091203.00,A,6918.0000,N,01600.0000,E,0.0,0.0,110924,,,A"),
            nmea("GPGGA,091203.00,6918.0000,N,01600.0000,E,1,08,0.9,100.0,M,30.0,M,,"),
            nmea("GPGSV,1,1,03,05,45,120,42,12,30,200,,40,10,20,33"),
            nmea("GLGSV,1,1,01,70,20,100,35,1"),
            // Same body with a wrong checksum: skipped and counted.
            "$GPGGA,091204.00,6918.0000,N,01600.0000,E,1,08,0.9,100.0,M,30.0,M,,*00".to_string(),
            nmea("GPGGA,091204.00,,,,,0,00,99.9,,,,,,"),
            nmea("GAGSV,1,1,01,11,40,10,39,7"),
            nmea("GPGSA,A,3,05,,,,,,,,,,,,1.0,0.9,0.5"),
            "hello world".to_string(),
        ]
        .join("\r\n")
    }

    #[test]
    fn nmea_gga_rmc_gsv_epochs() {
        let tl = read_nmea(&nmea_text()).expect("reads");
        assert_eq!(tl.epochs.len(), 2);
        assert_eq!(tl.observables, ["cn0", "fix"]);
        assert_eq!(tl.skipped_records, 2, "bad checksum + line without $");
        assert_eq!(tl.start_label.as_deref(), Some("2024-09-11T09:12:03.000Z"));
        let e0 = &tl.epochs[0];
        let got: Vec<(&str, &str, f64)> = e0
            .cn0
            .iter()
            .map(|s| (s.sat.as_str(), s.band.as_str(), s.cn0_dbhz))
            .collect();
        // PRN 12 has no SNR; PRN 40 is SBAS PRN 127 (S27); GLONASS 70 is slot R06.
        assert_eq!(
            got,
            [
                ("G05", "L1", 42.0),
                ("S27", "L1", 33.0),
                ("R06", "L1", 35.0)
            ]
        );
        let fix = e0.fix.expect("GGA quality 1");
        assert!((fix.lat_deg - 69.3).abs() < 1e-9);
        assert!((fix.lon_deg - 16.0).abs() < 1e-9);
        assert!(
            (fix.height_m - 130.0).abs() < 1e-9,
            "MSL + geoid separation"
        );
        assert_eq!(fix.n_used, Some(8));
        let e1 = &tl.epochs[1];
        assert_eq!(e1.t_s, 1.0);
        assert!(e1.fix.is_none(), "quality 0 is no fix");
        assert_eq!(e1.cn0[0].sat, "E11");
        assert_eq!(e1.cn0[0].band, "L1", "Galileo signal 7 is E1");
    }

    #[test]
    fn nmea_midnight_rollover() {
        let text = [
            nmea("GNRMC,235959.50,A,6918.0,N,01600.0,E,0,0,311224,,,A"),
            nmea("GNGGA,000000.50,6918.0,N,01600.0,E,1,05,1.0,10.0,M,,M,,"),
        ]
        .join("\n");
        let tl = read_nmea(&text).expect("reads");
        assert_eq!(tl.epochs.len(), 2);
        assert_eq!(tl.epochs[1].t_s, 1.0);
        assert_eq!(
            tl.epochs[1].time_label.as_deref(),
            Some("2025-01-01T00:00:00.500Z")
        );
        assert_eq!(tl.epochs[1].fix.map(|f| f.height_m), Some(10.0));
    }

    #[test]
    fn nmea_marine_sentences_attach_to_the_current_epoch() {
        let text = [
            nmea("GPGGA,100000.00,5430.0000,N,01830.0000,E,1,10,0.9,18.4,M,26.5,M,,"),
            nmea("GPRMC,100000.00,A,5430.0000,N,01830.0000,E,15.2,45.5,140625,,,A"),
            nmea("GPVTG,99.0,T,,M,9.9,N,18.3,K,A"),
            nmea("HEHDT,52.5,T"),
            nmea("VWVHW,52.5,T,,M,14.6,N,27.0,K"),
            nmea("GPZDA,100000.00,14,06,2025,00,00"),
            nmea("GPGGA,100001.00,5430.0000,N,01830.0000,E,0,00,,,M,,M,,"),
            nmea("GPRMC,100001.00,V,,,,,,,140625,,,N"),
        ]
        .join("\n");
        let tl = read_nmea(&text).expect("reads");
        assert_eq!(tl.epochs.len(), 2);
        let m = tl.epochs[0].marine.as_ref().unwrap();
        assert_eq!(m.fix_valid, Some(true));
        // RMC speed and course win over VTG's.
        assert_eq!((m.sog_kn, m.cog_deg), (Some(15.2), Some(45.5)));
        assert_eq!((m.heading_deg, m.stw_kn), (Some(52.5), Some(14.6)));
        assert_eq!(
            (m.alt_msl_m, m.geoid_sep_m, m.hdop),
            (Some(18.4), Some(26.5), Some(0.9))
        );
        assert_eq!(m.time_step_s, None);
        let m1 = tl.epochs[1].marine.as_ref().unwrap();
        assert_eq!(m1.fix_valid, Some(false), "GGA quality 0 and RMC V");
        assert_eq!(m1.time_step_s, Some(1.0));
        assert_eq!(m1.sog_kn, None);
    }

    #[test]
    fn nmea_vtg_ths_vbw_and_the_invalid_flags() {
        let text = [
            nmea("GPGGA,100000.00,5430.0000,N,01830.0000,E,1,10,0.9,18.4,M,26.5,M,,"),
            nmea("GPVTG,99.0,T,,M,9.9,N,18.3,K,A"),
            nmea("HETHS,52.5,V"),
            nmea("VWVBW,13.5,0.2,A,13.9,0.1,A"),
            nmea("GPGGA,100001.00,5430.0000,N,01830.0000,E,1,10,0.9,18.4,M,26.5,M,,"),
            nmea("GPVTG,99.0,T,,M,9.9,N,18.3,K,N"),
            nmea("HETHS,53.5,A"),
            nmea("VWVBW,13.5,0.2,V,13.9,0.1,A"),
        ]
        .join("\n");
        let tl = read_nmea(&text).expect("reads");
        let (a, b) = (
            tl.epochs[0].marine.as_ref().unwrap(),
            tl.epochs[1].marine.as_ref().unwrap(),
        );
        assert_eq!((a.sog_kn, a.cog_deg), (Some(9.9), Some(99.0)));
        assert_eq!(a.heading_deg, None, "THS mode V is not a heading");
        assert_eq!(a.stw_kn, Some(13.5));
        assert_eq!((b.sog_kn, b.cog_deg), (None, None), "VTG mode N");
        assert_eq!(b.heading_deg, Some(53.5));
        assert_eq!(b.stw_kn, None, "VBW status V");
    }

    #[test]
    fn nmea_time_step_flags_a_clock_that_disagrees_across_sentences() {
        // GGA at :00 and :01, but an RMC stamped :07 in between: the epoch at :01 opens
        // with a step of -6 s (back from :07) and the epoch at :07 with +7 s (from :00).
        let text = [
            nmea("GPGGA,100000.00,5430.0000,N,01830.0000,E,1,10,0.9,18.4,M,26.5,M,,"),
            nmea("GPRMC,100007.00,A,5430.0000,N,01830.0000,E,15.2,45.5,140625,,,A"),
            nmea("GPGGA,100001.00,5430.0000,N,01830.0000,E,1,10,0.9,18.4,M,26.5,M,,"),
        ]
        .join("\n");
        let tl = read_nmea(&text).expect("reads");
        let steps: Vec<Option<f64>> = tl
            .epochs
            .iter()
            .map(|e| e.marine.as_ref().and_then(|m| m.time_step_s))
            .collect();
        assert_eq!(steps, [None, Some(-6.0), Some(7.0)]);
    }

    #[test]
    fn nmea_osnma_status_sentence() {
        let text = [
            nmea("GPGGA,100000.00,5430.0000,N,01830.0000,E,1,10,0.9,18.4,M,26.5,M,,"),
            nmea("PKSOS,A"),
            nmea("GPGGA,100001.00,5430.0000,N,01830.0000,E,1,10,0.9,18.4,M,26.5,M,,"),
            nmea("PKSOS,F"),
            nmea("PKSOS,X"),
            nmea("GPGGA,100002.00,5430.0000,N,01830.0000,E,1,10,0.9,18.4,M,26.5,M,,"),
            nmea("PKSOS,A,E11:A,E19:F"),
        ]
        .join("\n");
        let tl = read_nmea(&text).expect("reads");
        assert_eq!(
            tl.epochs[0].marine.as_ref().unwrap().osnma,
            Some(OsnmaStatus::Authenticated)
        );
        assert_eq!(
            tl.epochs[1].marine.as_ref().unwrap().osnma,
            Some(OsnmaStatus::Failed)
        );
        assert_eq!(tl.skipped_records, 1, "unknown status");
        let m2 = tl.epochs[2].marine.as_ref().unwrap();
        assert_eq!(
            m2.sat_auth,
            [
                ("E11".to_string(), OsnmaStatus::Authenticated),
                ("E19".to_string(), OsnmaStatus::Failed)
            ]
        );
    }

    #[test]
    fn nmea_feed_in_cycles_gives_the_epochs_of_the_whole_text() {
        let text = nmea_text();
        let whole = read_nmea(&text).unwrap();
        let mut feed = NmeaFeed::new();
        let mut epochs = Vec::new();
        for line in text.lines() {
            feed.feed(line, Some(1.0));
            epochs.extend(feed.take_epochs());
        }
        // Taking after every line splits an epoch whose sentences arrive apart into two
        // pieces; taking at cycle ends (here: once at the end) matches the whole read.
        let mut feed = NmeaFeed::new();
        for line in text.lines() {
            feed.feed(line, None);
        }
        assert_eq!(feed.take_epochs(), whole.epochs);
        assert!(!epochs.is_empty());
    }

    #[test]
    fn ubx_sec_sig_v1_is_read_and_other_versions_are_skipped() {
        let sig = |ver: u8, jam: u8, spf: u8| {
            frame(CLASS_SEC, ID_SEC_SIG, &[ver, 0, 0, 0, jam, spf, 0, 0])
        };
        let mut bytes = Vec::new();
        bytes.extend(frame(CLASS_NAV, ID_NAV_PVT, &pvt(100_000, 1, 3)));
        // jamming enabled, state 2 (warning); spoofing enabled, state 2 (indicated).
        bytes.extend(sig(1, 0b101, 0b101));
        bytes.extend(frame(CLASS_NAV, ID_NAV_PVT, &pvt(101_000, 2, 3)));
        // Detectors disabled: the state bits are not a statement.
        bytes.extend(sig(1, 0b110, 0b1100));
        bytes.extend(frame(CLASS_NAV, ID_NAV_PVT, &pvt(102_000, 3, 3)));
        bytes.extend(sig(2, 0b101, 0b101));
        let tl = read_ubx(&bytes);
        let m = |i: usize| tl.epochs[i].marine.clone().unwrap_or_default();
        assert_eq!(
            (m(0).sec_jam_state, m(0).sec_spoof_state),
            (Some(2), Some(2))
        );
        assert_eq!(
            (m(1).sec_jam_state, m(1).sec_spoof_state),
            (Some(0), Some(0))
        );
        assert_eq!(m(2).sec_jam_state, None);
        assert_eq!(tl.skipped_records, 1, "layout version 2");
    }

    // ---- shared ----

    #[test]
    fn empty_logs_are_errors_from_read_log() {
        for fmt in [
            LogFormat::Ubx,
            LogFormat::Rinex,
            LogFormat::Android,
            LogFormat::Nmea,
        ] {
            let e = read_log(fmt, b"").expect_err("empty log");
            assert!(!e.is_empty());
        }
        let e = read_log(LogFormat::Nmea, b"just text\n").expect_err("no epochs");
        assert!(e.contains("no epochs"), "{e}");
        assert!(read_log(LogFormat::Ubx, &ubx_stream()).is_ok());
    }

    /// Deterministic pseudo-random bytes (a 64-bit linear congruential generator).
    fn lcg_bytes(seed: u64, n: usize, alphabet: &[u8]) -> Vec<u8> {
        let mut x = seed;
        (0..n)
            .map(|_| {
                x = x
                    .wrapping_mul(6_364_136_223_846_793_005)
                    .wrapping_add(1_442_695_040_888_963_407);
                let r = (x >> 33) as usize;
                if alphabet.is_empty() {
                    r as u8
                } else {
                    alphabet[r % alphabet.len()]
                }
            })
            .collect()
    }

    #[test]
    fn garbage_never_panics() {
        let text_alpha = b"$*,.0123456789ABCDEFGPNLRMCSVGA#Raw,Fix>\n\r -\xff\xc3";
        let ubx_alpha = [0xB5u8, 0x62, 0x01, 0x35, 0x07, 0x0A, 0x38, 0x00, 0x10, 0xFF];
        for seed in 0..200u64 {
            let any = lcg_bytes(seed, 600, &[]);
            let biased = lcg_bytes(seed ^ 0xABCD, 600, &ubx_alpha);
            let text = lcg_bytes(seed ^ 0x1234, 600, text_alpha);
            for fmt in [
                LogFormat::Ubx,
                LogFormat::Rinex,
                LogFormat::Android,
                LogFormat::Nmea,
            ] {
                for b in [&any, &biased, &text] {
                    let _ = read_log(fmt, b);
                }
            }
        }
        // Valid streams with spliced garbage still decode their good records.
        let mut s = lcg_bytes(7, 100, &ubx_alpha);
        s.extend(ubx_stream());
        assert_eq!(read_ubx(&s).epochs.len(), 2);
        let mut nm = String::from_utf8_lossy(&lcg_bytes(9, 300, text_alpha)).into_owned();
        nm.push('\n');
        nm.push_str(&nmea_text());
        assert!(read_nmea(&nm).is_ok());
    }
}
