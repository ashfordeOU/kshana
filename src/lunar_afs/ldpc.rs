// SPDX-License-Identifier: AGPL-3.0-only
//! **The rate one-half low-density parity-check (LDPC) codes of the AFS FID0 frame.**
//!
//! LSIS V1.0 2.4.3.1.2: subframe 2 (1200 bits) and subframes 3 and 4 (870 bits, plus 10 zero
//! filler bits) are encoded with parity-check matrices `H = [[A, B, 0], [C, D, I]]` whose
//! submatrices [Annex1] prints as tables of the coordinates of their ones. The encoder is the
//! one the standard prescribes,
//!
//! ```text
//! p1 = B^-1 · A · s        p2 = C · s + D · p1        (mod 2)
//! ```
//!
//! and the broadcast word is `s` without its first `z` bits (`z` = 240 / 176, twice the
//! lifting factor) and without the filler bits, followed by `p1` and then as much of `p2` as
//! fills 2400 / 1740 symbols. The punctured positions are restored as erasures by the
//! receiver.
//!
//! The decoder ([`LdpcCode::decode_min_sum`]) is written from `H` alone: it never calls the
//! encoder and never touches `B^-1`, so the encoder and decoder agree only if the printed
//! `B^-1` really inverts the printed `B` and both are read the same way.

/// Which of the two FID0 codes.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Subframe {
    /// Subframe 2: 1200 information bits, 2400 broadcast symbols.
    Sb2,
    /// Subframes 3 and 4: 870 information bits (+10 filler), 1740 broadcast symbols.
    Sb34,
}

/// A sparse binary matrix as the coordinates of its ones.
#[derive(Clone, Debug)]
pub struct Sparse {
    /// Number of rows.
    pub rows: usize,
    /// Number of columns.
    pub cols: usize,
    /// Zero-based `(row, column)` of every one.
    pub ones: Vec<(u32, u32)>,
}

impl Sparse {
    /// Parse an [Annex1] index table (`row,column` per line, CR LF or LF endings).
    pub fn parse(text: &str, rows: usize, cols: usize) -> Result<Self, String> {
        let mut ones = Vec::new();
        for (n, line) in text.lines().enumerate() {
            let line = line.trim();
            if line.is_empty() {
                continue;
            }
            let (r, c) = line
                .split_once(',')
                .ok_or_else(|| format!("line {}: expected `row,column`", n + 1))?;
            let r: u32 = r
                .trim()
                .parse()
                .map_err(|e| format!("line {}: {e}", n + 1))?;
            let c: u32 = c
                .trim()
                .parse()
                .map_err(|e| format!("line {}: {e}", n + 1))?;
            if r as usize >= rows || c as usize >= cols {
                return Err(format!("line {}: ({r},{c}) outside {rows}x{cols}", n + 1));
            }
            ones.push((r, c));
        }
        Ok(Sparse { rows, cols, ones })
    }

    /// `M · x (mod 2)`.
    pub fn mul(&self, x: &[u8]) -> Vec<u8> {
        assert_eq!(x.len(), self.cols, "dimension mismatch");
        let mut y = vec![0u8; self.rows];
        for &(r, c) in &self.ones {
            y[r as usize] ^= x[c as usize] & 1;
        }
        y
    }
}

/// One FID0 LDPC code: its printed submatrices and puncturing.
#[derive(Clone, Debug)]
pub struct LdpcCode {
    /// Which subframe code.
    pub subframe: Subframe,
    /// Information bits carried (1200 or 870, CRC included).
    pub info_bits: usize,
    /// Systematic length `k` with filler (1200 or 880).
    pub k: usize,
    /// Rows of `A` / `B` (480 or 352).
    pub m1: usize,
    /// Rows of `C` / `D` (4560 or 3344).
    pub m2: usize,
    /// Punctured leading systematic bits `z` (240 or 176).
    pub z: usize,
    /// Broadcast symbols (2400 or 1740).
    pub n_tx: usize,
    /// Submatrix `A` (m1 x k).
    pub a: Sparse,
    /// Submatrix `B` (m1 x m1).
    pub b: Sparse,
    /// Submatrix `B^-1` (m1 x m1).
    pub b_inv: Sparse,
    /// Submatrix `C` (m2 x k).
    pub c: Sparse,
    /// Submatrix `D` (m2 x m1).
    pub d: Sparse,
}

/// Cache file names of the [Annex1] index tables of one code, in the order A, B, B^-1, C, D.
fn table_files(subframe: Subframe) -> [&'static str; 5] {
    match subframe {
        Subframe::Sb2 => [
            "003a_lunanet_sf2_ldpc_submatrix_a_ind.csv",
            "003b_lunanet_sf2_ldpc_submatrix_b_ind.csv",
            "003c_lunanet_sf2_ldpc_submatrix_b_inv_ind.csv",
            "003d_lunanet_sf2_ldpc_submatrix_c_ind.csv",
            "003e_lunanet_sf2_ldpc_submatrix_d_ind.csv",
        ],
        Subframe::Sb34 => [
            "003f_lunanet_sf3_ldpc_submatrix_a_ind.csv",
            "003g_lunanet_sf3_ldpc_submatrix_b_ind.csv",
            "003h_lunanet_sf3_ldpc_submatrix_b_inv_ind.csv",
            "003i_lunanet_sf3_ldpc_submatrix_c_ind.csv",
            "003j_lunanet_sf3_ldpc_submatrix_d_ind.csv",
        ],
    }
}

impl LdpcCode {
    /// Load the printed code of `subframe` from the verified LSIS cache
    /// ([`super::lsis`]); the tables are the standard's [Annex1] files, not redistributed.
    pub fn load(subframe: Subframe) -> Result<Self, String> {
        let (info_bits, k, m1, m2, z, n_tx) = match subframe {
            Subframe::Sb2 => (1200, 1200, 480, 4560, 240, 2400),
            Subframe::Sb34 => (870, 880, 352, 3344, 176, 1740),
        };
        let f = table_files(subframe);
        let p = |i: usize, r, c| -> Result<Sparse, String> {
            let text = super::lsis::read_verified_text(f[i])?;
            Sparse::parse(&text, r, c).map_err(|e| format!("{}: {e}", f[i]))
        };
        Ok(LdpcCode {
            subframe,
            info_bits,
            k,
            m1,
            m2,
            z,
            n_tx,
            a: p(0, m1, k)?,
            b: p(1, m1, m1)?,
            b_inv: p(2, m1, m1)?,
            c: p(3, m2, k)?,
            d: p(4, m2, m1)?,
        })
    }

    /// Codeword length `n = k + m1 + m2` (6240 or 4576).
    pub fn n(&self) -> usize {
        self.k + self.m1 + self.m2
    }

    /// The full codeword `(s; p1; p2)` of `info` (`info_bits` bits, CRC included); the
    /// filler bits are appended as zeros.
    pub fn encode_full(&self, info: &[u8]) -> Result<Vec<u8>, String> {
        if info.len() != self.info_bits {
            return Err(format!(
                "LDPC {:?}: {} information bits expected, {} given",
                self.subframe,
                self.info_bits,
                info.len()
            ));
        }
        let mut s = info.iter().map(|b| b & 1).collect::<Vec<u8>>();
        s.resize(self.k, 0);
        let p1 = self.b_inv.mul(&self.a.mul(&s));
        let cs = self.c.mul(&s);
        let dp = self.d.mul(&p1);
        let p2: Vec<u8> = cs.iter().zip(&dp).map(|(x, y)| x ^ y).collect();
        let mut cw = s;
        cw.extend_from_slice(&p1);
        cw.extend_from_slice(&p2);
        Ok(cw)
    }

    /// The codeword positions broadcast, in broadcast order.
    pub fn transmitted_positions(&self) -> Vec<usize> {
        let mut pos: Vec<usize> = (self.z..self.info_bits).collect();
        let parity_start = self.k;
        let remaining = self.n_tx - pos.len();
        pos.extend(parity_start..parity_start + remaining);
        debug_assert_eq!(pos.len(), self.n_tx);
        pos
    }

    /// The `n_tx` broadcast symbols of `info`.
    pub fn encode(&self, info: &[u8]) -> Result<Vec<u8>, String> {
        let cw = self.encode_full(info)?;
        Ok(self
            .transmitted_positions()
            .iter()
            .map(|&i| cw[i])
            .collect())
    }

    /// The parity-check matrix `H = [[A, B, 0], [C, D, I]]` as the ones of each row.
    pub fn h_rows(&self) -> Vec<Vec<u32>> {
        let mut rows = vec![Vec::new(); self.m1 + self.m2];
        for &(r, c) in &self.a.ones {
            rows[r as usize].push(c);
        }
        for &(r, c) in &self.b.ones {
            rows[r as usize].push(self.k as u32 + c);
        }
        for &(r, c) in &self.c.ones {
            rows[self.m1 + r as usize].push(c);
        }
        for &(r, c) in &self.d.ones {
            rows[self.m1 + r as usize].push(self.k as u32 + c);
        }
        for r in 0..self.m2 {
            rows[self.m1 + r].push((self.k + self.m1 + r) as u32);
        }
        rows
    }

    /// The number of unsatisfied checks of `H` on a full codeword.
    pub fn unsatisfied_checks(&self, codeword: &[u8]) -> usize {
        assert_eq!(codeword.len(), self.n());
        self.h_rows()
            .iter()
            .filter(|row| row.iter().fold(0u8, |a, &c| a ^ codeword[c as usize]) != 0)
            .count()
    }

    /// Decode broadcast-symbol log-likelihood ratios (positive favours logic 0, the LSIS-150
    /// +1.0 level) with normalised min-sum belief propagation on `H`. Punctured systematic
    /// and untransmitted parity positions start as erasures (zero); the filler bits start as
    /// known zeros. Returns the `info_bits` decoded information bits and whether every check
    /// of `H` was satisfied, after at most `max_iter` iterations.
    pub fn decode_min_sum(&self, llr_tx: &[f64], max_iter: usize) -> (Vec<u8>, bool) {
        assert_eq!(llr_tx.len(), self.n_tx);
        let n = self.n();
        let mut ch = vec![0.0f64; n];
        for (&p, &l) in self.transmitted_positions().iter().zip(llr_tx) {
            ch[p] = l;
        }
        for v in ch.iter_mut().take(self.k).skip(self.info_bits) {
            *v = 1.0e3; // filler bits are known zeros
        }
        let rows = self.h_rows();
        // Edge storage: check-to-variable messages per row entry.
        let mut c2v: Vec<Vec<f64>> = rows.iter().map(|r| vec![0.0; r.len()]).collect();
        let mut total = ch.clone();
        let mut hard = vec![0u8; n];
        const ALPHA: f64 = 0.75;
        for _ in 0..max_iter.max(1) {
            for (ri, row) in rows.iter().enumerate() {
                // variable-to-check = total minus this check's previous message
                let mut min1 = f64::INFINITY;
                let mut min2 = f64::INFINITY;
                let mut idx_min = usize::MAX;
                let mut sign = 1.0f64;
                let v2c: Vec<f64> = row
                    .iter()
                    .zip(&c2v[ri])
                    .map(|(&c, &m)| total[c as usize] - m)
                    .collect();
                for (j, &x) in v2c.iter().enumerate() {
                    let a = x.abs();
                    if x < 0.0 {
                        sign = -sign;
                    }
                    if a < min1 {
                        min2 = min1;
                        min1 = a;
                        idx_min = j;
                    } else if a < min2 {
                        min2 = a;
                    }
                }
                for (j, &x) in v2c.iter().enumerate() {
                    let mag = if j == idx_min { min2 } else { min1 };
                    let s = if x < 0.0 { -sign } else { sign };
                    let new = ALPHA * s * mag;
                    let col = row[j] as usize;
                    total[col] += new - c2v[ri][j];
                    c2v[ri][j] = new;
                }
            }
            for (h, &t) in hard.iter_mut().zip(&total) {
                *h = u8::from(t < 0.0);
            }
            if rows
                .iter()
                .all(|row| row.iter().fold(0u8, |a, &c| a ^ hard[c as usize]) == 0)
            {
                return (hard[..self.info_bits].to_vec(), true);
            }
        }
        (hard[..self.info_bits].to_vec(), false)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Internal: the printed tables have the dimensions of Figure 10 and the printed `B^-1`
    /// inverts the printed `B` over GF(2).
    #[test]
    fn printed_b_inverse_inverts_printed_b() {
        if !crate::lunar_afs::lsis::cache_present() {
            eprintln!("SKIP: {}", crate::lunar_afs::lsis::fetch_hint());
            return;
        }
        for sf in [Subframe::Sb2, Subframe::Sb34] {
            let code = LdpcCode::load(sf).unwrap();
            for col in 0..code.m1 {
                let mut e = vec![0u8; code.m1];
                e[col] = 1;
                assert_eq!(code.b.mul(&code.b_inv.mul(&e)), e, "{sf:?} column {col}");
            }
            assert_eq!(code.transmitted_positions().len(), code.n_tx);
        }
    }
}
