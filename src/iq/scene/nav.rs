// SPDX-License-Identifier: AGPL-3.0-only
//! Navigation data bits modulated onto a scene satellite's code.
//!
//! Bit `n` of a satellite covers transmit times `[n, n + 1) * bit period` counted from the
//! start of the 30 s LNAV frame that contains the scene start, so bit edges fall on code
//! epochs as IS-GPS-200 requires (20 C/A periods per bit). The bit sign convention matches
//! the chips: data bit `0 -> +1`, `1 -> -1`.

use crate::gps_lnav::{
    data_words, encode_subframe, encode_subframes, LnavConventions, LnavEphemeris,
};
use crate::rinex::RinexEphemeris;
use rand::RngCore;
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;

/// LNAV data rate period (s): 50 bit/s.
pub const LNAV_BIT_S: f64 = 0.02;
/// Bits in one LNAV frame (five 300-bit subframes, 30 s).
pub const LNAV_FRAME_BITS: usize = 1500;
/// Seconds in one GPS week.
const WEEK_S: f64 = 604_800.0;

/// The data a satellite modulates onto its code.
#[derive(Clone, Debug, PartialEq)]
pub enum NavData {
    /// No data: every bit `+1` (a pilot, or a data-wiped test signal).
    None,
    /// GPS LNAV encoded by [`crate::gps_lnav`]: subframes 1 to 3 carry this ephemeris and
    /// the hand-over-word time of week of the transmit time; subframes 4 and 5 carry a
    /// valid TLM and HOW (subframe IDs 4 and 5) and **zero data words** with correct parity.
    /// MODELLED: no almanac, ionosphere or UTC pages are sent, so a receiver can decode
    /// ephemeris and time from the scene but not an almanac.
    Lnav {
        /// The ephemeris subframes 1 to 3 carry.
        eph: Box<LnavEphemeris>,
        /// The operator fields IS-GPS-200 leaves open.
        conv: LnavConventions,
    },
    /// Seeded pseudo-random bits at 50 bit/s (ChaCha8 stream of `seed`). MODELLED: random
    /// data with LNAV timing, not a decodable message.
    Seeded {
        /// Seed of the bit stream.
        seed: u64,
    },
}

/// The LNAV ephemeris fields of a RINEX broadcast record (`toc` as GPS time of week, the
/// IODE, IODC, health and codes-on-L2 fields as integers).
pub fn lnav_from_rinex(e: &RinexEphemeris) -> LnavEphemeris {
    LnavEphemeris {
        week: e.gps_week.max(0.0) as u32,
        toc_s: e.toc.gps_time_of_week(),
        toe_s: e.toe,
        iodc: e.iodc.max(0.0) as u32,
        iode: e.iode.max(0.0) as u32,
        af0: e.af0,
        af1: e.af1,
        af2: e.af2,
        tgd: e.tgd,
        crs: e.crs,
        delta_n: e.delta_n,
        m0: e.m0,
        cuc: e.cuc,
        e: e.e,
        cus: e.cus,
        sqrt_a: e.sqrt_a,
        cic: e.cic,
        omega0: e.omega0,
        cis: e.cis,
        i0: e.i0,
        crc: e.crc,
        omega: e.omega,
        omega_dot: e.omega_dot,
        idot: e.idot,
        health: e.sv_health.max(0.0) as u32,
        code_on_l2: e.data_sources.max(0.0) as u32,
    }
}

/// The 1500 transmitted bits (`0`/`1`) of the LNAV frame starting at GPS time of week
/// `frame_start_tow_s` (a multiple of 30 s), every subframe following a word whose last two
/// bits are zero (words 2 and 10 are parity-solved, so this holds across frames).
pub fn lnav_frame_bits(
    eph: &LnavEphemeris,
    conv: &LnavConventions,
    frame_start_tow_s: f64,
) -> Result<Vec<u8>, String> {
    let start = frame_start_tow_s.rem_euclid(WEEK_S);
    // The HOW carries the count of the NEXT subframe's start (IS-GPS-200 20.3.3.2).
    let count = ((start / 6.0).round() as u32 + 1) % 100_800;
    let sf123 = encode_subframes(eph, conv, count, 0)?;
    let template = data_words(eph, conv, count)?;
    let mut words: Vec<u32> = sf123.iter().flatten().copied().collect();
    let mut prev = sf123[2][9];
    for sf in 4..=5u32 {
        let mut data = [0u32; 10];
        data[0] = template[0][0];
        let tow = (count + sf - 1) % 100_800;
        data[1] =
            (tow << 7) | ((conv.alert as u32) << 6) | ((conv.anti_spoof as u32) << 5) | (sf << 2);
        let enc = encode_subframe(&data, prev);
        prev = enc[9];
        words.extend_from_slice(&enc);
    }
    let mut bits = Vec::with_capacity(LNAV_FRAME_BITS);
    for w in words {
        for i in (0..30).rev() {
            bits.push(((w >> i) & 1) as u8);
        }
    }
    Ok(bits)
}

/// A contiguous run of bit signs (`±1.0`) starting at bit index `first`, read-only during
/// sample synthesis.
#[derive(Clone, Debug, Default)]
pub(crate) struct BitWindow {
    pub first: i64,
    pub signs: Vec<f64>,
}

impl BitWindow {
    /// Sign of bit `n` (`+1` outside the window, which the caller sizes to avoid).
    #[inline]
    pub fn sign(&self, n: i64) -> f64 {
        let i = n - self.first;
        if i >= 0 && (i as usize) < self.signs.len() {
            self.signs[i as usize]
        } else {
            1.0
        }
    }
}

/// Per-satellite bit state: the source data plus a cache of encoded LNAV frames.
pub(crate) struct NavState {
    data: NavData,
    /// GPS time of week at which bit 0 starts (a frame boundary).
    frame0_tow_s: f64,
    frames: Vec<(i64, Vec<u8>)>,
}

impl NavState {
    pub fn new(data: NavData, frame0_tow_s: f64) -> Self {
        Self {
            data,
            frame0_tow_s,
            frames: Vec::new(),
        }
    }

    fn frame(&mut self, f: i64) -> Result<&[u8], String> {
        if let Some(pos) = self.frames.iter().position(|(k, _)| *k == f) {
            return Ok(&self.frames[pos].1);
        }
        let NavData::Lnav { eph, conv } = &self.data else {
            return Err("not an LNAV source".into());
        };
        let bits = lnav_frame_bits(eph.as_ref(), conv, self.frame0_tow_s + 30.0 * f as f64)?;
        // Keep the two most recent frames: a chunk spans at most a bit or two.
        if self.frames.len() >= 2 {
            self.frames.remove(0);
        }
        self.frames.push((f, bits));
        Ok(&self.frames.last().expect("just pushed").1)
    }

    /// The signs of bits `first ..= last`.
    pub fn window(&mut self, first: i64, last: i64) -> Result<BitWindow, String> {
        let n = (last - first + 1).max(0) as usize;
        let signs = match self.data.clone() {
            NavData::None => vec![1.0; n],
            NavData::Seeded { seed } => {
                // Two 32-bit words per bit from a fixed stream position, so a bit's value
                // depends only on (seed, n), never on how the scene was chunked.
                let mut rng = ChaCha8Rng::seed_from_u64(seed);
                let base = (first as i128 + (1i128 << 62)) as u128;
                rng.set_word_pos(base * 2);
                (0..n)
                    .map(|_| if rng.next_u64() & 1 == 0 { 1.0 } else { -1.0 })
                    .collect()
            }
            NavData::Lnav { .. } => {
                let mut v = Vec::with_capacity(n);
                for b in first..=last {
                    let f = b.div_euclid(LNAV_FRAME_BITS as i64);
                    let i = b.rem_euclid(LNAV_FRAME_BITS as i64) as usize;
                    let bit = self.frame(f)?[i];
                    v.push(if bit == 0 { 1.0 } else { -1.0 });
                }
                v
            }
        };
        Ok(BitWindow { first, signs })
    }
}
