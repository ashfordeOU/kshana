// SPDX-License-Identifier: AGPL-3.0-only
//! Galileo E1-B I/NAV pages from a u-blox UBX byte stream (UBX-RXM-SFRBX).
//!
//! An SFRBX message for Galileo I/NAV holds eight little-endian 32-bit words. Taken
//! as a big-endian bit stream, the first 120 bits are the even half of a nominal page
//! and bits 128 to 247 the odd half, each followed by 8 bits of padding.
//!
//! SFRBX carries no time. Each page is stamped from the Galileo time inside its own
//! data (word types 5 and 0 carry week and time of week; in the test vectors these
//! equal the page's start label), and a page between two such anchors is accepted only
//! if the anchors agree with the number of pages received in between. Pages that cannot
//! be placed that way are dropped, never guessed. This time comes from the data itself,
//! so it gives no protection against replay: see the notes on time in `docs/OSNMA.md`.

use super::bits::read_bits;
use super::page::{InavPage, PAGE_BITS};
use super::WEEK_S;
use std::collections::BTreeMap;

const SYNC: [u8; 2] = [0xB5, 0x62];
const CLASS_RXM: u8 = 0x02;
const ID_SFRBX: u8 = 0x13;
const GNSS_GALILEO: u8 = 2;
const PAGE_BYTES: usize = PAGE_BITS / 8;

/// What the reader saw.
#[derive(Debug, Clone, Default, PartialEq, Eq)]
pub struct UbxStats {
    /// Frames with a valid checksum.
    pub frames: u32,
    /// Bytes skipped while looking for a frame (noise or a failed checksum).
    pub skipped_bytes: u32,
    /// Galileo I/NAV pages decoded from SFRBX frames.
    pub inav_pages: u32,
    /// SFRBX frames that were not E1-B nominal I/NAV (other systems, signals, alert pages).
    pub ignored_sfrbx: u32,
    /// Pages dropped because their CRC did not match.
    pub bad_crc: u32,
    /// Pages dropped because their time could not be established.
    pub unstamped: u32,
    /// Anchors that disagreed with the pages received since the previous anchor.
    pub time_conflicts: u32,
}

#[derive(Default)]
struct SatTime {
    /// Time label of the last anchor, in GST seconds.
    anchor: Option<i64>,
    /// Pages received since that anchor, not yet placed.
    pending: Vec<[u8; PAGE_BYTES]>,
}

/// Incremental reader: feed bytes as they arrive, take stamped pages out.
#[derive(Default)]
pub struct UbxReader {
    buf: Vec<u8>,
    sats: BTreeMap<u8, SatTime>,
    stats: UbxStats,
}

fn checksum(body: &[u8]) -> (u8, u8) {
    let (mut a, mut b) = (0u8, 0u8);
    for &x in body {
        a = a.wrapping_add(x);
        b = b.wrapping_add(a);
    }
    (a, b)
}

/// The time label a page carries, if its word type holds one.
fn anchor_of(page: &InavPage) -> Option<i64> {
    let w = page.data_word();
    let (wn, tow) = match w[0] >> 2 {
        5 => (read_bits(&w, 73, 12)?, read_bits(&w, 85, 20)?),
        0 if read_bits(&w, 6, 2)? == 2 => (read_bits(&w, 96, 12)?, read_bits(&w, 108, 20)?),
        _ => return None,
    };
    Some(wn as i64 * i64::from(WEEK_S) + tow as i64)
}

impl UbxReader {
    pub fn new() -> Self {
        Self::default()
    }

    pub fn stats(&self) -> &UbxStats {
        &self.stats
    }

    /// Add bytes; returns the pages that became placeable.
    pub fn feed(&mut self, bytes: &[u8]) -> Vec<InavPage> {
        self.buf.extend_from_slice(bytes);
        let mut out = Vec::new();
        let mut i = 0;
        while i + 8 <= self.buf.len() {
            if self.buf[i..i + 2] != SYNC {
                i += 1;
                self.stats.skipped_bytes += 1;
                continue;
            }
            let len = usize::from(u16::from_le_bytes([self.buf[i + 4], self.buf[i + 5]]));
            let end = i + 6 + len + 2;
            if end > self.buf.len() {
                break; // wait for the rest of the frame
            }
            let (a, b) = checksum(&self.buf[i + 2..i + 6 + len]);
            if (a, b) != (self.buf[end - 2], self.buf[end - 1]) {
                i += 1;
                self.stats.skipped_bytes += 1;
                continue;
            }
            self.stats.frames += 1;
            if self.buf[i + 2] == CLASS_RXM && self.buf[i + 3] == ID_SFRBX {
                let payload = self.buf[i + 6..i + 6 + len].to_vec();
                self.on_sfrbx(&payload, &mut out);
            }
            i = end;
        }
        self.buf.drain(..i);
        out
    }

    fn on_sfrbx(&mut self, p: &[u8], out: &mut Vec<InavPage>) {
        // gnssId, svId, sigId, freqId, numWords, chn, version, reserved, then words.
        if p.len() < 8 || p[0] != GNSS_GALILEO || usize::from(p[4]) != 8 || p.len() != 8 + 32 {
            self.stats.ignored_sfrbx += 1;
            return;
        }
        // E1-B (a receiver that predates signal ids reports 0). E5b I/NAV has no OSNMA.
        if p[2] > 1 {
            self.stats.ignored_sfrbx += 1;
            return;
        }
        let mut stream = [0u8; 32];
        for w in 0..8 {
            let dw = u32::from_le_bytes([p[8 + 4 * w], p[9 + 4 * w], p[10 + 4 * w], p[11 + 4 * w]]);
            stream[4 * w..4 * w + 4].copy_from_slice(&dw.to_be_bytes());
        }
        let mut bytes = [0u8; PAGE_BYTES];
        bytes[..15].copy_from_slice(&stream[..15]);
        bytes[15..].copy_from_slice(&stream[16..31]);
        // Even half first (flag 0), odd half second (flag 1), both nominal (type 0).
        if bytes[0] & 0xC0 != 0 || bytes[15] & 0xC0 != 0x80 {
            self.stats.ignored_sfrbx += 1;
            return;
        }
        let svid = p[1];
        let probe = InavPage::from_bytes(svid, 0, &bytes);
        if !probe.crc_ok() {
            self.stats.bad_crc += 1;
            return;
        }
        self.stats.inav_pages += 1;
        let sat = self.sats.entry(svid).or_default();
        let Some(a) = anchor_of(&probe) else {
            if sat.anchor.is_some() {
                sat.pending.push(bytes);
            } else {
                self.stats.unstamped += 1; // before the first anchor nothing can be placed
            }
            return;
        };
        if let Some(prev) = sat.anchor {
            let n = sat.pending.len() as i64;
            if a == prev + 2 * (n + 1) {
                for (j, b) in sat.pending.drain(..).enumerate() {
                    out.push(InavPage::from_bytes(
                        svid,
                        (prev + 2 * (j as i64 + 1)) as u32,
                        &b,
                    ));
                }
            } else {
                self.stats.time_conflicts += 1;
                self.stats.unstamped += sat.pending.len() as u32;
                sat.pending.clear();
            }
        }
        sat.anchor = Some(a);
        out.push(InavPage::from_bytes(svid, a as u32, &bytes));
    }
}

/// Read a whole UBX byte stream: all placeable pages in time order, with statistics.
pub fn pages_from_ubx(data: &[u8]) -> (Vec<InavPage>, UbxStats) {
    let mut r = UbxReader::new();
    let mut pages = r.feed(data);
    pages.sort_by_key(|p| (p.gst, p.svid));
    let mut stats = r.stats.clone();
    stats.unstamped += r.sats.values().map(|s| s.pending.len() as u32).sum::<u32>();
    (pages, stats)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::osnma::bits::BitWriter;

    const T0: u32 = 1248 * WEEK_S + 345_600 + 1;

    /// A nominal page whose word carries word type `wt`; word type 5 and 0 carry the
    /// time label `t`.
    fn page(svid: u8, wt: u8, t: u32, salt: u8) -> InavPage {
        let mut w = BitWriter::new(); // the 128-bit word
        w.push(u64::from(wt), 6);
        match wt {
            5 => {
                w.push(u64::from(salt), 67); // authenticated part: arbitrary
                w.push(u64::from(t / WEEK_S), 12);
                w.push(u64::from(t % WEEK_S), 20);
                w.push(0, 23);
            }
            0 => {
                w.push(2, 2);
                w.push(0, 88);
                w.push(u64::from(t / WEEK_S), 12);
                w.push(u64::from(t % WEEK_S), 20);
            }
            _ => {
                w.push(u64::from(salt), 8);
                w.push(0, 114);
            }
        }
        let word = w.into_bytes();
        let mut b = BitWriter::new();
        b.push(0, 2);
        for k in 0..112 {
            b.push(read_bits(&word, k, 1).unwrap(), 1);
        }
        b.push(0, 6);
        b.push(0b10, 2);
        for k in 0..16 {
            b.push(read_bits(&word, 112 + k, 1).unwrap(), 1);
        }
        b.push(0x12_3456_789A, 40);
        b.push(0, 240 - b.bit_len());
        InavPage::from_hex(svid, t, &hex::encode(b.into_bytes()))
            .unwrap()
            .with_valid_crc()
    }

    fn frame(class: u8, id: u8, payload: &[u8]) -> Vec<u8> {
        let mut f = vec![0xB5, 0x62, class, id];
        f.extend_from_slice(&(payload.len() as u16).to_le_bytes());
        f.extend_from_slice(payload);
        let (a, b) = checksum(&f[2..]);
        f.extend_from_slice(&[a, b]);
        f
    }

    fn sfrbx(p: &InavPage, gnss: u8, sig: u8) -> Vec<u8> {
        let mut stream = [0u8; 32];
        stream[..15].copy_from_slice(&p.bytes()[..15]);
        stream[16..31].copy_from_slice(&p.bytes()[15..]);
        let mut pl = vec![gnss, p.svid, sig, 0, 8, 0, 2, 0];
        for w in 0..8 {
            let be = u32::from_be_bytes(stream[4 * w..4 * w + 4].try_into().unwrap());
            pl.extend_from_slice(&be.to_le_bytes());
        }
        frame(CLASS_RXM, ID_SFRBX, &pl)
    }

    /// 20 pages of one satellite: word type 5 at index 3 and 18, type 0 anchors at 10.
    fn run(svid: u8) -> Vec<InavPage> {
        (0..20u32)
            .map(|i| {
                let t = T0 + 2 * i;
                let wt = match i {
                    3 | 18 => 5,
                    10 => 0,
                    _ => 1,
                };
                page(svid, wt, t, i as u8)
            })
            .collect()
    }

    #[test]
    fn pages_are_rebuilt_and_stamped_between_anchors() {
        let src = run(7);
        let bytes: Vec<u8> = src.iter().flat_map(|p| sfrbx(p, 2, 1)).collect();
        let (got, stats) = pages_from_ubx(&bytes);
        // Pages 0..2 precede the first anchor; 19 follows the last: not placeable.
        assert_eq!(got.len(), 16);
        assert_eq!(stats.unstamped, 3 + 1);
        for p in &got {
            let i = ((p.gst - T0) / 2) as usize;
            assert_eq!(p.bytes(), src[i].bytes(), "page {i}");
            assert_eq!(p.svid, 7);
        }
        assert_eq!(got.first().unwrap().gst, T0 + 6);
        assert_eq!(got.last().unwrap().gst, T0 + 36);
    }

    #[test]
    fn chunked_input_gives_the_same_pages() {
        let bytes: Vec<u8> = run(7).iter().flat_map(|p| sfrbx(p, 2, 1)).collect();
        let (whole, _) = pages_from_ubx(&bytes);
        let mut r = UbxReader::new();
        let mut got = Vec::new();
        for c in bytes.chunks(7) {
            got.extend(r.feed(c));
        }
        got.sort_by_key(|p| (p.gst, p.svid));
        assert_eq!(got, whole);
    }

    #[test]
    fn noise_other_systems_and_bad_pages_are_ignored() {
        let src = run(7);
        let mut bytes = vec![0x00, 0xB5, 0x13, 0x37]; // noise, a lone sync byte
        for (i, p) in src.iter().enumerate() {
            bytes.extend(sfrbx(p, 2, 1));
            match i {
                4 => bytes.extend(sfrbx(&page(9, 1, T0, 0), 0, 1)), // GPS id
                6 => bytes.extend(sfrbx(&page(9, 1, T0, 0), 2, 5)), // E5b signal
                8 => {
                    let mut bad = sfrbx(&page(7, 1, T0, 0), 2, 1);
                    let n = bad.len();
                    bad[n - 4] ^= 0x40; // corrupt a word: checksum fails
                    bytes.extend(bad);
                }
                _ => {}
            }
        }
        let (got, stats) = pages_from_ubx(&bytes);
        assert_eq!(got.len(), 16);
        assert!(stats.skipped_bytes >= 3);
        assert_eq!(stats.ignored_sfrbx, 2);
    }

    #[test]
    fn a_page_failing_its_crc_is_dropped_and_the_gap_is_not_guessed() {
        let mut src = run(7);
        // Page 12 has a valid frame checksum but a wrong page CRC.
        let mut raw = src[12].bytes().to_vec();
        raw[20] ^= 0x01;
        src[12] = InavPage::from_hex(7, src[12].gst, &hex::encode(raw)).unwrap();
        let bytes: Vec<u8> = src.iter().flat_map(|p| sfrbx(p, 2, 1)).collect();
        let (got, stats) = pages_from_ubx(&bytes);
        assert_eq!(stats.bad_crc, 1);
        // The anchors at 10 and 18 no longer agree with the pages in between.
        assert_eq!(stats.time_conflicts, 1);
        assert!(got.iter().all(|p| p.gst <= T0 + 20 || p.gst >= T0 + 36));
    }

    #[test]
    fn independent_satellites_are_tracked_separately() {
        let bytes: Vec<u8> = (0..20)
            .flat_map(|i| {
                let a = run(3);
                let b = run(11);
                [sfrbx(&a[i], 2, 1), sfrbx(&b[i], 2, 1)].concat()
            })
            .collect();
        let (got, _) = pages_from_ubx(&bytes);
        assert_eq!(got.iter().filter(|p| p.svid == 3).count(), 16);
        assert_eq!(got.iter().filter(|p| p.svid == 11).count(), 16);
    }
}
