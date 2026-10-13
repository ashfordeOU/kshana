// SPDX-License-Identifier: AGPL-3.0-only
//! A pure-Rust writer and reader for NAIF SPICE Spacecraft and Planet Kernel (SPK) segments of
//! type 9 (Lagrange interpolation, unequal time steps) and type 13 (Hermite interpolation,
//! unequal time steps), and an export of CCSDS Orbit Ephemeris Messages to such kernels.
//!
//! Written from the public NAIF "DAF Required Reading" and "SPK Required Reading" documents and
//! the algorithm descriptions of the SPICE Toolkit; no SPICE code is linked or copied. The
//! writer lays the Double precision Array File (DAF) out as the Toolkit's own writer does
//! (file record, reserved comment records, summary and name records, contiguous data), so a
//! kernel written here is byte-for-byte the kernel SPICE writes from the same inputs; the
//! reader evaluates a segment with the Toolkit's window selection and interpolation order.
//! Both claims are judged against the Toolkit in `tests/spk_writer_spice_oracle.rs`.
//!
//! Layout as written (addresses are 1-based 8-byte words, records 1024 bytes):
//! * record 1, the file record: `DAF/SPK `, ND = 2, NI = 6, the 60-character internal file name,
//!   the first and last summary records and the first free address, `LTL-IEEE`, and the FTP
//!   validation string;
//! * `R` reserved records for comments, `R = (ncomch - 1) / 1000 + 1` (none when `ncomch` is 0):
//!   comment lines with trailing blanks removed, each ended by NUL, the text ended by EOT (0x04);
//! * a summary record (next, previous, count, then up to 25 summaries of 5 doubles: start and
//!   end ET, then body, centre, frame, type, first and last address packed as six i32) followed
//!   by its name record (40-character names, blank-padded); a full summary record is followed
//!   at once by an empty one placed after the data;
//! * each segment: the N states (x, y, z, vx, vy, vz; km, km/s), the N epochs (TDB seconds past
//!   J2000), the epoch directory (every 100th epoch), then the degree (type 9) or the window
//!   size minus one (type 13, window `(degree + 1) / 2`), then N.
//!
//! Character records are written as 1000 characters, so their last 24 bytes are zero here, and
//! the file ends at the last byte written (after a name record it is not a whole record).

use crate::naif_kernel::DafFile;

/// Words per DAF record.
const NWD: usize = 128;
/// Summary size, doubles (ND = 2, NI = 6).
const SS: usize = 5;
/// Summaries per summary record.
const MAX_SUM: usize = 25;
/// Characters in a comment or name record.
const NCHAR: usize = 1000;

/// SPK interpolation type.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum SpkType {
    /// Type 9: Lagrange, unequal steps; each component interpolated on its own.
    Lagrange9,
    /// Type 13: Hermite, unequal steps; position and velocity interpolated together.
    Hermite13,
}

impl SpkType {
    /// The SPK type number.
    pub fn code(&self) -> i32 {
        match self {
            SpkType::Lagrange9 => 9,
            SpkType::Hermite13 => 13,
        }
    }
}

/// The NAIF integer code of a supported inertial frame name (`J2000`, `EME2000`, `ECLIPJ2000`).
pub fn frame_code(name: &str) -> Result<i32, String> {
    match name.trim().to_ascii_uppercase().as_str() {
        "J2000" | "EME2000" => Ok(1),
        "ECLIPJ2000" => Ok(17),
        "B1950" => Ok(2),
        "FK4" => Ok(3),
        other => Err(format!("frame {other:?} has no supported NAIF code")),
    }
}

/// One type 9 or type 13 segment.
#[derive(Clone, Debug, PartialEq)]
pub struct SpkSegment {
    /// NAIF id of the target body.
    pub target: i32,
    /// NAIF id of the centre.
    pub centre: i32,
    /// NAIF frame code (1 = J2000, 17 = ECLIPJ2000).
    pub frame: i32,
    /// Interpolation type.
    pub kind: SpkType,
    /// Polynomial degree, 1..=27 (odd for type 13).
    pub degree: usize,
    /// Descriptor start, TDB seconds past J2000.
    pub start: f64,
    /// Descriptor end.
    pub end: f64,
    /// Segment name: printable ASCII, at most 40 characters.
    pub name: String,
    /// Epochs, strictly increasing, covering `[start, end]`.
    pub epochs: Vec<f64>,
    /// States at the epochs: km and km/s.
    pub states: Vec<[f64; 6]>,
}

impl SpkSegment {
    /// The interpolation window size.
    pub fn window(&self) -> usize {
        match self.kind {
            SpkType::Lagrange9 => self.degree + 1,
            SpkType::Hermite13 => self.degree.div_ceil(2),
        }
    }

    /// Check the segment as the SPICE writers do.
    pub fn validate(&self) -> Result<(), String> {
        let n = self.epochs.len();
        let name = self.name.trim_end_matches(' ');
        if name.len() > 40 {
            return Err(format!("segment name longer than 40 characters: {name:?}"));
        }
        if name.bytes().any(|b| !(32..=126).contains(&b)) {
            return Err(format!(
                "segment name has non-printing characters: {name:?}"
            ));
        }
        if !(1..=27).contains(&self.degree) {
            return Err(format!("degree {} outside 1..=27", self.degree));
        }
        if self.kind == SpkType::Hermite13 && self.degree % 2 == 0 {
            return Err(format!("type 13 degree {} is not odd", self.degree));
        }
        if self.states.len() != n {
            return Err(format!("{} states for {n} epochs", self.states.len()));
        }
        if n < self.window() {
            return Err(format!(
                "{n} states; degree {} needs {}",
                self.degree,
                self.window()
            ));
        }
        if self.start >= self.end {
            return Err("descriptor start is not before its end".into());
        }
        if self.epochs.windows(2).any(|w| w[1] <= w[0]) {
            return Err("epochs are not strictly increasing".into());
        }
        if self.epochs[0] > self.start || self.epochs[n - 1] < self.end {
            return Err("the epochs do not cover the descriptor interval".into());
        }
        if self.target == 0 || self.target == self.centre {
            return Err(format!(
                "bad target {} for centre {}",
                self.target, self.centre
            ));
        }
        Ok(())
    }

    /// The segment's data words, in file order.
    pub fn data_words(&self) -> Vec<f64> {
        let n = self.epochs.len();
        let ndir = (n - 1) / 100;
        let mut w = Vec::with_capacity(7 * n + ndir + 2);
        for s in &self.states {
            w.extend_from_slice(s);
        }
        w.extend_from_slice(&self.epochs);
        for k in 1..=ndir {
            w.push(self.epochs[100 * k - 1]);
        }
        w.push(match self.kind {
            SpkType::Lagrange9 => self.degree as f64,
            SpkType::Hermite13 => (self.window() - 1) as f64,
        });
        w.push(n as f64);
        w
    }
}

/// An SPK file to write: internal file name, comment area and segments in file order.
#[derive(Clone, Debug, PartialEq)]
pub struct SpkFile {
    /// Internal file name (at most 60 characters; longer is truncated, shorter blank-padded).
    pub ifname: String,
    /// Characters reserved for comments (`ncomch` of the SPICE open call).
    pub ncomch: usize,
    /// Comment lines (printable ASCII; trailing blanks are dropped).
    pub comments: Vec<String>,
    /// Segments, in the order they are added.
    pub segments: Vec<SpkSegment>,
}

/// An in-memory file that grows as records are written; unwritten bytes are zero.
struct Image(Vec<u8>);

impl Image {
    fn put(&mut self, byte_off: usize, bytes: &[u8]) {
        let end = byte_off + bytes.len();
        if self.0.len() < end {
            self.0.resize(end, 0);
        }
        self.0[byte_off..end].copy_from_slice(bytes);
    }
    fn record(&mut self, rec: usize, bytes: &[u8]) {
        self.put((rec - 1) * 1024, bytes);
    }
    fn word(&mut self, addr: usize, v: f64) {
        self.put((addr - 1) * 8, &v.to_le_bytes());
    }
    fn get_record(&self, rec: usize, len: usize) -> Vec<u8> {
        let off = (rec - 1) * 1024;
        (off..off + len)
            .map(|i| self.0.get(i).copied().unwrap_or(0))
            .collect()
    }
}

/// The FTP validation string of the file record.
const FTPSTR: [u8; 28] = [
    0x46, 0x54, 0x50, 0x53, 0x54, 0x52, 0x3A, 0x0D, 0x3A, 0x0A, 0x3A, 0x0D, 0x0A, 0x3A, 0x0D, 0x00,
    0x3A, 0x81, 0x3A, 0x10, 0xCE, 0x3A, 0x45, 0x4E, 0x44, 0x46, 0x54, 0x50,
];

fn rec_of(addr: usize) -> usize {
    (addr - 1) / NWD + 1
}

impl SpkFile {
    /// The kernel's bytes (little-endian IEEE). Errors on an invalid segment, no segment, a
    /// non-printing comment, or comments that do not fit the reserved records (the SPICE
    /// writer would then move the arrays, which this writer does not do).
    pub fn to_bytes(&self) -> Result<Vec<u8>, String> {
        if self.segments.is_empty() {
            return Err("an SPK needs at least one segment".into());
        }
        for (i, s) in self.segments.iter().enumerate() {
            s.validate().map_err(|e| format!("segment {i}: {e}"))?;
        }
        let resv = if self.ncomch > 0 {
            (self.ncomch - 1) / NCHAR + 1
        } else {
            0
        };
        let mut img = Image(Vec::new());
        let fward = resv + 2;
        let mut bward = fward;
        let mut free = (fward + 1) * NWD + 1;
        // Reserved records: 1000 NULs, the first starting with EOT.
        for r in 0..resv {
            let mut b = vec![0u8; NCHAR];
            if r == 0 {
                b[0] = 0x04;
            }
            img.record(2 + r, &b);
        }
        // The first summary record and its name record.
        img.record(fward, &[0u8; 1024]);
        let first_names = match resv {
            0 => vec![b' '; NCHAR],
            1 => {
                let mut b = vec![0u8; NCHAR];
                b[0] = 0x04;
                b
            }
            _ => vec![0u8; NCHAR],
        };
        img.record(fward + 1, &first_names);
        self.write_comments(&mut img, resv)?;

        for s in &self.segments {
            let begin = free;
            let data = s.data_words();
            let end = begin + data.len() - 1;
            for (k, w) in data.iter().enumerate() {
                img.word(begin + k, *w);
            }
            // Data records are written whole: extend to the end of the last one.
            let last_rec_end = rec_of(end) * 1024;
            if img.0.len() < last_rec_end {
                img.0.resize(last_rec_end, 0);
            }
            let l = bward;
            let mut sr = img.get_record(l, 1024);
            let nsum = f64::from_le_bytes(sr[16..24].try_into().expect("8 bytes")) as usize;
            let off = (3 + SS * nsum) * 8;
            sr[off..off + 8].copy_from_slice(&s.start.to_le_bytes());
            sr[off + 8..off + 16].copy_from_slice(&s.end.to_le_bytes());
            let ints = [
                s.target,
                s.centre,
                s.frame,
                s.kind.code(),
                begin as i32,
                end as i32,
            ];
            for (j, v) in ints.iter().enumerate() {
                sr[off + 16 + 4 * j..off + 20 + 4 * j].copy_from_slice(&v.to_le_bytes());
            }
            let nsum = nsum + 1;
            sr[16..24].copy_from_slice(&(nsum as f64).to_le_bytes());
            let mut nr = img.get_record(l + 1, NCHAR);
            let mut name = s.name.trim_end_matches(' ').as_bytes().to_vec();
            name.resize(SS * 8, b' ');
            nr[(nsum - 1) * SS * 8..nsum * SS * 8].copy_from_slice(&name);
            if nsum < MAX_SUM {
                img.record(l, &sr);
                img.record(l + 1, &nr);
                free = end + 1;
            } else {
                let next = rec_of(end) + 1;
                sr[0..8].copy_from_slice(&(next as f64).to_le_bytes());
                img.record(l, &sr);
                img.record(l + 1, &nr);
                let mut fresh = [0u8; 1024];
                fresh[8..16].copy_from_slice(&(l as f64).to_le_bytes());
                img.record(next, &fresh);
                img.record(next + 1, &[b' '; NCHAR]);
                bward = next;
                free = (next + 1) * NWD + 1;
            }
        }
        // The file record, written last with the final pointers.
        let mut fr = vec![0u8; 1024];
        fr[0..8].copy_from_slice(b"DAF/SPK ");
        fr[8..12].copy_from_slice(&2i32.to_le_bytes());
        fr[12..16].copy_from_slice(&6i32.to_le_bytes());
        let mut ifn: Vec<u8> = self.ifname.bytes().take(60).collect();
        ifn.resize(60, b' ');
        fr[16..76].copy_from_slice(&ifn);
        fr[76..80].copy_from_slice(&(fward as i32).to_le_bytes());
        fr[80..84].copy_from_slice(&(bward as i32).to_le_bytes());
        fr[84..88].copy_from_slice(&(free as i32).to_le_bytes());
        fr[88..96].copy_from_slice(b"LTL-IEEE");
        fr[699..727].copy_from_slice(&FTPSTR);
        img.record(1, &fr);
        Ok(img.0)
    }

    fn write_comments(&self, img: &mut Image, resv: usize) -> Result<(), String> {
        if self.comments.is_empty() {
            return Ok(());
        }
        let lines: Vec<&str> = self
            .comments
            .iter()
            .map(|l| l.trim_end_matches(' '))
            .collect();
        for l in &lines {
            if l.bytes().any(|b| !(32..=126).contains(&b)) {
                return Err(format!("comment line has non-printing characters: {l:?}"));
            }
        }
        let nchars: usize = lines.iter().map(|l| l.len()).sum::<usize>() + lines.len() + 1;
        if nchars > resv * NCHAR {
            return Err(format!(
                "comments need {nchars} characters; {} are reserved (raise ncomch)",
                resv * NCHAR
            ));
        }
        let mut rec = 2;
        let mut buf = vec![b' '; NCHAR];
        let mut pos = 0;
        let mut put = |c: u8, img: &mut Image, rec: &mut usize, buf: &mut Vec<u8>| {
            if pos == NCHAR {
                img.record(*rec, buf);
                *rec += 1;
                *buf = vec![b' '; NCHAR];
                pos = 0;
            }
            buf[pos] = c;
            pos += 1;
        };
        for l in &lines {
            for c in l.bytes() {
                put(c, img, &mut rec, &mut buf);
            }
            put(0, img, &mut rec, &mut buf);
        }
        put(0x04, img, &mut rec, &mut buf);
        img.record(rec, &buf);
        Ok(())
    }
}

/// A type 9 or 13 segment as read from a kernel.
#[derive(Clone, Debug)]
pub struct ReadSegment {
    /// Target body.
    pub target: i32,
    /// Centre.
    pub centre: i32,
    /// Frame code.
    pub frame: i32,
    /// Type (9 or 13).
    pub kind: SpkType,
    /// Descriptor start.
    pub start: f64,
    /// Descriptor end.
    pub end: f64,
    /// First and last data address.
    pub addresses: (usize, usize),
    /// Segment name.
    pub name: String,
    window: usize,
    epochs: Vec<f64>,
    states: Vec<[f64; 6]>,
}

/// Interpolate with Neville's algorithm in the order of the SPICE routine `lgrint`.
fn lagrange(x: &[f64], y: &[f64], t: f64) -> f64 {
    let n = x.len();
    let mut w = y.to_vec();
    for j in 1..n {
        for i in 0..n - j {
            let denom = x[i] - x[i + j];
            let c1 = t - x[i + j];
            let c2 = x[i] - t;
            w[i] = (c1 * w[i] + c2 * w[i + 1]) / denom;
        }
    }
    w[0]
}

/// Hermite interpolation of values and slopes (`y` = value, slope, value, slope, ...) in the
/// order of the SPICE routine `hrmint`; returns the value and the derivative.
fn hermite(x: &[f64], y: &[f64], t: f64) -> (f64, f64) {
    let n = x.len();
    let mut a = y.to_vec();
    let mut b = vec![0.0; 2 * n];
    // 0-based: p = 2i, q = 2i + 1, r = 2i + 2 for node pair (i, i + 1).
    for i in 0..n - 1 {
        let c1 = x[i + 1] - t;
        let c2 = t - x[i];
        let denom = x[i + 1] - x[i];
        let (p, q, r) = (2 * i, 2 * i + 1, 2 * i + 2);
        b[p] = a[q];
        b[q] = (a[r] - a[p]) / denom;
        let temp = a[q] * (t - x[i]) + a[p];
        a[q] = (c1 * a[p] + c2 * a[r]) / denom;
        a[p] = temp;
    }
    b[2 * n - 2] = a[2 * n - 1];
    a[2 * n - 2] += a[2 * n - 1] * (t - x[n - 1]);
    for j in 2..2 * n {
        for i in 1..=2 * n - j {
            let xi = i.div_ceil(2);
            let xij = (i + j).div_ceil(2);
            let c1 = x[xij - 1] - t;
            let c2 = t - x[xi - 1];
            let denom = x[xij - 1] - x[xi - 1];
            b[i - 1] = ((c1 * b[i - 1] + c2 * b[i]) + (a[i] - a[i - 1])) / denom;
            a[i - 1] = (c1 * a[i - 1] + c2 * a[i]) / denom;
        }
    }
    (a[0], b[0])
}

impl ReadSegment {
    /// The 0-based index of the first node of the window used at `et`, as the SPICE reader
    /// selects it (directory group, last epoch strictly before `et`, nearest node for an odd
    /// window with ties going to the later node).
    pub fn window_start(&self, et: f64) -> usize {
        let n = self.epochs.len();
        let d = self.window - 1;
        let ndir = (n - 1) / 100;
        let g = 1
            + (1..=ndir)
                .filter(|&k| self.epochs[100 * k - 1] < et)
                .count();
        let (begidx, endidx) = if g == 1 {
            (1, n.min(100))
        } else {
            let b = 100 * (g - 1);
            (b, (b + 100).min(n))
        };
        let i = (begidx..=endidx)
            .filter(|&k| self.epochs[k - 1] < et)
            .count();
        let low = if i == 0 { 1 } else { begidx + i - 1 };
        let centre = if self.window % 2 == 1 {
            if i == 0 {
                low
            } else {
                let high = low + 1;
                if (et - self.epochs[low - 1]).abs() < (et - self.epochs[high - 1]).abs() {
                    low
                } else {
                    high
                }
            }
        } else {
            low
        };
        let first = (centre as i64 - (d / 2) as i64).max(1).min((n - d) as i64) as usize;
        first - 1
    }

    /// State (km, km/s) of the target relative to the centre, in the segment frame, at `et`.
    pub fn eval(&self, et: f64) -> Result<[f64; 6], String> {
        if et < self.start || et > self.end {
            return Err(format!(
                "ET {et} outside the segment [{}, {}]",
                self.start, self.end
            ));
        }
        let f = self.window_start(et);
        let x = &self.epochs[f..f + self.window];
        let st = &self.states[f..f + self.window];
        let mut out = [0.0; 6];
        match self.kind {
            SpkType::Lagrange9 => {
                for (c, o) in out.iter_mut().enumerate() {
                    let y: Vec<f64> = st.iter().map(|s| s[c]).collect();
                    *o = lagrange(x, &y, et);
                }
            }
            SpkType::Hermite13 => {
                for c in 0..3 {
                    let y: Vec<f64> = st.iter().flat_map(|s| [s[c], s[c + 3]]).collect();
                    let (p, v) = hermite(x, &y, et);
                    out[c] = p;
                    out[c + 3] = v;
                }
            }
        }
        Ok(out)
    }
}

/// The type 9 and 13 segments of an SPK, in file order (other types are skipped).
#[derive(Clone, Debug)]
pub struct InterpolatedSpk {
    /// The segments.
    pub segments: Vec<ReadSegment>,
}

impl InterpolatedSpk {
    /// Read from bytes.
    pub fn from_bytes(bytes: Vec<u8>) -> Result<Self, String> {
        let daf = DafFile::from_bytes(bytes)?;
        if daf.id_word != "DAF/SPK" {
            return Err(format!("not an SPK: {}", daf.id_word));
        }
        let mut segments = Vec::new();
        for s in daf.summaries()? {
            if s.doubles.len() != 2 || s.ints.len() != 6 {
                return Err("SPK summary is not ND=2, NI=6".into());
            }
            let kind = match s.ints[3] {
                9 => SpkType::Lagrange9,
                13 => SpkType::Hermite13,
                _ => continue,
            };
            let (first, last) = (s.ints[4] as usize, s.ints[5] as usize);
            let w = daf.words(first, last)?;
            let nw = w.len();
            if nw < 9 {
                return Err(format!("segment {:?} too short", s.name));
            }
            let n = w[nw - 1].round() as usize;
            let d = w[nw - 2].round() as usize;
            let ndir = n.saturating_sub(1) / 100;
            if n == 0 || 7 * n + ndir + 2 != nw {
                return Err(format!("segment {:?}: {nw} words for N = {n}", s.name));
            }
            let states = (0..n)
                .map(|i| w[6 * i..6 * i + 6].try_into().expect("6 words"))
                .collect();
            segments.push(ReadSegment {
                target: s.ints[0],
                centre: s.ints[1],
                frame: s.ints[2],
                kind,
                start: s.doubles[0],
                end: s.doubles[1],
                addresses: (first, last),
                name: s.name.clone(),
                window: d + 1,
                epochs: w[6 * n..7 * n].to_vec(),
                states,
            });
        }
        Ok(Self { segments })
    }

    /// The highest-priority segment for `target` covering `et`: the last one in the file.
    fn find(&self, target: i32, et: f64) -> Option<&ReadSegment> {
        self.segments
            .iter()
            .rev()
            .find(|s| s.target == target && s.start <= et && et <= s.end)
    }

    /// Geometric state (km, km/s) of `target` relative to `observer` at `et`, summing the two
    /// centre chains up to their lowest common body. Every segment on the way must be in
    /// `frame` (no frame rotation is applied).
    pub fn state(
        &self,
        target: i32,
        observer: i32,
        frame: i32,
        et: f64,
    ) -> Result<[f64; 6], String> {
        let chain = |b0: i32| -> Result<Vec<(i32, [f64; 6])>, String> {
            let mut out = Vec::new();
            let mut b = b0;
            while let Some(s) = self.find(b, et) {
                if s.frame != frame {
                    return Err(format!("segment {:?} is in frame {}", s.name, s.frame));
                }
                out.push((b, s.eval(et)?));
                b = s.centre;
                if out.len() > 50 {
                    return Err("SPK centre chain does not terminate".into());
                }
            }
            out.push((b, [0.0; 6]));
            Ok(out)
        };
        let ct = chain(target)?;
        let co = chain(observer)?;
        let common = ct
            .iter()
            .map(|x| x.0)
            .find(|b| co.iter().any(|y| y.0 == *b))
            .ok_or_else(|| format!("no SPK chain connects {target} and {observer} at ET {et}"))?;
        let mut s = [0.0; 6];
        for (b, st) in &ct {
            if *b == common {
                break;
            }
            for k in 0..6 {
                s[k] += st[k];
            }
        }
        for (b, st) in &co {
            if *b == common {
                break;
            }
            for k in 0..6 {
                s[k] -= st[k];
            }
        }
        Ok(s)
    }
}

/// SPICE ephemeris time (TDB seconds past J2000) of a calendar epoch
/// `YYYY-MM-DDTHH:MM:SS[.fff]` in `UTC` or `TDB`. A UTC label may carry second 60 (inside a
/// leap second); the leap-second count is that of the label's own day. UTC uses the NAIF
/// leapseconds model `ET = UTC + (TAI - UTC) + 32.184 s + K sin E`, `E = M + EB sin M`,
/// `M = M0 + M1 (UTC + (TAI - UTC) + 32.184 s)`.
pub fn et_from_label(label: &str, time_system: &str) -> Result<f64, String> {
    let s = label.trim().trim_end_matches('Z');
    let (date, time) = s
        .split_once('T')
        .ok_or_else(|| format!("epoch {s:?} has no 'T'"))?;
    let d: Vec<i64> = date
        .split('-')
        .map(|x| x.parse::<i64>().map_err(|e| format!("{s}: {e}")))
        .collect::<Result<_, _>>()?;
    let t: Vec<&str> = time.split(':').collect();
    if d.len() != 3 || t.len() != 3 {
        return Err(format!("epoch {s:?} is not YYYY-MM-DDTHH:MM:SS"));
    }
    let h: i64 = t[0].parse().map_err(|e| format!("{s}: {e}"))?;
    let mi: i64 = t[1].parse().map_err(|e| format!("{s}: {e}"))?;
    let sec: f64 = t[2].parse().map_err(|e| format!("{s}: {e}"))?;
    // Days from 2000-01-01 (civil calendar, proleptic Gregorian).
    let days_from_civil = |y: i64, m: i64, dd: i64| -> i64 {
        let y = if m <= 2 { y - 1 } else { y };
        let era = y.div_euclid(400);
        let yoe = y - era * 400;
        let mp = (m + 9) % 12;
        let doy = (153 * mp + 2) / 5 + dd - 1;
        let doe = yoe * 365 + yoe / 4 - yoe / 100 + doy;
        era * 146_097 + doe - 719_468
    };
    let day = days_from_civil(d[0], d[1], d[2]) - days_from_civil(2000, 1, 1);
    // Seconds from 2000-01-01T12:00:00 on the label's scale (whole part exact).
    let whole = (day * 86_400 + h * 3600 + mi * 60 - 43_200) as f64;
    match time_system.trim().to_ascii_uppercase().as_str() {
        "TDB" => Ok(whole + sec),
        "UTC" => {
            let jd_day = crate::timescales::JD_J2000 - 0.5 + day as f64;
            // The day's own count (leap seconds take effect at a day boundary): look it up at
            // the label's noon, so a second-60 label keeps the count of its day.
            let dta = crate::timescales::tai_minus_utc(jd_day + 0.5);
            let aet = whole + sec + dta + 32.184;
            let m = 6.239_996 + 1.990_968_71e-7 * aet;
            let e = m + 1.671e-2 * m.sin();
            Ok(whole + sec + (dta + 32.184 + 1.657e-3 * e.sin()))
        }
        other => Err(format!("time system {other:?} not supported (UTC or TDB)")),
    }
}

/// The NAIF id of an OEM `CENTER_NAME`.
pub fn centre_code(name: &str) -> Result<i32, String> {
    match name.trim().to_ascii_uppercase().as_str() {
        "EARTH" => Ok(399),
        "MOON" => Ok(301),
        "SUN" => Ok(10),
        "EARTH BARYCENTER" | "EARTH-MOON BARYCENTER" | "EMB" => Ok(3),
        "SOLAR SYSTEM BARYCENTER" | "SSB" => Ok(0),
        "MARS" => Ok(499),
        other => Err(format!("centre {other:?} has no supported NAIF id")),
    }
}

/// One OEM segment to export: target id, type and degree.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct OemExport {
    /// NAIF id given to the segment's object.
    pub target: i32,
    /// Interpolation type.
    pub kind: SpkType,
    /// Degree.
    pub degree: usize,
}

/// Turn the segments of a CCSDS OEM (KVN) into SPK segments: epochs to ET with
/// [`et_from_label`] (UTC or TDB), `CENTER_NAME` and `REF_FRAME` to NAIF codes, the
/// descriptor spanning the first to the last line. `exports[i]` applies to OEM segment `i`.
pub fn oem_to_spk_segments(
    oem_text: &str,
    exports: &[OemExport],
) -> Result<Vec<SpkSegment>, String> {
    let mut out = Vec::new();
    let mut meta: Vec<(String, String)> = Vec::new();
    let mut in_meta = false;
    let mut cur: Option<SpkSegment> = None;
    let mut time_system = String::new();
    let mut idx = 0;
    let finish = |seg: Option<SpkSegment>, out: &mut Vec<SpkSegment>| -> Result<(), String> {
        if let Some(mut s) = seg {
            let (Some(&a), Some(&b)) = (s.epochs.first(), s.epochs.last()) else {
                return Err(format!("OEM segment {:?} has no data lines", s.name));
            };
            s.start = a;
            s.end = b;
            out.push(s);
        }
        Ok(())
    };
    for raw in oem_text.lines() {
        let line = raw.trim();
        if line.is_empty() || line.starts_with("COMMENT") {
            continue;
        }
        if line == "META_START" {
            finish(cur.take(), &mut out)?;
            in_meta = true;
            meta.clear();
            continue;
        }
        if line == "META_STOP" {
            in_meta = false;
            let get = |k: &str| {
                meta.iter()
                    .find(|(kk, _)| kk == k)
                    .map(|(_, v)| v.clone())
                    .ok_or_else(|| format!("OEM segment {idx}: no {k}"))
            };
            let ex = exports
                .get(idx)
                .ok_or_else(|| format!("no export settings for OEM segment {idx}"))?;
            time_system = get("TIME_SYSTEM")?;
            cur = Some(SpkSegment {
                target: ex.target,
                centre: centre_code(&get("CENTER_NAME")?)?,
                frame: frame_code(&get("REF_FRAME")?)?,
                kind: ex.kind,
                degree: ex.degree,
                start: 0.0,
                end: 0.0,
                name: get("OBJECT_NAME")?.chars().take(40).collect(),
                epochs: vec![],
                states: vec![],
            });
            idx += 1;
            continue;
        }
        if in_meta {
            if let Some((k, v)) = line.split_once('=') {
                meta.push((k.trim().to_string(), v.trim().to_string()));
            }
            continue;
        }
        let Some(seg) = cur.as_mut() else {
            continue; // header lines
        };
        if line.starts_with("COVARIANCE") {
            break;
        }
        let f: Vec<&str> = line.split_whitespace().collect();
        if f.len() < 7 {
            return Err(format!("OEM data line has {} fields: {line}", f.len()));
        }
        seg.epochs.push(et_from_label(f[0], &time_system)?);
        let mut st = [0.0; 6];
        for k in 0..6 {
            st[k] = f[k + 1]
                .parse()
                .map_err(|e| format!("OEM value {:?}: {e}", f[k + 1]))?;
        }
        seg.states.push(st);
    }
    finish(cur.take(), &mut out)?;
    if out.len() != exports.len() {
        return Err(format!(
            "{} OEM segments for {} export settings",
            out.len(),
            exports.len()
        ));
    }
    Ok(out)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn seg(kind: SpkType, degree: usize, n: usize) -> SpkSegment {
        let epochs: Vec<f64> = (0..n)
            .map(|i| 10.0 * i as f64 + 0.25 * (i % 3) as f64)
            .collect();
        let states = epochs
            .iter()
            .map(|t| [t * t, 2.0 * t, 1.0, 2.0 * t, 2.0, 0.0])
            .collect();
        SpkSegment {
            target: -5,
            centre: 399,
            frame: 1,
            kind,
            degree,
            start: epochs[0],
            end: epochs[n - 1],
            name: "TEST".into(),
            epochs,
            states,
        }
    }

    #[test]
    fn interpolation_reproduces_polynomials_and_round_trips() {
        for (kind, degree) in [(SpkType::Lagrange9, 3), (SpkType::Hermite13, 3)] {
            let s = seg(kind, degree, 230);
            let file = SpkFile {
                ifname: "T".into(),
                ncomch: 0,
                comments: vec![],
                segments: vec![s.clone()],
            };
            let k = InterpolatedSpk::from_bytes(file.to_bytes().unwrap()).unwrap();
            let r = &k.segments[0];
            assert_eq!((r.target, r.centre, r.frame), (-5, 399, 1));
            for t in [0.0, 3.3, 999.0, 1000.0, 1000.1, 2290.0] {
                let v = r.eval(t).unwrap();
                assert!((v[0] - t * t).abs() < 1e-6 * (1.0 + t * t), "{kind:?} {t}");
                assert!((v[3] - 2.0 * t).abs() < 1e-6 * (1.0 + t), "{kind:?} {t}");
            }
            assert!(r.eval(-1.0).is_err());
        }
    }

    #[test]
    fn layout_pointers_and_validation() {
        let s = seg(SpkType::Hermite13, 7, 20);
        let w = s.data_words();
        assert_eq!(w.len(), 7 * 20 + 2);
        assert_eq!(w[w.len() - 2], 3.0);
        let s9 = seg(SpkType::Lagrange9, 8, 250);
        let w9 = s9.data_words();
        assert_eq!(w9.len(), 7 * 250 + 2 + 2);
        assert_eq!(w9[w9.len() - 2], 8.0);
        assert_eq!(w9[7 * 250], s9.epochs[99]);
        let bytes = SpkFile {
            ifname: "X".into(),
            ncomch: 0,
            comments: vec![],
            segments: vec![s.clone()],
        }
        .to_bytes()
        .unwrap();
        assert_eq!(&bytes[0..8], b"DAF/SPK ");
        assert_eq!(i32::from_le_bytes(bytes[76..80].try_into().unwrap()), 2);
        assert_eq!(bytes.len() % 1024, 0);
        let mut bad = s.clone();
        bad.degree = 4;
        assert!(bad.validate().is_err());
        let mut bad = s.clone();
        bad.epochs.swap(1, 2);
        assert!(bad.validate().is_err());
        let mut bad = s;
        bad.name = "x".repeat(41);
        assert!(bad.validate().is_err());
    }

    #[test]
    fn a_full_summary_record_gets_an_empty_successor() {
        let segs: Vec<SpkSegment> = (0..25).map(|_| seg(SpkType::Lagrange9, 1, 5)).collect();
        let bytes = SpkFile {
            ifname: "X".into(),
            ncomch: 0,
            comments: vec![],
            segments: segs,
        }
        .to_bytes()
        .unwrap();
        assert_eq!(bytes.len() % 1024, 1000);
        let k = InterpolatedSpk::from_bytes(bytes).unwrap();
        assert_eq!(k.segments.len(), 25);
    }

    #[test]
    fn epochs_from_labels() {
        assert_eq!(et_from_label("2000-01-01T12:00:00", "TDB").unwrap(), 0.0);
        let a = et_from_label("2016-12-31T23:59:59.500", "UTC").unwrap();
        let b = et_from_label("2016-12-31T23:59:60.500", "UTC").unwrap();
        let c = et_from_label("2017-01-01T00:00:00.500", "UTC").unwrap();
        assert!(
            (b - a - 1.0).abs() < 1e-6 && (c - b - 1.0).abs() < 1e-6,
            "{a} {b} {c}"
        );
    }
}
