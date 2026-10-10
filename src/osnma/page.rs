// SPDX-License-Identifier: AGPL-3.0-only
//! I/NAV nominal page (even + odd half, 240 bits) and its 40-bit OSNMA field.
//!
//! Plain page format (one page per line, `#` starts a comment):
//!
//! ```text
//! <svid> <gst_seconds> <60 hex digits>
//! ```
//!
//! `svid` is the Galileo satellite number, `gst_seconds` the Galileo System Time
//! (seconds since the GST epoch, week * 604800 + time of week) at the start of
//! the page, and the hex digits are the 240 page bits MSB first (even half then
//! odd half, tails and all), the layout used by the published test vectors.

use super::bits::read_bits;

/// Bits in a nominal I/NAV page pair (even + odd, 120 each).
pub const PAGE_BITS: usize = 240;
const ODD_START: usize = 120;
/// Offset of the OSNMA field inside the odd half: even/odd flag (1), page type
/// (1), data(2/2) (16).
const OSNMA_OFFSET: usize = ODD_START + 18;

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum PageError {
    BadHex,
    BadLength(usize),
    BadFields(String),
}

impl std::fmt::Display for PageError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Self::BadHex => write!(f, "page is not valid hex"),
            Self::BadLength(n) => write!(f, "page has {n} hex digits, expected 60"),
            Self::BadFields(s) => write!(f, "malformed page line: {s}"),
        }
    }
}

impl std::error::Error for PageError {}

/// One nominal I/NAV page pair received from one satellite.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct InavPage {
    pub svid: u8,
    /// GST seconds at the start of the page.
    pub gst: u32,
    bits: [u8; PAGE_BITS / 8],
}

impl InavPage {
    pub fn from_hex(svid: u8, gst: u32, hex_digits: &str) -> Result<Self, PageError> {
        if hex_digits.len() != PAGE_BITS / 4 {
            return Err(PageError::BadLength(hex_digits.len()));
        }
        let raw = hex::decode(hex_digits).map_err(|_| PageError::BadHex)?;
        let mut bits = [0u8; PAGE_BITS / 8];
        bits.copy_from_slice(&raw);
        Ok(Self { svid, gst, bits })
    }

    /// Parse one line of the plain page format; blank and comment lines give `None`.
    pub fn parse_line(line: &str) -> Result<Option<Self>, PageError> {
        let line = line.split('#').next().unwrap_or("").trim();
        if line.is_empty() {
            return Ok(None);
        }
        let mut it = line.split_whitespace();
        let (Some(s), Some(t), Some(h), None) = (it.next(), it.next(), it.next(), it.next()) else {
            return Err(PageError::BadFields(line.to_string()));
        };
        let svid = s
            .parse()
            .map_err(|_| PageError::BadFields(line.to_string()))?;
        let gst = t
            .parse()
            .map_err(|_| PageError::BadFields(line.to_string()))?;
        Self::from_hex(svid, gst, h).map(Some)
    }

    /// The raw page bits.
    pub fn bytes(&self) -> &[u8] {
        &self.bits
    }

    /// The 40-bit OSNMA field of the odd half.
    pub fn osnma_field(&self) -> u64 {
        read_bits(&self.bits, OSNMA_OFFSET, 40).unwrap_or(0)
    }

    /// The 8-bit HKROOT section (first byte of the field).
    pub fn hkroot_section(&self) -> u8 {
        (self.osnma_field() >> 32) as u8
    }

    /// The 32-bit MACK section (last four bytes of the field).
    pub fn mack_section(&self) -> u32 {
        (self.osnma_field() & 0xFFFF_FFFF) as u32
    }

    /// Receivers must discard an all-zero OSNMA field (Receiver Guidelines, section 3).
    pub fn has_osnma(&self) -> bool {
        self.osnma_field() != 0
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Synthetic page: only the OSNMA field carries a non-zero pattern.
    pub(crate) fn synth(svid: u8, gst: u32, field: u64) -> InavPage {
        let mut w = super::super::bits::BitWriter::new();
        w.push(0, ODD_START);
        w.push(0b10, 2);
        w.push(0, 16);
        w.push(field, 40);
        w.push(0, PAGE_BITS - w.bit_len());
        InavPage::from_hex(svid, gst, &hex::encode(w.into_bytes())).unwrap()
    }

    #[test]
    fn field_split_is_8_plus_32() {
        let p = synth(2, 0, 0x72_7A12_5EE9);
        assert_eq!(p.osnma_field(), 0x72_7A12_5EE9);
        assert_eq!(p.hkroot_section(), 0x72);
        assert_eq!(p.mack_section(), 0x7A12_5EE9);
        assert!(p.has_osnma());
        assert!(!synth(2, 0, 0).has_osnma());
    }

    #[test]
    fn parses_plain_lines() {
        let line = format!("5 1234 {}", "00".repeat(30));
        let p = InavPage::parse_line(&line).unwrap().unwrap();
        assert_eq!((p.svid, p.gst), (5, 1234));
        assert_eq!(InavPage::parse_line("  # note").unwrap(), None);
        assert!(InavPage::parse_line("5 1234 ab").is_err());
        assert!(InavPage::parse_line("5 x 00").is_err());
    }
}
