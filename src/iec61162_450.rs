// SPDX-License-Identifier: AGPL-3.0-only
//! IEC 61162-450 (maritime "Lightweight Ethernet") datagrams, unwrapped to NMEA 0183 sentences
//! (roadmap A2c, maritime feed).
//!
//! On a ship's network, IEC 61162-450 carries NMEA 0183 sentences in UDP multicast datagrams. Each
//! datagram starts with a six-byte header (`UdPbC` and a NUL), then lines that may carry an NMEA 0183
//! version 4 TAG block before the sentence: `\s:GP0001,n:123*hh\$GPGGA,...*hh`. A TAG block is the text
//! between two backslashes; its own checksum is the XOR of the characters between the first backslash
//! and the `*`, as for a sentence.
//!
//! What is read: a capture of the datagram payloads, concatenated (binary, as a capture tool writes
//! them) or as text lines with or without the header (the NUL is often lost in text). Every TAG block
//! is checked; a line whose TAG checksum fails is dropped and counted. The sentences that remain go to
//! the NMEA reader unchanged. The TAG block's `c:` (UNIX time) field is reported but not used: the
//! sentences' own time fields carry the epoch, as for a plain NMEA log.
//!
//! The datagram and TAG layout here is from public descriptions of NMEA 0183 version 4 TAG blocks
//! (the gpsd project's documentation of NMEA 4.0) and the `UdPbC` header named in open-source chart
//! plotter and gateway software. No text of the IEC or NMEA standards is reproduced.
//!
//! MODELLED: checked on captures built from Kshana's own NMEA sample (`tests/iec61162_450.rs`); no
//! public ship capture with a clear licence has been found yet.

/// The header that starts every IEC 61162-450 sentence datagram.
pub const HEADER: &[u8] = b"UdPbC";

/// What unwrapping found.
#[derive(Clone, Debug, Default, PartialEq, Eq)]
pub struct Unwrapped {
    /// The NMEA 0183 sentences, one per line, in capture order.
    pub nmea: String,
    /// Datagram headers seen.
    pub datagrams: usize,
    /// Lines with a TAG block whose checksum held.
    pub tagged: usize,
    /// Lines dropped because their TAG block was malformed or its checksum failed.
    pub bad_tag: usize,
    /// The `c:` times (UNIX seconds) seen in TAG blocks, in order.
    pub tag_times: Vec<i64>,
}

fn xor(s: &[u8]) -> u8 {
    s.iter().fold(0, |a, b| a ^ b)
}

/// Check one TAG block body (`s:GP0001,n:123*hh`, without the backslashes). Returns its `c:` time
/// when present, or `Err(())` when it is malformed or its checksum fails.
fn tag(body: &str) -> Result<Option<i64>, ()> {
    let (fields, ck) = body.rsplit_once('*').ok_or(())?;
    let ck = u8::from_str_radix(ck.trim(), 16).map_err(|_| ())?;
    if xor(fields.as_bytes()) != ck {
        return Err(());
    }
    Ok(fields
        .split(',')
        .find_map(|f| f.strip_prefix("c:"))
        .and_then(|v| v.parse::<i64>().ok()))
}

/// Unwrap a capture of IEC 61162-450 datagram payloads to NMEA 0183 text.
pub fn unwrap(bytes: &[u8]) -> Unwrapped {
    let mut out = Unwrapped::default();
    let text = String::from_utf8_lossy(bytes);
    // Every header starts a new datagram; text before the first one is read as well.
    let parts: Vec<&str> = text.split("UdPbC").collect();
    out.datagrams = parts.len() - 1;
    for part in parts {
        let part = part.trim_start_matches('\0');
        for raw in part.split(['\n', '\r']) {
            let mut line = raw.trim_matches(|c: char| c == '\0' || c.is_whitespace());
            if line.is_empty() {
                continue;
            }
            if let Some(rest) = line.strip_prefix('\\') {
                let Some(end) = rest.find('\\') else {
                    out.bad_tag += 1;
                    continue;
                };
                match tag(&rest[..end]) {
                    Ok(t) => {
                        out.tagged += 1;
                        out.tag_times.extend(t);
                    }
                    Err(()) => {
                        out.bad_tag += 1;
                        continue;
                    }
                }
                line = &rest[end + 1..];
            }
            if line.starts_with('$') || line.starts_with('!') {
                out.nmea.push_str(line);
                out.nmea.push('\n');
            }
        }
    }
    out
}

/// Wrap NMEA 0183 text as IEC 61162-450 datagrams, one sentence per datagram, each with a TAG block
/// naming the source `s` and a line count `n`. Used to build test captures; Kshana never transmits.
pub fn wrap(nmea: &str, source: &str) -> Vec<u8> {
    let mut out = Vec::new();
    for (n, line) in nmea
        .lines()
        .filter(|l| l.starts_with('$') || l.starts_with('!'))
        .enumerate()
    {
        let fields = format!("s:{source},n:{}", n + 1);
        out.extend_from_slice(HEADER);
        out.push(0);
        out.extend_from_slice(
            format!("\\{fields}*{:02X}\\{line}\r\n", xor(fields.as_bytes())).as_bytes(),
        );
    }
    out
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn tag_checksum_is_checked() {
        let body = "s:GP0001,c:1609459200";
        let good = format!("{body}*{:02X}", xor(body.as_bytes()));
        assert_eq!(tag(&good), Ok(Some(1_609_459_200)));
        assert_eq!(tag(&format!("{body}*00")), Err(()));
        assert_eq!(tag(body), Err(()));
    }

    #[test]
    fn wrapped_sentences_come_back_unchanged() {
        let nmea = "$GPGGA,120000.00,5926.400,N,02445.000,E,1,08,0.9,30.0,M,0.0,M,,*4E\n$GPRMC,120000.00,A,5926.400,N,02445.000,E,0.0,0.0,110924,,,A*6C\n";
        let u = unwrap(&wrap(nmea, "GP0001"));
        assert_eq!(u.nmea, nmea);
        assert_eq!((u.datagrams, u.tagged, u.bad_tag), (2, 2, 0));
    }

    #[test]
    fn a_corrupted_tag_drops_only_its_line_and_text_without_nul_is_read() {
        let nmea = "$GPGGA,1*00\n$GPGGA,2*00\n";
        let mut cap = String::from_utf8(wrap(nmea, "GP0001"))
            .unwrap()
            .replace('\0', "");
        cap = cap.replacen("n:1*", "n:9*", 1);
        let u = unwrap(cap.as_bytes());
        assert_eq!(u.nmea, "$GPGGA,2*00\n");
        assert_eq!((u.tagged, u.bad_tag), (1, 1));
    }
}
