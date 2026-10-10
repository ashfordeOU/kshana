// SPDX-License-Identifier: AGPL-3.0-only
//! MSB-first bit access (ICD section 2: bit 0 is the most significant bit,
//! transmitted first; padding is on the right).

/// Read `n` (<= 64) bits starting at bit offset `pos` of `data`, MSB first.
/// Returns `None` when the range runs past the end of `data`.
pub fn read_bits(data: &[u8], pos: usize, n: usize) -> Option<u64> {
    if n > 64 || pos.checked_add(n)? > data.len() * 8 {
        return None;
    }
    let mut v = 0u64;
    for i in pos..pos + n {
        v = (v << 1) | u64::from((data[i / 8] >> (7 - i % 8)) & 1);
    }
    Some(v)
}

/// Append the low `n` bits of `value` to a bit buffer, MSB first.
#[derive(Debug, Default, Clone)]
pub struct BitWriter {
    bytes: Vec<u8>,
    len: usize,
}

impl BitWriter {
    pub fn new() -> Self {
        Self::default()
    }

    /// Bits above the 64th of a wider run are zero (so `n > 64` zero-extends).
    pub fn push(&mut self, value: u64, n: usize) {
        for k in (0..n).rev() {
            if self.len % 8 == 0 {
                self.bytes.push(0);
            }
            let bit = if k < 64 { ((value >> k) & 1) as u8 } else { 0 };
            let last = self.bytes.len() - 1;
            self.bytes[last] |= bit << (7 - self.len % 8);
            self.len += 1;
        }
    }

    pub fn bit_len(&self) -> usize {
        self.len
    }

    pub fn into_bytes(self) -> Vec<u8> {
        self.bytes
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn reads_across_byte_boundaries() {
        let d = [0b1010_1100, 0b0101_0011];
        assert_eq!(read_bits(&d, 0, 4), Some(0b1010));
        assert_eq!(read_bits(&d, 6, 6), Some(0b00_0101));
        assert_eq!(read_bits(&d, 0, 16), Some(0xAC53));
        assert_eq!(read_bits(&d, 12, 5), None);
    }

    #[test]
    fn writer_round_trips() {
        let mut w = BitWriter::new();
        w.push(0b101, 3);
        w.push(0xAB, 8);
        assert_eq!(w.bit_len(), 11);
        let b = w.into_bytes();
        assert_eq!(read_bits(&b, 0, 3), Some(0b101));
        assert_eq!(read_bits(&b, 3, 8), Some(0xAB));
    }
}
