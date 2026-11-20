// SPDX-License-Identifier: AGPL-3.0-only
//! Galileo High Accuracy Service (HAS) decoder: E6-B C/NAV pages to HAS message type 1.
//!
//! Reference: Galileo HAS Signal-In-Space ICD, Issue 1.0, May 2022 (European Union). Section
//! numbers below are that document's.
//!
//! * C/NAV page (section 2.3, Table 5): 14 reserved bits, a 448-bit HAS page, a CRC-24Q over
//!   the first 462 bits (section 2.3.3) and 6 tail bits. A 448-bit input is taken as a HAS
//!   page with no CRC.
//! * HAS page header (section 3, Tables 7 and 8): HASS (2), reserved (2), MT (2), MID (5),
//!   MS (5, pages = value + 1), PID (8). Header `AF3BC3` is a dummy page (section 2.4.1);
//!   PID 0 is reserved.
//! * Outer code (section 6): RS(255,32,224) over GF(256), field polynomial
//!   `x^8 + x^4 + x^3 + x^2 + 1` (Eq. 7), narrow-sense generator `g(x) = prod (x - a^i)`,
//!   `i = 1..223` (Eq. 8). The systematic generator matrix (Eq. 13 to 15) is computed here from
//!   `g(x)`, not stored. A message of `k = MS` pages is recovered from any `k` distinct pages
//!   by inverting the `k x k` sub-matrix of the received PIDs (section 6.4, Eq. 16 and 17).
//!   Further pages of a decoded message are checked against its re-encoding: a consistent page
//!   is redundant, an inconsistent one starts a new message with that MID.
//! * Message type 1 (section 5): the 32-bit header (TOH, six content flags, reserved, Mask ID,
//!   IOD Set ID; Table 12) and the blocks in flag order: mask (Tables 15 to 21), orbit
//!   (Tables 22 to 26), clock full-set (Tables 27 to 31), clock subset (Tables 32 to 34), code
//!   biases (Tables 35 to 37) and phase biases (Tables 38 to 40). A message without a mask
//!   uses the mask of an earlier message with the same Mask ID (section 7.6); with none, its
//!   blocks are reported as unresolved.
//!
//! Clock corrections are reported both as the delta clock correction (DCC) and multiplied by
//! the delta clock multiplier (section 7.3). The 150-second message completion time-out
//! (section 6.4.1) needs reception times, which a frame file does not carry; it is not applied.

use super::bits::{self, Cursor};
use super::Frame;
use serde::Serialize;
use std::collections::{BTreeMap, HashMap};
use std::sync::OnceLock;

/// Pages of the outer code (N).
pub const N: usize = 255;
/// Information symbols (K).
pub const K: usize = 32;
/// Octets per HAS encoded page.
pub const OCTETS: usize = 53;
/// Header of a dummy page.
pub const DUMMY_HEADER: u32 = 0xAF3BC3;

struct Gf {
    exp: [u8; 512],
    log: [u8; 256],
}

fn gf() -> &'static Gf {
    static T: OnceLock<Gf> = OnceLock::new();
    T.get_or_init(|| {
        let mut exp = [0u8; 512];
        let mut log = [0u8; 256];
        let mut x: u16 = 1;
        for (i, e) in exp.iter_mut().enumerate().take(255) {
            *e = x as u8;
            log[x as usize] = i as u8;
            x <<= 1;
            if x & 0x100 != 0 {
                x ^= 0x11D;
            }
        }
        exp.copy_within(0..257, 255);
        Gf { exp, log }
    })
}

/// Product in GF(256) with the HAS field polynomial.
pub fn gf_mul(a: u8, b: u8) -> u8 {
    if a == 0 || b == 0 {
        return 0;
    }
    let t = gf();
    t.exp[t.log[a as usize] as usize + t.log[b as usize] as usize]
}

/// `a^i` for the primitive element `a = 2`.
pub fn gf_pow_alpha(i: usize) -> u8 {
    gf().exp[i % 255]
}

fn gf_inv(a: u8) -> u8 {
    let t = gf();
    t.exp[255 - t.log[a as usize] as usize]
}

/// Coefficients `g_0 .. g_223` of the generator polynomial (Eq. 8), lowest degree first.
pub fn generator_poly() -> Vec<u8> {
    let mut g = vec![1u8];
    for i in 1..=(N - K) {
        let r = gf_pow_alpha(i);
        let mut next = vec![0u8; g.len() + 1];
        for (j, &c) in g.iter().enumerate() {
            next[j + 1] ^= c;
            next[j] ^= gf_mul(c, r);
        }
        g = next;
    }
    g
}

/// The systematic generator matrix `G` (255 rows, 32 columns; Eq. 14 and 15): row `p - 1`
/// gives encoded page `p` from the information octets of pages 1 to 32.
pub fn generator_matrix() -> &'static [[u8; K]; N] {
    static G: OnceLock<[[u8; K]; N]> = OnceLock::new();
    G.get_or_init(|| {
        let g = generator_poly();
        let deg = N - K; // 223
                         // r[s] = x^(223 + s) mod g(x), degree < 223.
        let mut rems: Vec<Vec<u8>> = Vec::with_capacity(K);
        let mut r: Vec<u8> = g[..deg].to_vec(); // x^223 = -(g - x^223) = g_0..g_222 in GF(2^8)
        for _ in 0..K {
            rems.push(r.clone());
            // multiply by x and reduce.
            let top = r[deg - 1];
            let mut next = vec![0u8; deg];
            next[1..deg].copy_from_slice(&r[..deg - 1]);
            if top != 0 {
                for j in 0..deg {
                    next[j] ^= gf_mul(top, g[j]);
                }
            }
            r = next;
        }
        let mut m = [[0u8; K]; N];
        for (row, out) in m.iter_mut().enumerate() {
            for (t, cell) in out.iter_mut().enumerate() {
                *cell = if row < K {
                    u8::from(row == t)
                } else {
                    // row p - 1 = row gives Gamma_(254 - row) = gamma_(254 - row); column t
                    // multiplies c_(31 - t), whose parity is x^(223 + 31 - t) mod g.
                    rems[K - 1 - t][N - 1 - row]
                };
            }
        }
        m
    })
}

/// Invert a square matrix over GF(256); `None` when singular.
fn invert(mut a: Vec<Vec<u8>>) -> Option<Vec<Vec<u8>>> {
    let n = a.len();
    let mut inv: Vec<Vec<u8>> = (0..n)
        .map(|i| (0..n).map(|j| u8::from(i == j)).collect())
        .collect();
    for col in 0..n {
        let piv = (col..n).find(|&r| a[r][col] != 0)?;
        a.swap(col, piv);
        inv.swap(col, piv);
        let f = gf_inv(a[col][col]);
        for j in 0..n {
            a[col][j] = gf_mul(a[col][j], f);
            inv[col][j] = gf_mul(inv[col][j], f);
        }
        for r in 0..n {
            if r != col && a[r][col] != 0 {
                let f = a[r][col];
                for j in 0..n {
                    let (x, y) = (gf_mul(f, a[col][j]), gf_mul(f, inv[col][j]));
                    a[r][j] ^= x;
                    inv[r][j] ^= y;
                }
            }
        }
    }
    Some(inv)
}

/// Encode a message of `k` pages (each [`OCTETS`] octets) into encoded page `pid` (1..=255).
pub fn encode_page(pages: &[[u8; OCTETS]], pid: u8) -> [u8; OCTETS] {
    let g = generator_matrix();
    let row = &g[pid as usize - 1];
    let mut out = [0u8; OCTETS];
    for (j, o) in out.iter_mut().enumerate() {
        for (t, p) in pages.iter().enumerate().take(K) {
            *o ^= gf_mul(row[t], p[j]);
        }
    }
    out
}

/// Recover the `k` message pages from `k` encoded pages `(pid, octets)` with distinct PIDs
/// (section 6.4). `None` when the PIDs are not distinct or out of range.
pub fn rs_decode(received: &[(u8, [u8; OCTETS])]) -> Option<Vec<[u8; OCTETS]>> {
    let k = received.len();
    if k == 0 || k > K {
        return None;
    }
    let g = generator_matrix();
    let mut d = Vec::with_capacity(k);
    for (pid, _) in received {
        if *pid == 0 {
            return None;
        }
        d.push(g[*pid as usize - 1][..k].to_vec());
    }
    let dinv = invert(d)?;
    let mut pages = vec![[0u8; OCTETS]; k];
    for j in 0..OCTETS {
        for (t, page) in pages.iter_mut().enumerate() {
            let mut acc = 0u8;
            for (i, (_, w)) in received.iter().enumerate() {
                acc ^= gf_mul(dinv[t][i], w[j]);
            }
            page[j] = acc;
        }
    }
    Some(pages)
}

/// The HAS page header (Table 7).
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
pub struct PageHeader {
    /// HAS status: 0 test, 1 operational, 2 reserved, 3 don't use.
    pub hass: u8,
    /// Message type (1: MT1).
    pub mt: u8,
    /// Message ID.
    pub mid: u8,
    /// Message size in pages (field + 1).
    pub ms: u8,
    /// Encoded page ID.
    pub pid: u8,
}

/// Parse the 24-bit page header.
pub fn page_header(h: u32) -> PageHeader {
    PageHeader {
        hass: ((h >> 22) & 3) as u8,
        mt: ((h >> 18) & 3) as u8,
        mid: ((h >> 13) & 31) as u8,
        ms: ((h >> 8) & 31) as u8 + 1,
        pid: (h & 0xFF) as u8,
    }
}

/// Validity interval in seconds for a validity index (Table 23); `None` for 15 (reserved).
pub fn validity_s(vi: u8) -> Option<u32> {
    const T: [u32; 15] = [
        5, 10, 15, 20, 30, 60, 90, 120, 180, 240, 300, 600, 900, 1800, 3600,
    ];
    T.get(vi as usize).copied()
}

/// Signal name for a signal index (Table 20).
pub fn signal_name(gnss_id: u8, idx: u8) -> Option<&'static str> {
    const GAL: [&str; 15] = [
        "E1-B", "E1-C", "E1-B+C", "E5a-I", "E5a-Q", "E5a-I+Q", "E5b-I", "E5b-Q", "E5b-I+Q", "E5-I",
        "E5-Q", "E5-I+Q", "E6-B", "E6-C", "E6-B+C",
    ];
    const GPS: [&str; 15] = [
        "L1 C/A", "", "", "L1C(D)", "L1C(P)", "L1C(D+P)", "L2 CM", "L2 CL", "L2 CM+CL", "L2 P", "",
        "L5 I", "L5 Q", "L5 I+Q", "",
    ];
    let s = match gnss_id {
        0 => GPS.get(idx as usize)?,
        2 => GAL.get(idx as usize)?,
        _ => return None,
    };
    (!s.is_empty()).then_some(*s)
}

fn sys_letter(gnss_id: u8) -> Option<char> {
    match gnss_id {
        0 => Some('G'),
        2 => Some('E'),
        _ => None,
    }
}

/// The mask of one GNSS (Table 16).
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct GnssMask {
    /// GNSS ID (0 GPS, 2 Galileo; Table 18).
    pub gnss_id: u8,
    /// Corrected satellites, labelled (`G01`, `E12`).
    pub satellites: Vec<String>,
    /// Signal indices with biases (Table 20).
    pub signals: Vec<u8>,
    /// Signal names, in the order of `signals`.
    pub signal_names: Vec<String>,
    /// Cell mask rows (one per satellite, one entry per signal), when sent.
    pub cell_mask: Option<Vec<Vec<u8>>>,
    /// Navigation message index (0: Galileo I/NAV, GPS LNAV).
    pub nav_message: u8,
}

impl GnssMask {
    fn signals_of(&self, sat: usize) -> Vec<u8> {
        match &self.cell_mask {
            Some(cm) => self
                .signals
                .iter()
                .zip(&cm[sat])
                .filter(|(_, c)| **c == 1)
                .map(|(s, _)| *s)
                .collect(),
            None => self.signals.clone(),
        }
    }
}

/// MT1 header (Table 12).
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
pub struct Mt1Header {
    /// Time of hour (s).
    pub toh: u16,
    /// Mask block present.
    pub mask: bool,
    /// Orbit block present.
    pub orbit: bool,
    /// Clock full-set block present.
    pub clock_full: bool,
    /// Clock subset block present.
    pub clock_subset: bool,
    /// Code bias block present.
    pub code_bias: bool,
    /// Phase bias block present.
    pub phase_bias: bool,
    /// Mask ID.
    pub mask_id: u8,
    /// IOD Set ID.
    pub iod_set_id: u8,
}

/// One satellite's orbit correction (Tables 24 and 25).
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct OrbitSat {
    /// Satellite.
    pub sat: String,
    /// Reference IOD (Galileo IODnav, GPS IODE).
    pub iod_ref: u32,
    /// Delta radial (m); `null` when not available.
    pub radial_m: Option<f64>,
    /// Delta in-track (m).
    pub in_track_m: Option<f64>,
    /// Delta cross-track (m).
    pub cross_track_m: Option<f64>,
}

/// The orbit block.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct OrbitBlock {
    /// Validity interval index.
    pub validity_index: u8,
    /// Validity interval (s).
    pub validity_s: Option<u32>,
    /// Satellites in mask order.
    pub sats: Vec<OrbitSat>,
}

/// One satellite's clock correction.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ClockSat {
    /// Satellite.
    pub sat: String,
    /// Delta clock correction as sent (m); `null` when not available or "don't use".
    pub dcc_m: Option<f64>,
    /// DCC times the multiplier (m), the correction to apply (section 7.3).
    pub correction_m: Option<f64>,
    /// `ok`, `not_available` or `do_not_use` (Table 31).
    pub status: &'static str,
}

/// The clock full-set block.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ClockFullBlock {
    /// Validity interval index.
    pub validity_index: u8,
    /// Validity interval (s).
    pub validity_s: Option<u32>,
    /// Multiplier per GNSS of the mask (1 to 4; Table 29).
    pub multipliers: Vec<u8>,
    /// Satellites in mask order.
    pub sats: Vec<ClockSat>,
}

/// One GNSS of the clock subset block.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ClockSubsetSystem {
    /// GNSS ID.
    pub gnss_id: u8,
    /// Multiplier (1 to 4).
    pub multiplier: u8,
    /// Satellites of the subset.
    pub sats: Vec<ClockSat>,
}

/// The clock subset block.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ClockSubsetBlock {
    /// Validity interval index.
    pub validity_index: u8,
    /// Validity interval (s).
    pub validity_s: Option<u32>,
    /// GNSS of the subset.
    pub systems: Vec<ClockSubsetSystem>,
}

/// One bias of one signal.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct SignalBias {
    /// Signal index (Table 20).
    pub signal: u8,
    /// Code bias (m) or phase bias (cycles); `null` when not available.
    pub bias: Option<f64>,
    /// Phase discontinuity indicator (phase biases only).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub pdi: Option<u8>,
}

/// One satellite's biases.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct BiasSat {
    /// Satellite.
    pub sat: String,
    /// Biases, in signal-mask order.
    pub biases: Vec<SignalBias>,
}

/// A code bias (m) or phase bias (cycles) block.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct BiasBlock {
    /// Validity interval index.
    pub validity_index: u8,
    /// Validity interval (s).
    pub validity_s: Option<u32>,
    /// Satellites in mask order.
    pub sats: Vec<BiasSat>,
}

/// One decoded HAS message.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Message {
    /// Message ID.
    pub mid: u8,
    /// Message size (pages).
    pub ms: u8,
    /// Message type.
    pub mt: u8,
    /// HAS status of the page that completed the message.
    pub hass: u8,
    /// PIDs used to decode, in arrival order.
    pub pids: Vec<u8>,
    /// MT1 header.
    pub header: Option<Mt1Header>,
    /// Mask block (sent in this message).
    pub mask: Option<Vec<GnssMask>>,
    /// Orbit block.
    pub orbit: Option<OrbitBlock>,
    /// Clock full-set block.
    pub clock_full: Option<ClockFullBlock>,
    /// Clock subset block.
    pub clock_subset: Option<ClockSubsetBlock>,
    /// Code bias block (m).
    pub code_bias: Option<BiasBlock>,
    /// Phase bias block (cycles).
    pub phase_bias: Option<BiasBlock>,
    /// Why the blocks were not (all) read: `no_mask`, `unknown_gnss`, `truncated`, `not_mt1`.
    pub error: Option<&'static str>,
    /// Bits after the last block.
    pub trailing_bits: usize,
    /// Whether those bits are the `0101...` padding of section 4.
    pub trailing_is_padding: bool,
}

/// What a frame file held.
#[derive(Clone, Debug, Default, PartialEq, Serialize)]
pub struct Report {
    /// Frames read.
    pub frames: usize,
    /// C/NAV pages whose CRC failed.
    pub bad_crc: usize,
    /// Frames of neither 448 bits nor at least 492 bits.
    pub bad_length: usize,
    /// Dummy pages.
    pub dummy: usize,
    /// Pages with PID 0 (reserved).
    pub reserved_pid: usize,
    /// Pages with a PID above MS and up to 32: they carry only zeros (section 6.3) and are
    /// not transmitted; they are skipped.
    pub zero_pid: usize,
    /// Pages of an already decoded message that matched its re-encoding.
    pub redundant: usize,
    /// Decoded messages, in completion order.
    pub messages: Vec<Message>,
    /// Messages still incomplete at the end: (MID, MS, pages received).
    pub incomplete: Vec<(u8, u8, usize)>,
}

/// A recovered message: its size and its pages.
type Decoded = (u8, Vec<[u8; OCTETS]>);

#[derive(Default)]
struct Pending {
    ms: u8,
    pages: Vec<(u8, [u8; OCTETS])>,
}

/// A stateful decoder: feed HAS pages, collect messages.
#[derive(Default)]
pub struct Decoder {
    pending: BTreeMap<(u8, u8), Pending>,
    done: HashMap<(u8, u8), Decoded>,
    masks: HashMap<u8, Vec<GnssMask>>,
    /// The report so far.
    pub report: Report,
}

impl Decoder {
    /// Feed one input frame (a C/NAV page of at least 492 bits, or a 448-bit HAS page).
    pub fn push_frame(&mut self, f: &Frame) {
        self.report.frames += 1;
        let b = f.bits();
        let page: Vec<u8> = if b.len() == 448 {
            b
        } else if b.len() >= 492 {
            let crc = crate::gnss_navmsg::fec::crc24q(&b[..462]);
            let got = b[462..486]
                .iter()
                .fold(0u32, |a, &x| (a << 1) | u32::from(x));
            if crc != got {
                self.report.bad_crc += 1;
                return;
            }
            b[14..462].to_vec()
        } else {
            self.report.bad_length += 1;
            return;
        };
        self.push_has_page(&page);
    }

    /// Feed one 448-bit HAS page.
    pub fn push_has_page(&mut self, page: &[u8]) {
        let h = page[..24]
            .iter()
            .fold(0u32, |a, &x| (a << 1) | u32::from(x));
        if h == DUMMY_HEADER {
            self.report.dummy += 1;
            return;
        }
        let hd = page_header(h);
        if hd.pid == 0 {
            self.report.reserved_pid += 1;
            return;
        }
        if hd.pid > hd.ms && hd.pid as usize <= K {
            self.report.zero_pid += 1;
            return;
        }
        let mut oct = [0u8; OCTETS];
        oct.copy_from_slice(&bits::to_bytes(&page[24..448]));
        let key = (hd.mt, hd.mid);
        if let Some((ms, msg)) = self.done.get(&key) {
            if *ms == hd.ms && encode_page(msg, hd.pid) == oct {
                self.report.redundant += 1;
                return;
            }
            self.done.remove(&key);
        }
        let p = self.pending.entry(key).or_default();
        if p.ms != hd.ms {
            *p = Pending {
                ms: hd.ms,
                pages: Vec::new(),
            };
        }
        if p.pages.iter().any(|(pid, _)| *pid == hd.pid) {
            return;
        }
        p.pages.push((hd.pid, oct));
        if p.pages.len() < p.ms as usize {
            return;
        }
        let Some(p) = self.pending.remove(&key) else {
            return;
        };
        let Some(msg_pages) = rs_decode(&p.pages) else {
            return;
        };
        let pids = p.pages.iter().map(|(pid, _)| *pid).collect();
        let mut body = Vec::with_capacity(msg_pages.len() * 424);
        for pg in &msg_pages {
            body.extend(bits::of_bytes(pg));
        }
        let m = self.decode_message(hd, pids, &body);
        self.done.insert(key, (hd.ms, msg_pages));
        self.report.messages.push(m);
    }

    fn decode_message(&mut self, hd: PageHeader, pids: Vec<u8>, body: &[u8]) -> Message {
        let mut m = Message {
            mid: hd.mid,
            ms: hd.ms,
            mt: hd.mt,
            hass: hd.hass,
            pids,
            header: None,
            mask: None,
            orbit: None,
            clock_full: None,
            clock_subset: None,
            code_bias: None,
            phase_bias: None,
            error: None,
            trailing_bits: 0,
            trailing_is_padding: false,
        };
        if hd.mt != 1 {
            m.error = Some("not_mt1");
            return m;
        }
        let mut c = Cursor::new(body);
        let r = decode_mt1(&mut c, &mut m, &mut self.masks);
        if let Err(e) = r {
            m.error = Some(e);
        }
        let rest = &body[c.pos.min(body.len())..];
        m.trailing_bits = rest.len();
        m.trailing_is_padding = rest.iter().enumerate().all(|(i, b)| *b == (i % 2) as u8);
        m
    }

    /// Finish: list the incomplete messages.
    pub fn finish(mut self) -> Report {
        self.report.incomplete = self
            .pending
            .iter()
            .map(|((_, mid), p)| (*mid, p.ms, p.pages.len()))
            .collect();
        self.report
    }
}

fn need<T>(v: Option<T>) -> Result<T, &'static str> {
    v.ok_or("truncated")
}

fn read_mask(c: &mut Cursor) -> Result<Vec<GnssMask>, &'static str> {
    let nsys = need(c.u(4))? as usize;
    let mut out = Vec::with_capacity(nsys);
    for _ in 0..nsys {
        let gnss_id = need(c.u(4))? as u8;
        let satm = need(c.take(40))?;
        let sigm = need(c.take(16))?;
        let cmaf = need(c.flag())?;
        let sats = bits::set_positions(&satm);
        let signals: Vec<u8> = bits::set_positions(&sigm)
            .into_iter()
            .map(|p| (p - 1) as u8)
            .collect();
        let cell_mask = if cmaf {
            let mut rows = Vec::with_capacity(sats.len());
            for _ in 0..sats.len() {
                rows.push(need(c.take(signals.len()))?);
            }
            Some(rows)
        } else {
            None
        };
        let nav_message = need(c.u(3))? as u8;
        let letter = sys_letter(gnss_id);
        out.push(GnssMask {
            gnss_id,
            satellites: sats
                .iter()
                .map(|n| match letter {
                    Some(l) => super::label(l, *n),
                    None => format!("gnss{gnss_id}:{n}"),
                })
                .collect(),
            signal_names: signals
                .iter()
                .map(|s| signal_name(gnss_id, *s).unwrap_or("reserved").to_string())
                .collect(),
            signals,
            cell_mask,
            nav_message,
        });
    }
    need(c.u(6))?; // reserved
    Ok(out)
}

fn clock_sat(sat: &str, raw: i64, mult: u8) -> ClockSat {
    let (dcc, status) = match raw {
        -4096 => (None, "not_available"),
        4095 => (None, "do_not_use"),
        v => (Some(v as f64 * 0.0025), "ok"),
    };
    ClockSat {
        sat: sat.to_string(),
        dcc_m: dcc,
        correction_m: dcc.map(|d| d * f64::from(mult)),
        status,
    }
}

fn decode_mt1(
    c: &mut Cursor,
    m: &mut Message,
    masks: &mut HashMap<u8, Vec<GnssMask>>,
) -> Result<(), &'static str> {
    let toh = need(c.u(12))? as u16;
    let f = need(c.u(6))?;
    need(c.u(4))?;
    let h = Mt1Header {
        toh,
        mask: f & 0x20 != 0,
        orbit: f & 0x10 != 0,
        clock_full: f & 0x08 != 0,
        clock_subset: f & 0x04 != 0,
        code_bias: f & 0x02 != 0,
        phase_bias: f & 0x01 != 0,
        mask_id: need(c.u(5))? as u8,
        iod_set_id: need(c.u(5))? as u8,
    };
    m.header = Some(h);
    if h.mask {
        let mk = read_mask(c)?;
        masks.insert(h.mask_id, mk.clone());
        m.mask = Some(mk);
    }
    if !(h.orbit || h.clock_full || h.clock_subset || h.code_bias || h.phase_bias) {
        return Ok(());
    }
    let Some(mask) = masks.get(&h.mask_id).cloned() else {
        return Err("no_mask");
    };
    if h.orbit {
        let vi = need(c.u(4))? as u8;
        let mut sats = Vec::new();
        for g in &mask {
            let liod = match g.gnss_id {
                0 => 8,
                2 => 10,
                _ => return Err("unknown_gnss"),
            };
            for s in &g.satellites {
                sats.push(OrbitSat {
                    sat: s.clone(),
                    iod_ref: need(c.u(liod))? as u32,
                    radial_m: need(c.scaled_na(13, 0.0025))?,
                    in_track_m: need(c.scaled_na(12, 0.008))?,
                    cross_track_m: need(c.scaled_na(12, 0.008))?,
                });
            }
        }
        m.orbit = Some(OrbitBlock {
            validity_index: vi,
            validity_s: validity_s(vi),
            sats,
        });
    }
    if h.clock_full {
        let vi = need(c.u(4))? as u8;
        let mut mults = Vec::new();
        for _ in &mask {
            mults.push(need(c.u(2))? as u8 + 1);
        }
        let mut sats = Vec::new();
        for (g, mult) in mask.iter().zip(&mults) {
            for s in &g.satellites {
                sats.push(clock_sat(s, need(c.i(13))?, *mult));
            }
        }
        m.clock_full = Some(ClockFullBlock {
            validity_index: vi,
            validity_s: validity_s(vi),
            multipliers: mults,
            sats,
        });
    }
    if h.clock_subset {
        let vi = need(c.u(4))? as u8;
        let nsub = need(c.u(4))? as usize;
        let mut systems = Vec::new();
        for _ in 0..nsub {
            let gnss_id = need(c.u(4))? as u8;
            let mult = need(c.u(2))? as u8 + 1;
            let Some(g) = mask.iter().find(|g| g.gnss_id == gnss_id) else {
                return Err("unknown_gnss");
            };
            let sub = need(c.take(g.satellites.len()))?;
            let mut sats = Vec::new();
            for (s, b) in g.satellites.iter().zip(&sub) {
                if *b == 1 {
                    sats.push(clock_sat(s, need(c.i(13))?, mult));
                }
            }
            systems.push(ClockSubsetSystem {
                gnss_id,
                multiplier: mult,
                sats,
            });
        }
        m.clock_subset = Some(ClockSubsetBlock {
            validity_index: vi,
            validity_s: validity_s(vi),
            systems,
        });
    }
    for phase in [false, true] {
        if (!phase && !h.code_bias) || (phase && !h.phase_bias) {
            continue;
        }
        let vi = need(c.u(4))? as u8;
        let mut sats = Vec::new();
        for g in &mask {
            for (i, s) in g.satellites.iter().enumerate() {
                let mut biases = Vec::new();
                for sig in g.signals_of(i) {
                    if phase {
                        let bias = need(c.scaled_na(11, 0.01))?;
                        let pdi = Some(need(c.u(2))? as u8);
                        biases.push(SignalBias {
                            signal: sig,
                            bias,
                            pdi,
                        });
                    } else {
                        biases.push(SignalBias {
                            signal: sig,
                            bias: need(c.scaled_na(11, 0.02))?,
                            pdi: None,
                        });
                    }
                }
                sats.push(BiasSat {
                    sat: s.clone(),
                    biases,
                });
            }
        }
        let b = BiasBlock {
            validity_index: vi,
            validity_s: validity_s(vi),
            sats,
        };
        if phase {
            m.phase_bias = Some(b);
        } else {
            m.code_bias = Some(b);
        }
    }
    Ok(())
}

/// Decode every frame of a file.
pub fn decode_frames(frames: &[Frame]) -> Report {
    let mut d = Decoder::default();
    for f in frames {
        d.push_frame(f);
    }
    d.finish()
}

/// Absolute message time from the time of hour and the GST of reception, both in seconds of
/// the GST week (section 7.7, Eq. 28 and 29).
pub fn message_time(toh: u16, gst_rx_s: u64) -> u64 {
    let hr = gst_rx_s / 3600;
    let t = hr * 3600 + u64::from(toh);
    if t <= gst_rx_s {
        t
    } else {
        t.saturating_sub(3600)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn generator_has_the_223_consecutive_roots() {
        let g = generator_poly();
        assert_eq!(g.len(), 224);
        assert_eq!(g[223], 1);
        for i in 1..=223 {
            let a = gf_pow_alpha(i);
            let mut acc = 0u8;
            for &c in g.iter().rev() {
                acc = gf_mul(acc, a) ^ c;
            }
            assert_eq!(acc, 0, "alpha^{i}");
        }
    }

    #[test]
    fn every_codeword_vanishes_at_the_roots_and_any_k_pages_decode() {
        // Codeword polynomial: Gamma_j is encoded page 255 - j.
        let k = 5;
        let pages: Vec<[u8; OCTETS]> = (0..k)
            .map(|p| {
                let mut a = [0u8; OCTETS];
                for (j, x) in a.iter_mut().enumerate() {
                    *x = (p * 37 + j * 11 + 3) as u8;
                }
                a
            })
            .collect();
        let enc: Vec<[u8; OCTETS]> = (1..=255u8).map(|pid| encode_page(&pages, pid)).collect();
        assert_eq!(enc[0], pages[0]);
        assert_eq!(enc[k], [0u8; OCTETS]); // pages k+1..32 carry zeros
        for i in 1..=223usize {
            let a = gf_pow_alpha(i);
            let mut acc = 0u8;
            for p in 1..=255usize {
                // Gamma_(255 - p) * a^(255 - p), Horner from the highest degree (p = 1).
                acc = gf_mul(acc, a) ^ enc[p - 1][7];
            }
            assert_eq!(acc, 0, "root {i}");
        }
        let pick = [200u8, 33, 2, 255, 90];
        let rx: Vec<(u8, [u8; OCTETS])> = pick.iter().map(|&p| (p, enc[p as usize - 1])).collect();
        assert_eq!(rs_decode(&rx).unwrap(), pages);
        assert!(rs_decode(&[(0, [0; OCTETS])]).is_none());
    }

    #[test]
    fn header_fields_and_message_time() {
        let h = page_header(0x0F_7F_37);
        assert_eq!(h.hass, 0);
        assert_eq!(h.mt, 3);
        assert_eq!(h.mid, 27);
        assert_eq!(h.ms, 32);
        assert_eq!(h.pid, 0x37);
        assert_eq!(message_time(10, 7210), 7210);
        assert_eq!(message_time(3500, 7210), 3600 + 3500);
        assert_eq!(validity_s(14), Some(3600));
        assert_eq!(validity_s(15), None);
    }
}
