// SPDX-License-Identifier: AGPL-3.0-only
//! Live receiver logs (roadmap L4a): read a receiver's stream (UBX, SBF, NovAtel, RTCM 3, NMEA and the
//! other `kshana obs convert` formats) as it arrives, and give the same `kshana.obs/1` epochs a replay
//! of the recorded bytes gives, bit for bit, in bounded memory.
//!
//! How:
//! * the bytes are cut into whole frames by each format's own framing (UBX `B5 62` with a length,
//!   SBF `$@` with a length, RTCM 3 `D3` with a 10-bit length, NovAtel binary `AA 44 12` with its header
//!   and message lengths, and lines for the text formats). A frame still being written waits;
//! * after each chunk the format's reader parses a window: the frames of the first epoch (kept for the
//!   whole run, as the time anchor) and the frames since the held epoch began. Every reader keys epochs
//!   in whole milliseconds and counts `t_s` from the first key, so with the anchor in place every `t_s`
//!   is exactly the replay's;
//! * an epoch is emitted once a later one has begun (the last may still grow), and only if its `t_s` is
//!   past the last one emitted. A partial copy of an emitted epoch left in the window is never emitted
//!   again;
//! * when the window passes a size, the frames before the first possible frame of the epoch before
//!   the held one are dropped (a reader may read an epoch against the one before it). That point is
//!   the frame count when that epoch first appeared, which is never after its first frame. Byte
//!   offsets (`source_span`) past the anchor are moved back by the bytes dropped, so they point where
//!   the replay points.
//!
//! The header is sent with the first epoch. Its `skipped_records` counts what the window had skipped
//! by then, so it can differ from a replay's, which counts the whole file; the epochs do not differ.
use crate::obs::{Record, Station};

/// Frames kept in the window before the emitted ones are dropped.
const KEEP_FRAMES: usize = 4096;

/// Cut whole frames off the front of `buf`; what is left is a frame still arriving.
fn split(format: &str, buf: &mut Vec<u8>) -> Vec<Vec<u8>> {
    let mut out = Vec::new();
    let mut i = 0;
    let line = |b: &[u8], i: usize| b[i..].iter().position(|&c| c == b'\n').map(|p| i + p + 1);
    while i < buf.len() {
        let b = &buf[..];
        let end = match format {
            "ubx" if b[i] == 0xB5 => match b.get(i + 1) {
                None => None,
                Some(0x62) if b.len() >= i + 6 => {
                    Some(i + 8 + usize::from(u16::from_le_bytes([b[i + 4], b[i + 5]])))
                }
                Some(0x62) => None,
                Some(_) => Some(i + 1),
            },
            "sbf" if b[i] == b'$' => match b.get(i + 1) {
                None => None,
                Some(b'@') if b.len() >= i + 8 => {
                    let len = usize::from(u16::from_le_bytes([b[i + 6], b[i + 7]]));
                    Some(if len >= 8 && len % 4 == 0 {
                        i + len
                    } else {
                        i + 1
                    })
                }
                Some(b'@') => None,
                Some(_) => Some(i + 1),
            },
            "rtcm3" if b[i] == 0xD3 => {
                if b.len() >= i + 3 {
                    Some(i + 6 + ((usize::from(b[i + 1] & 0x03) << 8) | usize::from(b[i + 2])))
                } else {
                    None
                }
            }
            "ubx" | "sbf" | "rtcm3" => Some(i + 1), // a byte before a sync: kept, the reader skips it
            "novatel" if b[i] == 0xAA => {
                if b.len() < i + 3 {
                    None
                } else if b[i + 1] == 0x44 && b[i + 2] == 0x12 {
                    if b.len() >= i + 10 {
                        let hdr = usize::from(b[i + 3]);
                        Some(i + hdr + usize::from(u16::from_le_bytes([b[i + 8], b[i + 9]])) + 4)
                    } else {
                        None
                    }
                } else {
                    Some(i + 1)
                }
            }
            _ => line(b, i),
        };
        match end {
            Some(e) if e <= buf.len() => {
                out.push(buf[i..e].to_vec());
                i = e;
            }
            _ => break,
        }
    }
    buf.drain(..i);
    out
}

/// A live decoder for one stream.
pub struct LiveObs {
    format: String,
    station: Station,
    pending: Vec<u8>,
    anchor: Vec<Vec<u8>>,
    anchored: bool,
    window: Vec<Vec<u8>>,
    held_start: usize,
    /// Where the epoch before the held one began: kept, since a reader may read an epoch
    /// against the one before it (a marine time step, for one).
    prev_start: usize,
    held_t: Option<f64>,
    last_emitted: Option<f64>,
    header_sent: bool,
    keep: usize,
    /// Bytes dropped from the window so far, after the anchor: added back to `source_span`s.
    dropped: usize,
}

impl LiveObs {
    /// A decoder for `format` (as `kshana obs convert --format`).
    pub fn new(format: &str, station: &Station) -> Result<Self, String> {
        // Check the format name the way a replay would.
        if format != "iec61162-450"
            && serde_json::from_value::<crate::receiver_trust::LogFormat>(
                serde_json::Value::String(format.to_string()),
            )
            .is_err()
        {
            return Err(crate::terr!(
                "e-obs-unknown-format",
                format = format.to_string()
            ));
        }
        Ok(LiveObs {
            format: format.to_string(),
            station: station.clone(),
            pending: Vec::new(),
            anchor: Vec::new(),
            anchored: false,
            window: Vec::new(),
            held_start: 0,
            prev_start: 0,
            held_t: None,
            last_emitted: None,
            header_sent: false,
            keep: KEEP_FRAMES,
            dropped: 0,
        })
    }

    /// Trim once more than `n` frames are in the window (default 4096; at least 1).
    pub fn keep_frames(mut self, n: usize) -> Self {
        self.keep = n.max(1);
        self
    }

    fn parse(&self) -> Result<Vec<Record>, String> {
        let mut bytes: Vec<u8> = Vec::new();
        for f in self.anchor.iter().chain(&self.window) {
            bytes.extend_from_slice(f);
        }
        crate::obs::from_log(&self.format, &bytes, &self.station)
    }

    fn emit(&mut self, all: Vec<Record>, flush: bool) -> Vec<Record> {
        let mut header = None;
        let mut epochs = Vec::new();
        for r in all {
            match r {
                Record::Header(h) => header = Some(h),
                Record::Epoch(e) => epochs.push(e),
                Record::Alarm(_) => {}
            }
        }
        let n = epochs.len();
        let ready = if flush { n } else { n.saturating_sub(1) };
        let anchor_len: usize = self.anchor.iter().map(Vec::len).sum();
        let by = self.dropped;
        let mut out = Vec::new();
        for mut e in epochs.into_iter().take(ready) {
            // Spans are byte offsets in the parsed window; move those past the anchor back to
            // where the bytes sit in the whole stream.
            e.epoch.source_span = e.epoch.source_span.map(|[s, x]| {
                if s >= anchor_len {
                    [s + by, x + by]
                } else {
                    [s, x]
                }
            });
            if self.last_emitted.is_some_and(|t| e.epoch.t_s <= t) {
                continue;
            }
            if !self.header_sent {
                if let Some(h) = header.take() {
                    out.push(Record::Header(h));
                }
                self.header_sent = true;
            }
            self.last_emitted = Some(e.epoch.t_s);
            out.push(Record::Epoch(e));
        }
        out
    }

    /// Take the next bytes; the records that became complete.
    pub fn push(&mut self, bytes: &[u8]) -> Result<Vec<Record>, String> {
        self.pending.extend_from_slice(bytes);
        let before = self.window.len();
        let frames = split(&self.format, &mut self.pending);
        if frames.is_empty() {
            return Ok(Vec::new());
        }
        self.window.extend(frames);
        // Early in a stream the reader may refuse what it has (no epoch yet, a RINEX header not yet
        // ended): wait for more bytes. A stream that never becomes readable fails at `flush`.
        let Ok(all) = self.parse() else {
            return Ok(Vec::new());
        };
        let last_t = all.iter().rev().find_map(|r| match r {
            Record::Epoch(e) => Some(e.epoch.t_s),
            _ => None,
        });
        let n_epochs = all.iter().filter(|r| matches!(r, Record::Epoch(_))).count();
        if last_t != self.held_t {
            // A new last epoch began in this chunk: none of its frames is before `before`.
            self.held_t = last_t;
            self.prev_start = self.held_start;
            self.held_start = before;
        }
        // The anchor: the frames before the chunk in which the second epoch first appeared hold
        // only the first epoch (and anything before it, such as a RINEX header).
        if !self.anchored && n_epochs >= 2 && before > 0 {
            let candidate: Vec<Vec<u8>> = self.window[..before].to_vec();
            let mut bytes = Vec::new();
            for f in &candidate {
                bytes.extend_from_slice(f);
            }
            let first_full = first_label(&all);
            let alone = crate::obs::from_log(&self.format, &bytes, &self.station)?;
            if first_full.is_some() && first_label(&alone) == first_full {
                self.anchor = candidate;
                self.window.drain(..before);
                self.held_start = self.held_start.saturating_sub(before);
                self.prev_start = self.prev_start.saturating_sub(before);
                self.anchored = true;
            }
        }
        let out = self.emit(all, false);
        if self.anchored && self.window.len() > self.keep && self.prev_start > 0 {
            let cut = self.prev_start;
            self.dropped += self.window[..cut].iter().map(Vec::len).sum::<usize>();
            self.window.drain(..cut);
            self.held_start -= cut;
            self.prev_start = 0;
        }
        Ok(out)
    }

    /// Release the held last epoch (end of the stream). Bytes of an unfinished frame are read as
    /// they are, as a replay of the same bytes would read them.
    pub fn flush(&mut self) -> Result<Vec<Record>, String> {
        if !self.pending.is_empty() {
            self.window.push(std::mem::take(&mut self.pending));
        }
        let all = self.parse()?;
        Ok(self.emit(all, true))
    }

    /// Frames held now (anchor and window), for tests of the memory bound.
    pub fn frames_held(&self) -> usize {
        self.anchor.len() + self.window.len()
    }
}

/// The first epoch's time label and offset, to check an anchor.
fn first_label(r: &[Record]) -> Option<(Option<String>, u64)> {
    r.iter().find_map(|x| match x {
        Record::Epoch(e) => Some((e.epoch.time_label.clone(), e.epoch.t_s.to_bits())),
        _ => None,
    })
}

/// Read `input` to its end through a [`LiveObs`], writing each record as a `kshana.obs/1` line to
/// `out` as soon as it is complete (and flushing, so a reader downstream sees it at once). Returns
/// the number of epochs written.
pub fn pump(
    mut input: impl std::io::Read,
    out: &mut impl std::io::Write,
    format: &str,
    station: &Station,
) -> Result<usize, String> {
    let mut live = LiveObs::new(format, station)?;
    let mut buf = vec![0u8; 64 * 1024];
    let mut epochs = 0;
    let mut write = |recs: Vec<Record>, out: &mut dyn std::io::Write| -> Result<(), String> {
        if recs.is_empty() {
            return Ok(());
        }
        epochs += recs
            .iter()
            .filter(|r| matches!(r, Record::Epoch(_)))
            .count();
        out.write_all(crate::obs::to_jsonl(&recs)?.as_bytes())
            .and_then(|()| out.flush())
            .map_err(|e| e.to_string())
    };
    loop {
        let n = match input.read(&mut buf) {
            Ok(0) => break,
            Ok(n) => n,
            Err(e) if e.kind() == std::io::ErrorKind::Interrupted => continue,
            Err(e) => return Err(e.to_string()),
        };
        write(live.push(&buf[..n])?, out)?;
    }
    write(live.flush()?, out)?;
    Ok(epochs)
}
