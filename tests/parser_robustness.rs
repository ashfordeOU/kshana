// SPDX-License-Identifier: AGPL-3.0-only
//! Every byte and text parser in kshana survives arbitrary, truncated and mutated input: it
//! returns a value or an error, never panics, and never makes one huge allocation because a
//! field in the input said so. See docs/ROBUSTNESS.md.
//!
//! The fuzzer is deterministic (SplitMix64 from a fixed seed per target), so a failure is
//! reproducible from the test name alone. Each target is driven with:
//!
//! * every line-boundary prefix and (for small seeds) every byte prefix of each seed;
//! * `KSHANA_FUZZ_CASES` mutated copies of the seeds (default 600): bit flips, interesting
//!   bytes, deletions, insertions, duplicated chunks, line swaps and numeric fields replaced by
//!   extreme values (huge, negative, `NaN`, `1e308`);
//! * for framed binary formats (UBX, SBF, RTCM 3), randomly filled frames with *valid*
//!   framing and checksums, so the payload decoders are reached and not only the framers.
//!
//! A counting global allocator records, per thread, the largest single allocation request and
//! the peak growth of live heap during each call. A call on an input of at most 64 KiB that
//! asks for more than `MAX_SINGLE_ALLOC` bytes at once, or grows the heap by more than
//! `MAX_LIVE_GROWTH`, fails the test with the input that caused it.
//!
//! PIN-SCOPE:    the large integer literals here are extreme field values fed to the parsers
//!               (u64::MAX, 20-digit and 1.3e18 overflow probes), not expected outputs.
//! PIN-EXCLUDES: any parser's decoded result; no test here pins a byte-for-byte or hashed output.

use std::alloc::{GlobalAlloc, Layout, System};
use std::cell::{Cell, RefCell};
use std::collections::BTreeMap;
use std::panic::{self, AssertUnwindSafe};
use std::sync::Once;

// ---------------------------------------------------------------------------------
// Allocation accounting
// ---------------------------------------------------------------------------------

/// Largest single allocation a parser may request for an input of at most 64 KiB.
const MAX_SINGLE_ALLOC: usize = 64 << 20;
/// Largest growth of live heap during one parser call.
const MAX_LIVE_GROWTH: isize = 256 << 20;

struct Counting;

thread_local! {
    static TRACK: Cell<bool> = const { Cell::new(false) };
    static MAX_REQ: Cell<usize> = const { Cell::new(0) };
    static LIVE: Cell<isize> = const { Cell::new(0) };
    static PEAK: Cell<isize> = const { Cell::new(0) };
    static LAST_PANIC: RefCell<Option<String>> = const { RefCell::new(None) };
}

fn on_alloc(size: usize) {
    let _ = TRACK.try_with(|t| {
        if t.get() {
            let _ = MAX_REQ.try_with(|m| m.set(m.get().max(size)));
            let _ = LIVE.try_with(|l| {
                let v = l.get() + size as isize;
                l.set(v);
                let _ = PEAK.try_with(|p| p.set(p.get().max(v)));
            });
        }
    });
}

fn on_dealloc(size: usize) {
    let _ = TRACK.try_with(|t| {
        if t.get() {
            let _ = LIVE.try_with(|l| l.set(l.get() - size as isize));
        }
    });
}

unsafe impl GlobalAlloc for Counting {
    unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
        on_alloc(layout.size());
        unsafe { System.alloc(layout) }
    }
    unsafe fn alloc_zeroed(&self, layout: Layout) -> *mut u8 {
        on_alloc(layout.size());
        unsafe { System.alloc_zeroed(layout) }
    }
    unsafe fn dealloc(&self, ptr: *mut u8, layout: Layout) {
        on_dealloc(layout.size());
        unsafe { System.dealloc(ptr, layout) }
    }
    unsafe fn realloc(&self, ptr: *mut u8, layout: Layout, new_size: usize) -> *mut u8 {
        on_dealloc(layout.size());
        on_alloc(new_size);
        unsafe { System.realloc(ptr, layout, new_size) }
    }
}

#[global_allocator]
static GLOBAL: Counting = Counting;

static HOOK: Once = Once::new();

fn quiet_panics() {
    HOOK.call_once(|| {
        panic::set_hook(Box::new(|info| {
            let mut msg = info.to_string();
            // Name the kshana frames, since a panic inside the standard library (a slice index,
            // a capacity overflow) does not say which parser it came from.
            let bt = std::backtrace::Backtrace::force_capture().to_string();
            for l in bt.lines().filter(|l| l.contains("kshana::")).take(4) {
                msg.push_str("\n      in ");
                msg.push_str(l.trim());
            }
            let _ = LAST_PANIC.try_with(|p| *p.borrow_mut() = Some(msg));
        }));
    });
}

// ---------------------------------------------------------------------------------
// Deterministic mutation fuzzer
// ---------------------------------------------------------------------------------

struct Rng(u64);

impl Rng {
    fn new(name: &str) -> Self {
        // FNV-1a of the target name: a fixed, distinct stream per target.
        let mut h: u64 = 0xcbf2_9ce4_8422_2325;
        for b in name.bytes() {
            h ^= u64::from(b);
            h = h.wrapping_mul(0x0100_0000_01b3);
        }
        Rng(h)
    }
    fn next(&mut self) -> u64 {
        self.0 = self.0.wrapping_add(0x9e37_79b9_7f4a_7c15);
        let mut z = self.0;
        z = (z ^ (z >> 30)).wrapping_mul(0xbf58_476d_1ce4_e5b9);
        z = (z ^ (z >> 27)).wrapping_mul(0x94d0_49bb_1331_11eb);
        z ^ (z >> 31)
    }
    fn below(&mut self, n: usize) -> usize {
        if n == 0 {
            0
        } else {
            (self.next() % n as u64) as usize
        }
    }
    fn byte(&mut self) -> u8 {
        self.next() as u8
    }
}

const INTERESTING: &[u8] = &[
    0, 0xff, 0x7f, 0x80, b'0', b'9', b'-', b'+', b' ', b'\n', b'\r', b'\t', b'.', b'E', b'D', b'e',
    b'*', b',', b'=', b'#', b'>', b'<', b'"', b'$', b'@', 0xb5, 0x62, 0xd3, 0xaa,
];

const EXTREMES: &[&str] = &[
    "99999999999999999999",
    "4294967295",
    "4294967296",
    "65535",
    "-1",
    "-2147483648",
    "18446744073709551615",
    "NaN",
    "inf",
    "-inf",
    "1e308",
    "-1e308",
    "1e-320",
    "0",
    "00",
    "",
    "9999999",
    "2147483647",
    "1.0D+99",
    "60",
    "61",
    "24",
    "13",
    "32",
];

/// One mutation of `v`, chosen at random.
fn mutate(rng: &mut Rng, v: &mut Vec<u8>) {
    let n = v.len();
    match rng.below(10) {
        0 if n > 0 => {
            let i = rng.below(n);
            v[i] ^= 1 << rng.below(8);
        }
        1 if n > 0 => {
            let i = rng.below(n);
            v[i] = INTERESTING[rng.below(INTERESTING.len())];
        }
        2 if n > 0 => {
            let a = rng.below(n);
            let b = (a + 1 + rng.below(64)).min(n);
            v.drain(a..b);
        }
        3 => {
            let at = rng.below(n + 1);
            let k = 1 + rng.below(16);
            let ins: Vec<u8> = (0..k).map(|_| rng.byte()).collect();
            v.splice(at..at, ins);
        }
        4 if n > 0 => v.truncate(rng.below(n)),
        5 if n > 0 => {
            let a = rng.below(n);
            let b = (a + 1 + rng.below(256)).min(n);
            let chunk = v[a..b].to_vec();
            let at = rng.below(n + 1);
            v.splice(at..at, chunk);
        }
        6 => {
            // Swap two lines.
            let mut lines: Vec<Vec<u8>> = v.split(|&b| b == b'\n').map(|l| l.to_vec()).collect();
            if lines.len() > 1 {
                let a = rng.below(lines.len());
                let b = rng.below(lines.len());
                lines.swap(a, b);
                *v = lines.join(&b'\n');
            }
        }
        7 | 8 => {
            // Replace a run of digits (a numeric field) with an extreme value.
            let digits: Vec<usize> = (0..n).filter(|&i| v[i].is_ascii_digit()).collect();
            if !digits.is_empty() {
                let s = digits[rng.below(digits.len())];
                let mut e = s;
                while e < n && (v[e].is_ascii_digit() || v[e] == b'.') {
                    e += 1;
                }
                let mut b = s;
                while b > 0 && v[b - 1].is_ascii_digit() {
                    b -= 1;
                }
                let rep = EXTREMES[rng.below(EXTREMES.len())].as_bytes().to_vec();
                v.splice(b..e, rep);
            }
        }
        _ if n > 0 => {
            // Overwrite a few bytes with random ones.
            let i = rng.below(n);
            let end = (i + 1 + rng.below(8)).min(n);
            for b in &mut v[i..end] {
                *b = rng.byte();
            }
        }
        _ => v.push(rng.byte()),
    }
}

fn cases() -> usize {
    std::env::var("KSHANA_FUZZ_CASES")
        .ok()
        .and_then(|s| s.parse().ok())
        .unwrap_or(600)
}

/// The failures of one target, keyed by panic location so each bug is reported once.
#[derive(Default)]
struct Failures(BTreeMap<String, (String, Vec<u8>)>);

impl Failures {
    fn add(&mut self, key: String, what: String, input: &[u8]) {
        let e = self.0.entry(key).or_insert_with(|| (what, input.to_vec()));
        if input.len() < e.1.len() {
            e.1 = input.to_vec();
        }
    }
}

/// Run `f` on `input`, recording a panic or an allocation over the caps.
fn check<F: Fn(&[u8])>(f: &F, input: &[u8], fails: &mut Failures) {
    MAX_REQ.with(|m| m.set(0));
    LIVE.with(|l| l.set(0));
    PEAK.with(|p| p.set(0));
    TRACK.with(|t| t.set(true));
    let r = panic::catch_unwind(AssertUnwindSafe(|| f(input)));
    TRACK.with(|t| t.set(false));
    let (max_req, peak) = (MAX_REQ.with(Cell::get), PEAK.with(Cell::get));
    if r.is_err() {
        let msg = LAST_PANIC
            .with(|p| p.borrow_mut().take())
            .unwrap_or_else(|| "panic".into());
        // Key on the location part ("panicked at src/x.rs:1:2:").
        let key = msg.lines().next().unwrap_or("").to_string();
        fails.add(key, msg, input);
    } else if input.len() <= 64 << 10 && max_req > MAX_SINGLE_ALLOC {
        fails.add(
            format!("single allocation of {max_req} bytes"),
            format!(
                "one allocation of {max_req} bytes for a {}-byte input",
                input.len()
            ),
            input,
        );
    } else if input.len() <= 64 << 10 && peak > MAX_LIVE_GROWTH {
        fails.add(
            format!("live heap growth {peak}"),
            format!(
                "live heap grew {peak} bytes for a {}-byte input",
                input.len()
            ),
            input,
        );
    }
}

fn show(input: &[u8]) -> String {
    let s = String::from_utf8_lossy(input);
    let s: String = s.chars().take(600).collect();
    format!("{s:?}")
}

/// A generator of framed inputs for a binary protocol.
type Generator<'a> = &'a dyn Fn(&mut Rng) -> Vec<u8>;

/// Drive one target with prefixes, mutations and (optionally) generated frames.
fn fuzz<F: Fn(&[u8])>(name: &str, seeds: &[Vec<u8>], gen: Option<Generator<'_>>, f: F) {
    quiet_panics();
    let mut rng = Rng::new(name);
    let mut fails = Failures::default();
    // Empty and tiny inputs.
    for i in [&b""[..], b"\n", b"\0", b" ", b"\xff\xff\xff\xff"] {
        check(&f, i, &mut fails);
    }
    for seed in seeds {
        check(&f, seed, &mut fails);
        // Every line-boundary prefix.
        for (i, &b) in seed.iter().enumerate() {
            if b == b'\n' {
                check(&f, &seed[..i], &mut fails);
                check(&f, &seed[..=i], &mut fails);
            }
        }
        // Every byte prefix of a small seed, a sample of a large one.
        let step = (seed.len() / 512).max(1);
        for k in (0..seed.len()).step_by(step) {
            check(&f, &seed[..k], &mut fails);
        }
    }
    let n = cases();
    for c in 0..n {
        let mut v = match (gen, seeds.is_empty()) {
            (Some(g), _) if c % 2 == 0 => g(&mut rng),
            (Some(g), true) => g(&mut rng),
            (_, false) => seeds[rng.below(seeds.len())].clone(),
            (None, true) => (0..rng.below(512)).map(|_| rng.byte()).collect(),
        };
        let m = 1 + rng.below(4);
        let skip_mutation = gen.is_some() && c % 4 == 0;
        if !skip_mutation {
            for _ in 0..m {
                mutate(&mut rng, &mut v);
            }
        }
        v.truncate(64 << 10);
        check(&f, &v, &mut fails);
    }
    if !fails.0.is_empty() {
        let mut report = format!("{name}: {} distinct failure(s)\n", fails.0.len());
        for (what, input) in fails.0.values() {
            report.push_str(&format!(
                "--- {what}\n    input ({} bytes): {}\n",
                input.len(),
                show(input)
            ));
        }
        // The quiet hook swallows panic messages, so print the report first.
        eprintln!("{report}");
        panic!("{name}: see the report above");
    }
}

fn text(b: &[u8]) -> std::borrow::Cow<'_, str> {
    String::from_utf8_lossy(b)
}

/// The first `n` lines of a fixture, as a seed.
fn head(path: &str, n: usize) -> Vec<u8> {
    let p = std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join(path);
    let s = std::fs::read(&p).unwrap_or_else(|e| panic!("{}: {e}", p.display()));
    let mut out = Vec::new();
    for (i, l) in s.split(|&b| b == b'\n').enumerate() {
        if i >= n {
            break;
        }
        out.extend_from_slice(l);
        out.push(b'\n');
    }
    out
}

/// The first `n` bytes of a binary fixture.
fn bytes(path: &str, n: usize) -> Vec<u8> {
    let p = std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join(path);
    let mut s = std::fs::read(&p).unwrap_or_else(|e| panic!("{}: {e}", p.display()));
    s.truncate(n);
    s
}

// ---------------------------------------------------------------------------------
// Frame generators for binary formats (valid framing, random payload)
// ---------------------------------------------------------------------------------

fn ubx_frame(class: u8, id: u8, payload: &[u8]) -> Vec<u8> {
    let mut f = vec![0xb5, 0x62, class, id];
    f.extend_from_slice(&(payload.len() as u16).to_le_bytes());
    f.extend_from_slice(payload);
    let (mut a, mut b) = (0u8, 0u8);
    for &x in &f[2..] {
        a = a.wrapping_add(x);
        b = b.wrapping_add(a);
    }
    f.push(a);
    f.push(b);
    f
}

fn gen_ubx(rng: &mut Rng) -> Vec<u8> {
    // NAV-PVT, NAV-TIMEGPS, NAV-SAT, NAV-STATUS, SEC-SIG, MON-RF, RXM-SFRBX, NAV-SIG.
    const KINDS: &[(u8, u8, usize)] = &[
        (0x01, 0x07, 92),
        (0x01, 0x20, 16),
        (0x01, 0x35, 8),
        (0x01, 0x03, 16),
        (0x27, 0x09, 4),
        (0x0a, 0x38, 4),
        (0x02, 0x13, 8),
        (0x01, 0x43, 8),
    ];
    let mut out = Vec::new();
    for _ in 0..1 + rng.below(6) {
        let (c, i, base) = KINDS[rng.below(KINDS.len())];
        let len = match rng.below(4) {
            0 => base,
            1 => base + 12 * rng.below(20),
            2 => base + 24 * rng.below(8),
            _ => rng.below(300),
        };
        let mut p: Vec<u8> = (0..len).map(|_| rng.byte()).collect();
        // Keep counts in repeated-block messages small or huge at random.
        if len > 5 && rng.below(2) == 0 {
            p[5] = rng.byte();
        }
        out.extend(ubx_frame(c, i, &p));
    }
    out
}

fn crc16_ccitt(data: &[u8]) -> u16 {
    let mut crc: u16 = 0;
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

fn gen_sbf(rng: &mut Rng) -> Vec<u8> {
    // PVTGeodetic 4007, MeasEpoch 4027, RFStatus 4092, ReceiverTime 5914, GALRawINAV 4023.
    const IDS: &[u16] = &[4007, 4027, 4092, 5914, 4023];
    let mut out = Vec::new();
    for _ in 0..1 + rng.below(4) {
        let id = IDS[rng.below(IDS.len())] | ((rng.below(4) as u16) << 13);
        let body_len = 4 * rng.below(64);
        let len = (8 + body_len) as u16;
        let mut blk = vec![b'$', b'@', 0, 0];
        blk.extend_from_slice(&id.to_le_bytes());
        blk.extend_from_slice(&len.to_le_bytes());
        for _ in 0..body_len {
            blk.push(rng.byte());
        }
        if body_len >= 8 && rng.below(2) == 0 {
            // TOW and WNc in range; N and SBLength small.
            let tow = (rng.next() % 604_800_000) as u32;
            blk[8..12].copy_from_slice(&tow.to_le_bytes());
            blk[12..14].copy_from_slice(&((rng.below(4096)) as u16).to_le_bytes());
        }
        let crc = crc16_ccitt(&blk[4..]);
        blk[2..4].copy_from_slice(&crc.to_le_bytes());
        out.extend(blk);
    }
    out
}

fn crc24q(data: &[u8]) -> u32 {
    let mut crc: u32 = 0;
    for &b in data {
        crc ^= u32::from(b) << 16;
        for _ in 0..8 {
            crc <<= 1;
            if crc & 0x0100_0000 != 0 {
                crc ^= 0x0186_4cfb;
            }
        }
    }
    crc & 0x00ff_ffff
}

fn gen_rtcm3(rng: &mut Rng) -> Vec<u8> {
    // MSM1-7 of each system, SSR orbit/clock, station and ephemeris messages.
    const TYPES: &[u16] = &[
        1074, 1077, 1084, 1087, 1094, 1097, 1124, 1127, 1114, 1117, 1005, 1006, 1019, 1020, 1042,
        1046, 1057, 1058, 1060, 1240, 1243, 1264, 4076, 1013, 1033, 1071, 1072, 1073, 1075, 1076,
        1081, 1093, 1105, 1116, 1121, 1132, 1136,
    ];
    let mut out = Vec::new();
    for _ in 0..1 + rng.below(4) {
        let t = TYPES[rng.below(TYPES.len())];
        let len = match rng.below(3) {
            0 => 8 + rng.below(32),
            1 => 20 + rng.below(200),
            _ => rng.below(1024),
        };
        let mut p: Vec<u8> = (0..len.max(2)).map(|_| rng.byte()).collect();
        p[0] = (t >> 4) as u8;
        p[1] = ((t as u8 & 0x0f) << 4) | (p[1] & 0x0f);
        let mut f = vec![0xd3, ((p.len() >> 8) & 0x03) as u8, p.len() as u8];
        f.extend_from_slice(&p);
        let c = crc24q(&f);
        f.extend_from_slice(&[(c >> 16) as u8, (c >> 8) as u8, c as u8]);
        out.extend(f);
    }
    out
}

// ---------------------------------------------------------------------------------
// Targets: GNSS observation, navigation and product files
// ---------------------------------------------------------------------------------

#[test]
fn rinex_navigation() {
    let seeds = vec![
        head("tests/fixtures/igs/BRDC00WRD_R_20181330000_01D_GN.rnx", 60),
        head("tests/fixtures/igs/BRDM00DLR_R_20130010000_01D_MN.rnx", 80),
    ];
    fuzz("rinex nav", &seeds, None, |b| {
        let _ = kshana::rinex::parse_nav(&text(b));
    });
    fuzz("rinex glonass nav", &seeds, None, |b| {
        let _ = kshana::glonass::parse_glonass_nav(&text(b));
    });
}

#[test]
fn rinex_observation() {
    let seeds = vec![head(
        "tests/fixtures/igs/ABMF00GLP_R_20181330000_01D_30S_MO.rnx",
        90,
    )];
    fuzz("rinex obs", &seeds, None, |b| {
        let _ = kshana::rinex_obs::parse_obs(&text(b));
    });
    fuzz("rinex obs cn0", &seeds, None, |b| {
        let _ = kshana::realdata::rinex::cn0_observations(&text(b));
    });
}

#[test]
fn sp3_orbits() {
    let seeds = vec![head("tests/fixtures/igs/igs_sample.sp3", 70)];
    fuzz("sp3", &seeds, None, |b| {
        let _ = kshana::sp3::parse_sp3(&text(b));
        let _ = kshana::sp3::parse_sp3_accuracy(&text(b));
    });
}

#[test]
fn rinex_clock_antex_dcb() {
    let clk = vec![
        head("tests/fixtures/clock_log/rinex_clk_304.clk", 60),
        head(
            "tests/fixtures/joint_pvt_precise_itrf_rtklib_oracle/com_2018133_GE.clk",
            60,
        ),
    ];
    fuzz("rinex clock", &clk, None, |b| {
        let t = text(b);
        let _ = kshana::precise_products::parse_clock_rinex(&t);
        let _ = kshana::realdata::clk::rinex_clock_time_system(&t);
        let _ = kshana::realdata::clk::rinex_clock_satellites(&[&t]);
        let _ = kshana::realdata::clk::rinex_clock_series(&[&t], "G01", 30.0);
    });
    let atx = vec![head(
        "tests/fixtures/joint_pvt_precise_itrf_rtklib_oracle/igs14_2018133_GE_sat.atx",
        80,
    )];
    fuzz("antex", &atx, None, |b| {
        let _ = kshana::precise_products::parse_antex_satellites(&text(b));
    });
    let dcb = vec![head(
        "tests/fixtures/joint_pvt_precise_itrf_rtklib_oracle/P1C11805.DCB",
        40,
    )];
    fuzz("code dcb", &dcb, None, |b| {
        let _ = kshana::precise_products::parse_code_dcb(&text(b));
    });
}

#[test]
fn ionex_maps() {
    let seeds = vec![head("tests/fixtures/ionex_code_gim/synthetic/map.18i", 120)];
    fuzz("ionex", &seeds, None, |b| {
        let _ = kshana::ionex::parse_ionex(&text(b));
        let _ = kshana::ionex::parse_ionex_file(&text(b));
    });
}

const BIAS_SINEX: &str = "%=BIA 1.00 COD 2018:133:00000 COD 2018:133:00000 2018:134:00000 R 00000002\n\
+BIAS/SOLUTION\n\
*BIAS SVN_ PRN STATION__ OBS1 OBS2 BIAS_START____ BIAS_END______ UNIT __ESTIMATED_VALUE____ _STD_DEV___\n\
 DSB  G063 G01           C1C  C1W  2018:133:00000 2018:134:00000 ns   -1.0230                0.0050\n\
 OSB  G063 G01           C1C       2018:133:00000 2018:134:00000 ns    3.1000                0.0100\n\
-BIAS/SOLUTION\n\
%=ENDBIA\n";

#[test]
fn bias_sinex() {
    fuzz("bias sinex", &[BIAS_SINEX.as_bytes().to_vec()], None, |b| {
        let _ = kshana::bias_sinex::read(&text(b));
    });
}

#[test]
fn eop_series() {
    let seeds = vec![b"26 1 1 61041.00 I  0.123456 0.000010  0.345678 0.000010  I-0.0123456 0.0000050  0.1234 0.0050  I    -0.123    0.050    -0.012    0.050  0.123000  0.345000 -0.0123400\n26 1 2 61042.00 P  0.124 0.0001  0.346 0.0001  P-0.0124 0.00001\n".to_vec()];
    fuzz("eop", &seeds, None, |b| {
        let t = text(b);
        let _ = kshana::eop::parse_all(&t);
        let _ = kshana::eop::parse_all_predicted(&t);
        for l in t.lines() {
            let _ = kshana::eop::parse_bulletin_b_ut1(l);
            let _ = kshana::eop::parse_bulletin_b_pm(l);
        }
    });
}

// ---------------------------------------------------------------------------------
// Time transfer and clock logs
// ---------------------------------------------------------------------------------

const CGGTTS: &str = "CGGTTS   GENERIC DATA FORMAT VERSION = 2E\n\
SAT CL  MJD  STTIME TRKL ELV AZTH   REFSV      SRSV     REFSYS    SRSYS  DSG IOE MDTR SMDT MDIO SMDI MSIO SMSI ISG FR HC FRC CK\n\
G04 FF 60672 001400  780 227  856    -5033017    -95       -4834    -35   45 200  211   41  406   64  406   64  33  0  0 L3P 4F\n\
G07 FF 60672 001400  780 687  856      139047    -95       -4782    -35   45 200  211   41  406   64  406   64  33  0  0 L3P 46\n";

const CIRT: &str = "CIRCULAR T 999                                   ISSN 1143-1393\n\
2030 JANUARY 01, 07h UTC\n\n\
1 - Difference between UTC and its local realizations UTC(k) and corresponding uncertainties.\n\n\
Date 2029    0h UTC         DEC  1   DEC  6   Uncertainty/ns Notes\n\
       MJD                   62000    62005     uA    uB    u\n\
Laboratory k                       [UTC-UTC(k)]/ns\n\n\
AAA  (Somewhere)              10.5     -2.0    0.2   3.0   3.0\n\
BBB  (Other Place)              -        4.1    0.7    NC     -\n\n\
2 - Something else\n";

#[test]
fn time_transfer_files() {
    fuzz("cggtts", &[CGGTTS.as_bytes().to_vec()], None, |b| {
        let f = kshana::cggtts::read_tracks(&text(b));
        let _ = kshana::cggtts::all_in_view(&f.tracks, None);
        let _ = kshana::cggtts::common_view(&f.tracks, &f.tracks);
    });
    fuzz("circular t", &[CIRT.as_bytes().to_vec()], None, |b| {
        let _ = kshana::realdata::clk::parse_circular_t_section1(&text(b));
    });
    fuzz(
        "bipm utclab",
        &[b"# header\n 60000   1.5  0.3\n60005 -\n60010 -2.25 x\n".to_vec()],
        None,
        |b| {
            let _ = kshana::realdata::clk::parse_bipm_utclab(&text(b));
        },
    );
}

#[test]
fn clock_logs() {
    use kshana::clock_log::{ClockLogFormat, ClockLogInput, GapPolicy};
    let seeds = vec![
        head("tests/fixtures/clock_log/rinex_clk_304.clk", 50),
        head("tests/fixtures/clock_log/ticc_timestamp.txt", 50),
        head("tests/fixtures/clock_log/timelab_phase_ns.txt", 50),
        CGGTTS.as_bytes().to_vec(),
        b"ptp4l[1.000]: master offset -12 s2 freq +3 path delay 400\nptp4l[2.000]: master offset 7 s2 freq +3 path delay 401\n1700000000.000000001#1\n1700000001.000000003#2\n".to_vec(),
    ];
    for name in kshana::clock_log::FORMAT_NAMES {
        let fmt = ClockLogFormat::from_name(name).expect("format");
        for gaps in [GapPolicy::Refuse, GapPolicy::Longest, GapPolicy::Linear] {
            let inp = ClockLogInput {
                format: name.to_string(),
                ..Default::default()
            };
            fuzz(&format!("clock log {name} {gaps:?}"), &seeds, None, |b| {
                let t = text(b);
                let _ = kshana::clock_log::parse(fmt, &t, &inp, gaps);
                if gaps == GapPolicy::Refuse {
                    for l in t.lines() {
                        let _ = kshana::clock_log::read_line(fmt, l);
                    }
                }
            });
        }
    }
}

// ---------------------------------------------------------------------------------
// Receiver logs (NMEA, UBX, SBF, RTCM 3, NovAtel, SBP, GREIS, Unicore, ...)
// ---------------------------------------------------------------------------------

fn receiver(format: kshana::receiver_trust::LogFormat, b: &[u8]) {
    let _ = kshana::receiver_trust::ingest::read_log(format, b);
}

#[test]
fn receiver_nmea() {
    use kshana::receiver_trust::LogFormat;
    let seeds = vec![
        head("tests/fixtures/maritime_trust/voyage.nmea", 60),
        head("tests/fixtures/maritime_trust/antimeridian.nmea", 30),
    ];
    fuzz("nmea", &seeds, None, |b| receiver(LogFormat::Nmea, b));
    fuzz("iec 61162-450", &seeds, None, |b| {
        let _ = kshana::iec61162_450::unwrap(b);
    });
}

#[test]
fn receiver_ubx() {
    use kshana::receiver_trust::LogFormat;
    fuzz("ubx", &[], Some(&gen_ubx), |b| {
        receiver(LogFormat::Ubx, b);
        let _ = kshana::realdata::ubx::observations(b, kshana::realdata::Orient::Negate);
        let _ = kshana::osnma::ubx::pages_from_ubx(b);
    });
}

#[test]
fn receiver_sbf() {
    use kshana::receiver_trust::LogFormat;
    fuzz("sbf", &[], Some(&gen_sbf), |b| receiver(LogFormat::Sbf, b));
}

#[test]
fn receiver_rtcm3() {
    use kshana::receiver_trust::LogFormat;
    let seeds = vec![
        bytes("tests/fixtures/rtcm_ssr/pygpsdata-RTCM3.log", 4096),
        bytes("tests/fixtures/rtcm_ssr/pygpsdata-1240-1264.log", 4096),
        bytes("tests/fixtures/rtcm_ssr/pygpsdata-NTRIP-4076.log", 4096),
    ];
    fuzz("rtcm3", &seeds, Some(&gen_rtcm3), |b| {
        receiver(LogFormat::Rtcm3, b);
        let _ = kshana::receiver_trust::machines::rtcm3_obs::decode(b);
        let _ = kshana::rtcm_ssr::read_stream(b);
    });
}

#[test]
fn receiver_other_binary() {
    use kshana::receiver_trust::LogFormat;
    for f in [
        LogFormat::Novatel,
        LogFormat::Sbp,
        LogFormat::Greis,
        LogFormat::Unicore,
    ] {
        fuzz(&format!("receiver {f:?}"), &[], None, |b| receiver(f, b));
    }
}

#[test]
fn receiver_unicore_interference_logs() {
    use kshana::receiver_trust::LogFormat;
    // The N4 manual's ASCII example lines and the binary interference vector (E17).
    let seeds = vec![
        bytes("conformance/connect/reader-unicore-ascii/input.unc", 4096),
        bytes(
            "conformance/connect/reader-unicore-interference/input.unc",
            4096,
        ),
    ];
    fuzz("unicore interference", &seeds, None, |b| {
        receiver(LogFormat::Unicore, b)
    });
}

#[test]
fn iq_frontend_diagnosis() {
    use kshana::iq::acq::AcqConfig;
    use kshana::iq::frontdiag::{diagnose, DiagConfig};
    use kshana::iq::io::format::{decode_samples, SampleFormat};
    // Any bytes, read as 8-bit I/Q, through the front-end diagnosis (no codes: the statistics).
    let spec = kshana::iq::SampleSpec {
        fs_hz: 1.0e5,
        center_hz: 0.0,
        if_hz: 0.0,
    };
    let acq = AcqConfig {
        coherent_periods: 1,
        noncoherent: 1,
        doppler_max_hz: 0.0,
        doppler_step_hz: 1.0,
        pfa: 1e-3,
    };
    let seed = (0..512u32)
        .map(|k| (k * 37 % 251) as u8)
        .collect::<Vec<_>>();
    fuzz("iq frontdiag", &[seed], None, |b| {
        let mut src = kshana::iq::VecSource::new(spec, decode_samples(SampleFormat::CI8, b, 1.0));
        let _ = diagnose(
            &mut src,
            SampleFormat::CI8,
            &[],
            &acq,
            &DiagConfig::default(),
        );
    });
}

#[test]
fn receiver_other_text() {
    use kshana::receiver_trust::LogFormat;
    let rinex = head(
        "tests/fixtures/igs/ABMF00GLP_R_20181330000_01D_30S_MO.rnx",
        60,
    );
    fuzz("receiver rinex", &[rinex], None, |b| {
        receiver(LogFormat::Rinex, b)
    });
    let pos = head(
        "tests/fixtures/gnss_wettzell_2025055/oracle/rtklib_spp.pos",
        40,
    );
    fuzz("rtklib pos", &[pos], None, |b| {
        receiver(LogFormat::RtklibPos, b)
    });
    let android = b"# Raw,utcTimeMillis,TimeNanos,LeapSecond,TimeUncertaintyNanos,FullBiasNanos,BiasNanos,BiasUncertaintyNanos,DriftNanosPerSecond,DriftUncertaintyNanosPerSecond,HardwareClockDiscontinuityCount,Svid,TimeOffsetNanos,State,ReceivedSvTimeNanos,ReceivedSvTimeUncertaintyNanos,Cn0DbHz,PseudorangeRateMetersPerSecond,PseudorangeRateUncertaintyMetersPerSecond,AccumulatedDeltaRangeState,AccumulatedDeltaRangeMeters,AccumulatedDeltaRangeUncertaintyMeters,CarrierFrequencyHz,CarrierCycles,CarrierPhase,CarrierPhaseUncertainty,MultipathIndicator,SnrInDb,ConstellationType,AgcDb\nRaw,1700000000000,1000,18,0,-1300000000000000000,0.5,1,0,1,0,5,0,16399,1000,10,42.5,0,0,0,0,0,1575420000,,,,0,,1,3.5\nFix,gps,48.1,11.5,500,0,10,0,1700000000000\n".to_vec();
    fuzz("android", std::slice::from_ref(&android), None, |b| {
        receiver(LogFormat::Android, b);
        let _ =
            kshana::realdata::gnsslogger::observations(&text(b), kshana::realdata::Orient::Negate);
    });
    let sdr = b"{\"type\":\"Monitor\",\"channel_id\":1,\"PRN\":5,\"system\":\"G\",\"signal\":\"1C\",\"CN0_dB_hz\":42.0,\"TOW_at_current_symbol_ms\":1000,\"fs\":4000000}\n".to_vec();
    fuzz("gnss-sdr", &[sdr], None, |b| {
        receiver(LogFormat::GnssSdr, b)
    });
}

#[test]
fn observation_files() {
    let rec = b"{\"schema\":\"kshana.obs/1\",\"t\":\"2026-01-01T00:00:00Z\",\"station\":\"x\",\"kind\":\"cn0\",\"sat\":\"G01\",\"value\":42.0}\n".to_vec();
    fuzz("kshana.obs check", &[rec], None, |b| {
        let _ = kshana::obs::check(&text(b));
    });
}

// ---------------------------------------------------------------------------------
// Orbit messages (TLE, OMM, OEM, OPM, AEM, APM, TDM, NDM XML)
// ---------------------------------------------------------------------------------

#[test]
fn tle_sets() {
    let seeds = vec![
        head("tests/fixtures/celestrak/gps-ops_2026-06-07.txt", 30),
        head("tests/fixtures/sgp4/SGP4-VER.TLE", 30),
    ];
    fuzz("tle", &seeds, None, |b| {
        let t = text(b);
        let _ = kshana::tle::parse_set(&t);
        let _ = kshana::tle::parse_propagators(&t);
        let _ = kshana::tle::parse_propagators_report(&t, kshana::tle::ParseOpts::default());
        let lines: Vec<&str> = t.lines().collect();
        for w in lines.windows(2) {
            let _ = kshana::tle::parse_tle(w[0], w[1]);
            let _ = kshana::tle::parse_tle_identity(w[0]);
            let _ = kshana::tle::parse_line2(w[1]);
            let _ = kshana::tle::tle_checksum(w[0]);
        }
    });
}

const OMM_KVN: &str = "CCSDS_OMM_VERS = 3.0\nCREATION_DATE = 2026-11-14T00:00:00\nORIGINATOR = TEST\n\
OBJECT_NAME = TEST SAT\nOBJECT_ID = 2026-999A\nCENTER_NAME = EARTH\nREF_FRAME = TEME\nTIME_SYSTEM = UTC\n\
MEAN_ELEMENT_THEORY = SGP4\nEPOCH = 2026-318T12:00:00.000\nMEAN_MOTION = 15.5\nECCENTRICITY = 0.0001\n\
INCLINATION = 51.64\nRA_OF_ASC_NODE = 100.0\nARG_OF_PERICENTER = 90.0\nMEAN_ANOMALY = 270.0\n\
EPHEMERIS_TYPE = 0\nCLASSIFICATION_TYPE = U\nNORAD_CAT_ID = 270001\nELEMENT_SET_NO = 999\nREV_AT_EPOCH = 5\n\
BSTAR = 0.0001\nMEAN_MOTION_DOT = 0.0\nMEAN_MOTION_DDOT = 0.0\n";

#[test]
fn drone_logs() {
    use kshana::drone_pnt::epochs::{encode_dataflash, encode_ulog, load, GnssEpoch};
    let rows: Vec<GnssEpoch> = (0..6)
        .map(|k| GnssEpoch {
            t_s: 1.0 + k as f64 * 0.2,
            instance: (k % 2) as u8,
            fix_type: 3,
            lat_deg: Some(47.4),
            lon_deg: Some(8.5),
            eph_m: Some(1.5),
            jam_ind: Some(40.0),
            spoofing_state: Some(1),
            rx_time_s: Some(1.7e9 + k as f64),
            ..GnssEpoch::default()
        })
        .collect();
    let cfg = kshana::drone_pnt::prearm::PrearmConfig::default();
    let seeds = vec![
        encode_dataflash(&rows, Some(1.5)),
        encode_ulog(&rows, Some(1.5)),
    ];
    fuzz("dataflash and ulog pre-arm", &seeds, None, |b| {
        let _ = kshana::drone_pnt::dataflash::read(b, &["GPS", "GPA", "UBX1", "ARM"]);
        if let Ok(log) = load(b) {
            let _ = kshana::drone_pnt::prearm::check(&log, &cfg);
        }
    });
    let jsonl = b"{\"t_s\":1,\"fix_type\":3,\"lat_deg\":47.4,\"lon_deg\":8.5}\n{\"t_s\":2,\"armed\":true}\n".to_vec();
    let trace = b"{\"t\":0,\"est_x\":1}\n{\"t\":0.1,\"est_x\":null,\"est_x_replay\":2}\n".to_vec();
    fuzz("drone jsonl and traces", &[jsonl, trace], None, |b| {
        if let Ok(log) = load(b) {
            let _ = kshana::drone_pnt::prearm::check(&log, &cfg);
        }
        if let Ok(tr) = kshana::drone_pnt::estimator_cases::Trace::from_jsonl(&text(b)) {
            for (case, _) in kshana::drone_pnt::estimator_cases::CASES {
                let _ = kshana::drone_pnt::estimator_cases::run_case(
                    case,
                    &tr,
                    &serde_json::Value::Null,
                );
            }
        }
    });
}

#[test]
fn norad_alpha5_and_omm() {
    let tle = b"1 A0001U 26001A   26318.50000000  .00000000  00000-0  00000-0 0  9990\n2 A0001  51.6400 100.0000 0001000  90.0000 270.0000 15.50000000    05\n".to_vec();
    fuzz("alpha-5", &[tle], None, |b| {
        let t = text(b);
        for tok in t.split_whitespace() {
            let _ = kshana::norad::decode(tok);
        }
        for l in t.lines() {
            let _ = kshana::tle::parse_tle_identity(l);
        }
    });
    fuzz("omm to sgp4", &[OMM_KVN.as_bytes().to_vec()], None, |b| {
        if let Ok(m) = kshana::odm::OmmMessage::parse(&text(b)) {
            let _ = kshana::norad::tle_from_omm(&m);
        }
        let _ = kshana::norad::epoch_days_1950(&text(b));
    });
}

#[test]
fn ais_integrity_inputs() {
    let csv = vec![
        head("tests/fixtures/ais_integrity/patterns.csv", 60),
        head("tests/fixtures/ais_integrity/berth_drift.csv", 40),
    ];
    fuzz("ais-integrity csv", &csv, None, |b| {
        let mut inp = kshana::ais_integrity::Input::new();
        if inp.read_csv(b).is_ok() {
            let p = kshana::ais_integrity::Params::PREREGISTERED_V1;
            let an = kshana::ais_integrity::analyse(&inp, &p, None, &[]);
            let _ = an.to_jsonl(&p, &inp.stats);
        }
    });
    fuzz(
        "ais-integrity places",
        &[head("tests/fixtures/ais_integrity/places.csv", 4)],
        None,
        |b| {
            let _ = kshana::ais_integrity::read_places(b);
        },
    );
}

#[test]
fn orbit_data_checks_and_monitors() {
    let fx = |p: &str| {
        std::fs::read(format!("{}/tests/fixtures/{p}", env!("CARGO_MANIFEST_DIR"))).unwrap()
    };
    let none = std::collections::BTreeMap::new();
    let cdms = vec![
        fx("orbit_data/cdm_508_b1_example_3_6_3.cdm"),
        fx("orbit_data/cdm_508_b1_example_4_4.xml"),
    ];
    fuzz("cdm check", &cdms, None, |b| {
        let (m, _) = kshana::orbit_data::cdm::validate(&text(b), &none);
        let _ = m.to_kvn();
    });
    let oem = vec![
        fx("ccsds_cov/kshana_cov_leo.oem"),
        fx("ccsds/oem_502_b3_figG11.oem"),
    ];
    let p = kshana::orbit_data::ephem::Profile {
        min_span_days: Some(1.0),
        max_gap_s: Some(60.0),
    };
    fuzz("oem check and convert", &oem, None, |b| {
        let _ = kshana::orbit_data::ephem::check_oem(&text(b), p);
        if let Ok(o) = kshana::orbit_data::convert::oem_to_ocm(&text(b)) {
            let _ = kshana::orbit_data::convert::ocm_to_oem(&o);
        }
    });
    let ocm = vec![
        fx("odm_orekit_oracle/kshana/C05.kvn"),
        fx("odm_orekit_oracle/kshana/C02.xml"),
    ];
    fuzz("ocm check and convert", &ocm, None, |b| {
        let _ = kshana::orbit_data::ephem::check_ocm(&text(b), p);
        let _ = kshana::orbit_data::convert::ocm_to_oem(&text(b));
    });
    let tles = vec![
        fx("orbit_data/gp_audit.tle"),
        fx("orbit_data/gp_source_b.tle"),
    ];
    fuzz("gp audit", &tles, None, |b| {
        let sets = kshana::orbit_data::gp_quality::read_sets(&text(b));
        let _ = kshana::orbit_data::gp_quality::audit(&sets, Default::default());
        let o = kshana::orbit_data::gp_quality::CompareOpts {
            hours: 1.0,
            ..Default::default()
        };
        let _ = kshana::orbit_data::gp_quality::compare(&sets, &sets, o);
    });
}

#[test]
fn ccsds_messages() {
    let oem = vec![
        head("tests/fixtures/ccsds/oem_502_b3_figG11.oem", 80),
        head("tests/fixtures/interop/external_leo.oem", 60),
    ];
    fuzz("oem", &oem, None, |b| {
        let _ = kshana::oem::parse_oem(&text(b));
        let _ = kshana::oem::parse_covariance_block(&text(b));
    });
    let tdm = vec![head("tests/fixtures/ccsds/tdm_503_b2_figE9.tdm", 80)];
    fuzz("tdm", &tdm, None, |b| {
        let _ = kshana::ccsds_tdm::TdmFile::parse(&text(b));
    });
    let adm = vec![
        head("tests/fixtures/adm_orekit_oracle/kshana/A01.kvn", 80),
        head("tests/fixtures/adm_orekit_oracle/kshana/P01.kvn", 80),
    ];
    fuzz("adm", &adm, None, |b| {
        let t = text(b);
        let _ = kshana::adm::AemMessage::parse(&t);
        let _ = kshana::adm::ApmMessage::parse(&t);
        let _ = kshana::adm::epoch_seconds(&t);
    });
    let opm = b"CCSDS_OPM_VERS = 2.0\nCREATION_DATE = 2026-01-01T00:00:00\nORIGINATOR = X\nOBJECT_NAME = SAT\nOBJECT_ID = 2026-001A\nCENTER_NAME = EARTH\nREF_FRAME = GCRF\nTIME_SYSTEM = UTC\nEPOCH = 2026-01-01T00:00:00\nX = 7000.0\nY = 0.0\nZ = 0.0\nX_DOT = 0.0\nY_DOT = 7.5\nZ_DOT = 0.0\n".to_vec();
    fuzz("odm", &[opm, OMM_KVN.as_bytes().to_vec()], None, |b| {
        let t = text(b);
        let _ = kshana::odm::OpmMessage::parse(&t);
        let _ = kshana::odm::OmmMessage::parse(&t);
        let _ = kshana::odm::OcmMessage::parse(&t);
    });
    let xml = b"<?xml version=\"1.0\"?>\n<ndm><omm id=\"CCSDS_OMM_VERS\" version=\"2.0\"><header><CREATION_DATE>2026</CREATION_DATE></header><body a='1'>x &amp; y</body></omm></ndm>\n".to_vec();
    fuzz("ndm xml", &[xml], None, |b| {
        let _ = kshana::ndm_xml::parse(&text(b));
    });
}

// ---------------------------------------------------------------------------------
// Other byte protocols
// ---------------------------------------------------------------------------------

#[test]
fn other_protocols() {
    let c37 = vec![bytes("tests/fixtures/c37118/stream.bin", 4096)];
    fuzz("c37.118", &c37, None, |b| {
        let _ = kshana::c37118::read_stream(b);
    });
    let ast = vec![bytes("tests/fixtures/asterix_cat021/blocks.bin", 4096)];
    fuzz("asterix cat021", &ast, None, |b| {
        let _ = kshana::asterix_cat021::read(b);
    });
    let pkt = kshana::space_packet::encode_packet(
        0,
        false,
        true,
        0x123,
        kshana::space_packet::SequenceFlags::Unsegmented,
        7,
        &[1, 2, 3, 4, 5, 6, 7, 8],
    )
    .expect("packet");
    fuzz("space packet", &[pkt], None, |b| {
        let _ = kshana::space_packet::decode_packet(b);
    });
    let ptp = kshana::ptp_mgmt::get_request(0x2000, 1, 0);
    fuzz("ptp management", &[ptp], None, |b| {
        let _ = kshana::ptp_mgmt::decode(b);
        let _ = kshana::ptp_mgmt::parse_pmc(&text(b));
    });
    let n2k = b"(1700000000.000000) can0 09F80103#1122334455667788\n(1700000000.100000) can0 09F8020A#FF00112233445566\n".to_vec();
    fuzz("nmea 2000 candump", &[n2k], None, |b| {
        let _ = kshana::n2k::convert(&text(b));
    });
    let sigmf = br#"{"global":{"core:datatype":"ci16_le","core:sample_rate":2048000,"core:version":"1.0.0"},"captures":[{"core:sample_start":0,"core:frequency":1575420000}],"annotations":[]}"#.to_vec();
    fuzz("sigmf meta", std::slice::from_ref(&sigmf), None, |b| {
        let _ = kshana::sigmf::parse_meta(&text(b));
    });
    fuzz("sigmf read", &[sigmf], None, |b| {
        let meta = std::str::from_utf8(b).unwrap_or("{}");
        let _ = kshana::sigmf::read(meta, b, 1.0);
    });
    fuzz("leo navmsg frame", &[], None, |b| {
        let _ = kshana::leo_navmsg::codec::decode(b);
    });
    fuzz("odf", &[], None, |b| {
        let _ = kshana::odf::parse_odf(b);
    });
}

// ---------------------------------------------------------------------------------
// Other text formats read from outside (almanacs, data products, logs)
// ---------------------------------------------------------------------------------

#[test]
fn other_text_formats() {
    let yuma = b"******** Week 345 almanac for PRN-01 ********\nID:                         01\nHealth:                     000\nEccentricity:               0.1234E-001\nTime of Applicability(s):  405504.0000\nOrbital Inclination(rad):   0.9580\nRate of Right Ascen(r/s):  -0.7863E-008\nSQRT(A)  (m 1/2):           5153.6\nRight Ascen at Week(rad):  -0.1234E+001\nArgument of Perigee(rad):   0.7\nMean Anom(rad):             0.2\nAf0(s):                     0.1E-003\nAf1(s/s):                   0.0E+000\nweek:                        345\n\n".to_vec();
    fuzz("yuma almanac", &[yuma], None, |b| {
        let _ = kshana::interference_map::almanac_hdop::Almanac::parse_yuma(&text(b), 2400);
    });
    let dem = b"# tile\n-90 -80 -180 180 3 3\n1 2 3\n4 5 6\n7 8 9\n".to_vec();
    fuzz("lola dem", &[dem], None, |b| {
        let _ = kshana::realdata::lola_dem::DemTile::parse(&text(b));
    });
    let crd = b"h1 CRD  2 2026 11 14 12\nh2 APOL 7045 1 1 0 0\nh3 LRO 1 2 3 0 2\nh4 1 2026 11 14 0 0 0 2026 11 14 1 0 0 0 0 0 0 0 2 0\n11 3600.0 2.5 apollo15 2 30 10 2.0 0.0 0.0 0.0 0 1 0.0\nh8\nh9\n".to_vec();
    fuzz("llr crd", &[crd], None, |b| {
        let _ = kshana::realdata::llr_crd::parse_crd("x", &text(b));
    });
    let lugre = b"# t, prn, cn0\n1.0 5 42.0 1 2 3\n2.0 5 41.5 1 2 3\n".to_vec();
    fuzz("lugre", &[lugre], None, |b| {
        let t = text(b);
        let _ = kshana::realdata::lugre::parse_raw(&t);
        let _ = kshana::realdata::lugre::parse_acq(&t);
        let _ = kshana::realdata::lugre::parse_nav(&t);
        let _ = kshana::realdata::lugre::parse_clk(&t);
        let _ = kshana::realdata::lugre::parse_iqs_sdrx(&t);
        let _ = kshana::realdata::lugre::IqsHeader::parse(b);
    });
    let xml = b"<?xml version=\"1.0\"?>\n<metadata><system freqbase=\"1\"><band id=\"L1\" centerfreq=\"1575420000\"/></system><file><lane><block sizeword=\"1\" endian=\"Little\"><chunk sizeword=\"1\" countwords=\"1\" endian=\"Little\" padding=\"None\" wordalign=\"Left\"><lump><stream id=\"s\" ratefactor=\"1\" quantization=\"2\" packedbits=\"2\" alignment=\"Left\" format=\"Sign\" encoding=\"SM\"><band id=\"L1\"/></stream></lump></chunk></block></lane></file></metadata>\n".to_vec();
    fuzz("ion sdr xml", &[xml], None, |b| {
        let t = text(b);
        let _ = kshana::realdata::ion_sdr::parse_xml(&t);
        let _ = kshana::realdata::ion_sdr::parse_sdrx(&t);
    });
    let grid = b"time,sat,el,az,cn0\n0,G01,45,120,42\n1,G01,45,121,41\n".to_vec();
    fuzz("satgrid and scint", &[grid], None, |b| {
        let t = text(b);
        let _ = kshana::realdata::satgrid::parse(&t);
        let _ = kshana::realdata::scint50::parse_log(&t);
    });
    let shadr = b"   4.9028001224452998E+03,   4.282837000000000E+04,   1.0E+00,   2,   2,  1,   0.0,   0.0\n    2,    0, -2.0E-04,  0.0, 1E-10, 0.0\n    2,    1,  1.0E-10,  1.0E-10, 1E-10, 1E-10\n    2,    2,  2.0E-05,  1.0E-06, 1E-10, 1E-10\n".to_vec();
    fuzz("pds shadr", &[shadr], None, |b| {
        let _ = kshana::gravity_sh::SphericalHarmonicField::from_shadr(&text(b), 4);
    });
    let pages = b"# gst, svid, page\n1234567,11,0123456789abcdef0123456789abcdef\n".to_vec();
    fuzz("osnma pages", &[pages], None, |b| {
        let t = text(b);
        let _ = kshana::osnma::input::parse_pages(&t);
        let _ = kshana::osnma::input::parse_vector_csv(&t, 0);
    });
    let iso = b"2026-11-14T12:00:00.000Z\n2026-11-14T23:59:60Z\n".to_vec();
    fuzz("timestamps", &[iso], None, |b| {
        let t = text(b);
        for l in t.lines() {
            let _ = kshana::telemetry::time::parse_rfc3339_utc(l);
            let _ = kshana::telemetry::sample::parse_live_line(l);
            let _ = kshana::norad::epoch_days_1950(l);
        }
    });
}

#[test]
fn oscillator_inputs() {
    let seeds: Vec<Vec<u8>> = [
        "vibration",
        "holdover-temperature-step",
        "holdover-ramp-and-shock",
        "select",
        "raim-aid",
        "datasheet",
    ]
    .iter()
    .map(|n| bytes(&format!("examples/oscillator/{n}.json"), 4096))
    .collect();
    fuzz("oscillator inputs", &seeds, None, |b| {
        let t = text(b);
        for part in ["vibration", "holdover", "select", "raim-aid", "datasheet"] {
            let _ = kshana::oscillator::run_json(part, &t);
        }
    });
}

#[test]
fn interference_environment_files() {
    let seed = head("examples/interference-env/l1-mixed.toml", 60);
    fuzz("interference-env toml", &[seed], None, |b| {
        if let Ok(env) = toml::from_str::<kshana::interference_env::Environment>(&text(b)) {
            let _ = kshana::interference_env::evaluate(&env);
        }
    });
}
