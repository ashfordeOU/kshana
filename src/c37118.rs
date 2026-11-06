// SPDX-License-Identifier: AGPL-3.0-only
//! IEEE C37.118.2 synchrophasor streams: the time-sync health of grid PMUs (roadmap A2c, power grid).
//!
//! A phasor measurement unit (PMU) time-stamps the grid from a GNSS-disciplined clock and reports, in
//! every data frame, whether it is in sync and how good its time is. This module reads those reports;
//! it does not decode the phasor, frequency, analogue or digital values beyond stepping over them.
//!
//! Frames: `SYNC` (`0xAA`, then frame type and version), `FRAMESIZE`, `IDCODE`, `SOC` (UNIX seconds),
//! `FRACSEC` (high byte: leap-second flags and the message time-quality code; low 24 bits: the
//! fraction of a second in units of the configuration's `TIME_BASE`), the body, and `CHK`, a CRC-CCITT
//! (polynomial 0x1021, initial 0xFFFF) over everything before it. A frame whose CRC fails is counted
//! and skipped. A data frame can only be read after a configuration frame (type 2, CFG-2) has given
//! each PMU's channel counts and number formats; data frames before one are counted, not read.
//!
//! Per PMU in a data frame, the `STAT` word: bits 15–14 data error, bit 13 PMU sync error (1 = not in
//! sync with UTC), bit 12 sorting, bit 11 trigger, bit 10 configuration change, bit 9 data modified,
//! bits 8–6 PMU time quality, bits 5–4 unlocked time, bits 3–0 trigger reason.
//!
//! The field layout is taken from the BSD-licensed open-source pyPMU (`synchrophasor/frame.py`,
//! iicsys/pypmu; BSD 3-Clause), from its frame *encoder*. Its status *decoder* reads the sync bit and
//! the time-quality field differently from its own encoder, and the encoder agrees with public
//! descriptions of the standard, so the encoder is followed. No text of IEEE C37.118 is reproduced.
//!
//! MODELLED: checked against frames built by an independent encoder (`tests/c37118.rs`); no public PMU
//! capture with a clear licence has been found yet.
use serde::Serialize;

/// CRC-CCITT (polynomial 0x1021, initial 0xFFFF), as C37.118 uses for `CHK`.
pub fn crc_ccitt(data: &[u8]) -> u16 {
    let mut crc: u16 = 0xFFFF;
    for &b in data {
        crc ^= u16::from(b) << 8;
        for _ in 0..8 {
            crc = if crc & 0x8000 != 0 {
                (crc << 1) ^ 0x1021
            } else {
                crc << 1
            };
        }
    }
    crc
}

/// One PMU's channel layout from a CFG-2 frame.
#[derive(Clone, Debug, PartialEq, Eq, Serialize)]
pub struct PmuConfig {
    /// Station name.
    pub station: String,
    /// PMU id code.
    pub id: u16,
    /// Phasors are floating point (else 16-bit integers).
    pub phasor_float: bool,
    /// Analogues are floating point.
    pub analog_float: bool,
    /// Frequency and its rate are floating point.
    pub freq_float: bool,
    /// Number of phasors.
    pub phasors: u16,
    /// Number of analogues.
    pub analogs: u16,
    /// Number of 16-bit digital status words.
    pub digitals: u16,
}

impl PmuConfig {
    fn block_len(&self) -> usize {
        let ph = if self.phasor_float { 8 } else { 4 };
        let fr = if self.freq_float { 4 } else { 2 };
        let an = if self.analog_float { 4 } else { 2 };
        2 + ph * self.phasors as usize
            + 2 * fr
            + an * self.analogs as usize
            + 2 * self.digitals as usize
    }
}

/// A CFG-2 frame.
#[derive(Clone, Debug, PartialEq, Eq, Serialize)]
pub struct Config {
    /// Fractions per second of `FRACSEC`.
    pub time_base: u32,
    /// PMUs in each data frame, in order.
    pub pmus: Vec<PmuConfig>,
}

/// One PMU's time report in one data frame.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct TimeReport {
    /// UNIX time of the measurement (s), from `SOC` and `FRACSEC`.
    pub t_unix_s: f64,
    /// PMU id code.
    pub pmu: u16,
    /// Bit 13 of `STAT`: the PMU is not in sync with UTC.
    pub sync_error: bool,
    /// Bits 8–6 of `STAT`: PMU time quality code (0 not used; 1 < 100 ns ... 7 > 10 ms).
    pub pmu_time_quality: u8,
    /// Bits 5–4 of `STAT`: how long the clock has been unlocked (0 < 10 s, 1 < 100 s, 2 < 1000 s,
    /// 3 > 1000 s).
    pub unlocked: u8,
    /// Bits 15–14 of `STAT`: data error (0 good).
    pub data_error: u8,
    /// Message time quality from `FRACSEC` (0 locked to UTC; 0xF fault; else the clock's error class).
    pub msg_time_quality: u8,
    /// Leap second pending (FRACSEC flag).
    pub leap_pending: bool,
}

/// What a stream held.
#[derive(Clone, Debug, Default, Serialize)]
pub struct Stream {
    /// The last configuration read.
    pub config: Option<Config>,
    /// Time reports, one per PMU per data frame, in stream order.
    pub reports: Vec<TimeReport>,
    /// Frames whose CRC failed.
    pub bad_crc: usize,
    /// Data frames seen before any configuration frame (not readable).
    pub data_without_config: usize,
    /// Data frames whose size does not match the configuration.
    pub size_mismatch: usize,
    /// Valid frames of other types (header, command, CFG-1, CFG-3).
    pub other: usize,
}

fn u16_at(b: &[u8], i: usize) -> u16 {
    u16::from_be_bytes([b[i], b[i + 1]])
}

fn u32_at(b: &[u8], i: usize) -> u32 {
    u32::from_be_bytes([b[i], b[i + 1], b[i + 2], b[i + 3]])
}

fn read_cfg2(f: &[u8]) -> Option<Config> {
    let mut i = 14;
    let time_base = u32_at(f, i) & 0x00FF_FFFF;
    i += 4;
    let n = u16_at(f, i) as usize;
    i += 2;
    let mut pmus = Vec::with_capacity(n);
    for _ in 0..n {
        let station = String::from_utf8_lossy(f.get(i..i + 16)?)
            .trim_end()
            .to_string();
        i += 16;
        let id = u16_at(f, i);
        let fmt = u16_at(f, i + 2);
        let (ph, an, dg) = (u16_at(f, i + 4), u16_at(f, i + 6), u16_at(f, i + 8));
        i += 10;
        // Channel names (16 bytes each; 16 per digital word), then the unit words, FNOM and CFGCNT.
        i += 16 * (ph as usize + an as usize + 16 * dg as usize);
        i += 4 * (ph as usize + an as usize + dg as usize);
        i += 4;
        if i > f.len() {
            return None;
        }
        pmus.push(PmuConfig {
            station,
            id,
            phasor_float: fmt & 0b10 != 0,
            analog_float: fmt & 0b100 != 0,
            freq_float: fmt & 0b1000 != 0,
            phasors: ph,
            analogs: an,
            digitals: dg,
        });
    }
    (time_base > 0).then_some(Config { time_base, pmus })
}

/// Read a capture of C37.118.2 frames (concatenated, as a TCP stream or a dump of UDP payloads).
pub fn read_stream(bytes: &[u8]) -> Stream {
    let mut out = Stream::default();
    let mut i = 0;
    while i + 16 <= bytes.len() {
        if bytes[i] != 0xAA {
            i += 1;
            continue;
        }
        let ftype = (bytes[i + 1] >> 4) & 0x7;
        let size = u16_at(bytes, i + 2) as usize;
        if size < 16 || i + size > bytes.len() {
            i += 1;
            continue;
        }
        let f = &bytes[i..i + size];
        if crc_ccitt(&f[..size - 2]) != u16_at(f, size - 2) {
            out.bad_crc += 1;
            i += 1;
            continue;
        }
        match ftype {
            3 => {
                if let Some(c) = read_cfg2(f) {
                    out.config = Some(c);
                } else {
                    out.other += 1;
                }
            }
            0 => match &out.config {
                None => out.data_without_config += 1,
                Some(c) => {
                    let want = 14 + c.pmus.iter().map(PmuConfig::block_len).sum::<usize>() + 2;
                    if want != size {
                        out.size_mismatch += 1;
                    } else {
                        let soc = u32_at(f, 6);
                        let fracsec = u32_at(f, 10);
                        let flags = (fracsec >> 24) as u8;
                        let t = soc as f64 + (fracsec & 0x00FF_FFFF) as f64 / c.time_base as f64;
                        let mut k = 14;
                        for p in &c.pmus {
                            let stat = u16_at(f, k);
                            out.reports.push(TimeReport {
                                t_unix_s: t,
                                pmu: p.id,
                                sync_error: stat & 0x2000 != 0,
                                pmu_time_quality: ((stat >> 6) & 0x7) as u8,
                                unlocked: ((stat >> 4) & 0x3) as u8,
                                data_error: (stat >> 14) as u8,
                                msg_time_quality: flags & 0x0F,
                                leap_pending: flags & 0x10 != 0,
                            });
                            k += p.block_len();
                        }
                    }
                }
            },
            _ => out.other += 1,
        }
        i += size;
    }
    out
}

/// One interval in which a PMU reported a sync error.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct SyncLoss {
    /// PMU id code.
    pub pmu: u16,
    /// First report with the sync error (UNIX s).
    pub from_unix_s: f64,
    /// Last report with the sync error (UNIX s).
    pub to_unix_s: f64,
    /// Reports in the interval.
    pub reports: usize,
}

/// The intervals of consecutive sync-error reports, per PMU, in time order.
pub fn sync_losses(reports: &[TimeReport]) -> Vec<SyncLoss> {
    let mut pmus: Vec<u16> = reports.iter().map(|r| r.pmu).collect();
    pmus.sort_unstable();
    pmus.dedup();
    let mut out = Vec::new();
    for p in pmus {
        let mut cur: Option<SyncLoss> = None;
        for r in reports.iter().filter(|r| r.pmu == p) {
            match (&mut cur, r.sync_error) {
                (Some(c), true) => {
                    c.to_unix_s = r.t_unix_s;
                    c.reports += 1;
                }
                (None, true) => {
                    cur = Some(SyncLoss {
                        pmu: p,
                        from_unix_s: r.t_unix_s,
                        to_unix_s: r.t_unix_s,
                        reports: 1,
                    })
                }
                (Some(_), false) => out.extend(cur.take()),
                (None, false) => {}
            }
        }
        out.extend(cur);
    }
    out
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn crc_matches_the_ccitt_false_check_value() {
        // CRC-16/CCITT-FALSE of "123456789" is 0x29B1.
        assert_eq!(crc_ccitt(b"123456789"), 0x29B1);
    }

    #[test]
    fn sync_losses_group_consecutive_errors() {
        let r = |t: f64, e: bool| TimeReport {
            t_unix_s: t,
            pmu: 7,
            sync_error: e,
            pmu_time_quality: 0,
            unlocked: 0,
            data_error: 0,
            msg_time_quality: 0,
            leap_pending: false,
        };
        let v = vec![
            r(0.0, false),
            r(1.0, true),
            r(2.0, true),
            r(3.0, false),
            r(4.0, true),
        ];
        let l = sync_losses(&v);
        assert_eq!(l.len(), 2);
        assert_eq!(
            (l[0].from_unix_s, l[0].to_unix_s, l[0].reports),
            (1.0, 2.0, 2)
        );
        assert_eq!((l[1].from_unix_s, l[1].reports), (4.0, 1));
    }
}
