// SPDX-License-Identifier: AGPL-3.0-only
//! A cursor over a bit sequence (`0`/`1` per element), most significant bit first, shared by
//! the correction decoders.

/// Reads unsigned and two's-complement fields in order. Every read is bounds-checked: past
/// the end it returns `None` and leaves the cursor where it was.
#[derive(Clone, Debug)]
pub struct Cursor<'a> {
    bits: &'a [u8],
    /// Next bit to read.
    pub pos: usize,
}

impl<'a> Cursor<'a> {
    /// A cursor at the start of `bits`.
    pub fn new(bits: &'a [u8]) -> Self {
        Self { bits, pos: 0 }
    }

    /// Bits not yet read.
    pub fn remaining(&self) -> usize {
        self.bits.len().saturating_sub(self.pos)
    }

    /// An unsigned field of `n` bits (at most 64).
    pub fn u(&mut self, n: usize) -> Option<u64> {
        if n > 64 || self.remaining() < n {
            return None;
        }
        let mut v = 0u64;
        for &b in &self.bits[self.pos..self.pos + n] {
            v = (v << 1) | u64::from(b & 1);
        }
        self.pos += n;
        Some(v)
    }

    /// A two's-complement field of `n` bits (2 to 64).
    pub fn i(&mut self, n: usize) -> Option<i64> {
        let v = self.u(n)?;
        Some(if n < 64 && (v >> (n - 1)) & 1 == 1 {
            v as i64 - (1i64 << n)
        } else {
            v as i64
        })
    }

    /// One bit as a flag.
    pub fn flag(&mut self) -> Option<bool> {
        self.u(1).map(|v| v == 1)
    }

    /// `n` raw bits.
    pub fn take(&mut self, n: usize) -> Option<Vec<u8>> {
        if self.remaining() < n {
            return None;
        }
        let v = self.bits[self.pos..self.pos + n].to_vec();
        self.pos += n;
        Some(v)
    }

    /// A two's-complement field scaled by `lsb`; the most negative code (the usual "data not
    /// available" sentinel) gives `Some(None)`.
    pub fn scaled_na(&mut self, n: usize, lsb: f64) -> Option<Option<f64>> {
        let v = self.i(n)?;
        Some(if v == -(1i64 << (n - 1)) {
            None
        } else {
            Some(v as f64 * lsb)
        })
    }

    /// A two's-complement field scaled by `lsb`, with no sentinel.
    pub fn scaled(&mut self, n: usize, lsb: f64) -> Option<f64> {
        self.i(n).map(|v| v as f64 * lsb)
    }
}

/// Bits of bytes, most significant bit first.
pub fn of_bytes(bytes: &[u8]) -> Vec<u8> {
    let mut out = Vec::with_capacity(bytes.len() * 8);
    for &b in bytes {
        for k in (0..8).rev() {
            out.push((b >> k) & 1);
        }
    }
    out
}

/// Bytes of bits (the last byte padded with zeros).
pub fn to_bytes(bits: &[u8]) -> Vec<u8> {
    let mut out = vec![0u8; bits.len().div_ceil(8)];
    for (i, &b) in bits.iter().enumerate() {
        out[i / 8] |= (b & 1) << (7 - i % 8);
    }
    out
}

/// Satellites of a mask, MSB first: the 1-based positions of the set bits.
pub fn set_positions(mask: &[u8]) -> Vec<u32> {
    mask.iter()
        .enumerate()
        .filter(|(_, b)| **b == 1)
        .map(|(i, _)| i as u32 + 1)
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn fields_signs_and_sentinels() {
        let b = of_bytes(&[0b1000_0000, 0b0111_1111, 0xFF]);
        let mut c = Cursor::new(&b);
        assert_eq!(c.scaled_na(4, 1.0), Some(None)); // 1000 = -8, the sentinel
        assert_eq!(c.i(4), Some(0));
        assert_eq!(c.i(8), Some(127));
        assert_eq!(c.i(3), Some(-1));
        assert_eq!(c.remaining(), 5);
        assert_eq!(c.u(6), None);
        assert_eq!(c.pos, 19);
        assert_eq!(c.u(5), Some(31));
        assert_eq!(to_bytes(&of_bytes(&[0xA5, 0x3C])), vec![0xA5, 0x3C]);
        assert_eq!(set_positions(&[0, 1, 1, 0, 1]), vec![2, 3, 5]);
    }
}
