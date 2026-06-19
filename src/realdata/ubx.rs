// SPDX-License-Identifier: AGPL-3.0-only
//! u-blox **UBX** binary adapter: `agc`, `jamind`, and `cn0` observations.
//!
//! UBX is the only Phase-A source of a native AGC channel. This adapter decodes the
//! framed UBX stream (sync `0xB5 0x62`, class/id, little-endian length, payload, 8-bit
//! Fletcher checksum) and pulls:
//!
//! * **UBX-MON-RF** (`0x0A 0x38`): per RF block `agcCnt` (0–8191) → `agc`, and the
//!   `jamInd` CW-jamming indicator (0–255) → `jamind`.
//! * **UBX-NAV-SAT** (`0x01 0x35`): per-satellite `cno` (dB-Hz) → `cn0`.
//!
//! Source: Jammertest 2024 UBX logs. Only checksum-valid frames are decoded; the
//! scanner resynchronises past corrupt bytes. `jamInd` rises with CW jamming
//! ([`Orient::Raw`]); `cno` falls ([`Orient::Negate`]); `agcCnt` polarity is
//! receiver-dependent (u-blox turns the AGC *down* under broadband jamming, so
//! [`Orient::Negate`] is the usual choice) and is passed by the caller.

use super::{Observation, Orient};

const SYNC1: u8 = 0xB5;
const SYNC2: u8 = 0x62;
const CLASS_MON: u8 = 0x0A;
const ID_MON_RF: u8 = 0x38;
const CLASS_NAV: u8 = 0x01;
const ID_NAV_SAT: u8 = 0x35;

/// Decode `agc`, `jamind`, and `cn0` observations from a UBX byte stream. `agc_orient`
/// sets the AGC-count polarity (see module docs). Corrupt or truncated frames are
/// skipped without panicking.
pub fn observations(bytes: &[u8], agc_orient: Orient) -> Vec<Observation> {
    let mut out = Vec::new();
    let mut i = 0usize;
    while i + 8 <= bytes.len() {
        if bytes[i] != SYNC1 || bytes[i + 1] != SYNC2 {
            i += 1;
            continue;
        }
        let class = bytes[i + 2];
        let id = bytes[i + 3];
        let len = u16::from_le_bytes([bytes[i + 4], bytes[i + 5]]) as usize;
        let frame_end = i + 6 + len + 2;
        if frame_end > bytes.len() {
            break; // incomplete trailing frame
        }
        let body = &bytes[i + 2..i + 6 + len]; // class..payload (checksum domain)
        let (ck_a, ck_b) = checksum(body);
        if ck_a != bytes[i + 6 + len] || ck_b != bytes[i + 7 + len] {
            i += 1; // bad checksum: resync one byte on
            continue;
        }
        let payload = &bytes[i + 6..i + 6 + len];
        match (class, id) {
            (CLASS_MON, ID_MON_RF) => decode_mon_rf(payload, agc_orient, &mut out),
            (CLASS_NAV, ID_NAV_SAT) => decode_nav_sat(payload, &mut out),
            _ => {}
        }
        i = frame_end;
    }
    out
}

/// 8-bit Fletcher checksum over the class/id/length/payload bytes.
fn checksum(body: &[u8]) -> (u8, u8) {
    let mut a: u8 = 0;
    let mut b: u8 = 0;
    for &byte in body {
        a = a.wrapping_add(byte);
        b = b.wrapping_add(a);
    }
    (a, b)
}

/// UBX-MON-RF: 4-byte header (version, nBlocks, reserved×2) then 24-byte blocks with
/// `agcCnt` at offset 14 (u2) and `jamInd` at offset 16 (u1).
fn decode_mon_rf(payload: &[u8], agc_orient: Orient, out: &mut Vec<Observation>) {
    if payload.len() < 4 {
        return;
    }
    let n_blocks = payload[1] as usize;
    for blk in 0..n_blocks {
        let off = 4 + blk * 24;
        if off + 24 > payload.len() {
            break;
        }
        let agc_cnt = u16::from_le_bytes([payload[off + 14], payload[off + 15]]);
        let jam_ind = payload[off + 16];
        out.push(Observation::new("agc", agc_cnt as f64, agc_orient));
        out.push(Observation::new("jamind", jam_ind as f64, Orient::Raw));
    }
}

/// UBX-NAV-SAT: 8-byte header (iTOW, version, numSvs, reserved×2) then 12-byte SV
/// records with `cno` (dB-Hz) at offset 2 (u1). Zero `cno` (untracked) is skipped.
fn decode_nav_sat(payload: &[u8], out: &mut Vec<Observation>) {
    if payload.len() < 8 {
        return;
    }
    let num_svs = payload[5] as usize;
    for sv in 0..num_svs {
        let off = 8 + sv * 12;
        if off + 12 > payload.len() {
            break;
        }
        let cno = payload[off + 2];
        if cno > 0 {
            out.push(Observation::new("cn0", cno as f64, Orient::Negate));
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Wrap a class/id/payload into a complete, checksum-valid UBX frame.
    fn frame(class: u8, id: u8, payload: &[u8]) -> Vec<u8> {
        let len = payload.len() as u16;
        let mut body = vec![class, id, len.to_le_bytes()[0], len.to_le_bytes()[1]];
        body.extend_from_slice(payload);
        let (a, b) = checksum(&body);
        let mut f = vec![SYNC1, SYNC2];
        f.extend_from_slice(&body);
        f.push(a);
        f.push(b);
        f
    }

    /// MON-RF payload with one block: agcCnt = 2000, jamInd = 130.
    fn mon_rf_payload(agc_cnt: u16, jam_ind: u8) -> Vec<u8> {
        let mut p = vec![0u8, 1, 0, 0]; // version, nBlocks=1, reserved
        let mut block = vec![0u8; 24];
        block[14] = agc_cnt.to_le_bytes()[0];
        block[15] = agc_cnt.to_le_bytes()[1];
        block[16] = jam_ind;
        p.extend_from_slice(&block);
        p
    }

    /// NAV-SAT payload with two SVs of the given C/N0 values.
    fn nav_sat_payload(cnos: &[u8]) -> Vec<u8> {
        let mut p = vec![0u8, 0, 0, 0, 1, cnos.len() as u8, 0, 0]; // iTOW,ver,numSvs,res
        for (i, &cno) in cnos.iter().enumerate() {
            let mut sv = vec![0u8; 12];
            sv[0] = 0; // gnssId
            sv[1] = (5 + i) as u8; // svId
            sv[2] = cno;
            p.extend_from_slice(&sv);
        }
        p
    }

    #[test]
    fn decodes_agc_and_jamind_from_mon_rf() {
        let bytes = frame(CLASS_MON, ID_MON_RF, &mon_rf_payload(2000, 130));
        let obs = observations(&bytes, Orient::Negate);
        let agc: Vec<_> = obs.iter().filter(|o| o.detector == "agc").collect();
        let jam: Vec<_> = obs.iter().filter(|o| o.detector == "jamind").collect();
        assert_eq!(agc.len(), 1);
        assert_eq!(agc[0].raw, 2000.0);
        assert_eq!(agc[0].score, -2000.0); // negated
        assert_eq!(jam.len(), 1);
        assert_eq!(jam[0].raw, 130.0);
        assert_eq!(jam[0].score, 130.0); // raw: higher = more jamming
    }

    #[test]
    fn decodes_cn0_from_nav_sat_skipping_untracked() {
        // Three SVs: 42, 0 (untracked), 30 dB-Hz. The zero must be dropped.
        let bytes = frame(CLASS_NAV, ID_NAV_SAT, &nav_sat_payload(&[42, 0, 30]));
        let obs = observations(&bytes, Orient::Negate);
        let cn0: Vec<_> = obs.iter().filter(|o| o.detector == "cn0").collect();
        assert_eq!(cn0.len(), 2);
        assert_eq!(cn0[0].raw, 42.0);
        assert_eq!(cn0[0].score, -42.0);
        assert_eq!(cn0[1].raw, 30.0);
    }

    #[test]
    fn decodes_a_concatenated_mixed_stream() {
        let mut stream = frame(CLASS_NAV, ID_NAV_SAT, &nav_sat_payload(&[45, 40]));
        stream.extend(frame(CLASS_MON, ID_MON_RF, &mon_rf_payload(1500, 200)));
        let obs = observations(&stream, Orient::Negate);
        assert_eq!(obs.iter().filter(|o| o.detector == "cn0").count(), 2);
        assert_eq!(obs.iter().filter(|o| o.detector == "agc").count(), 1);
        assert_eq!(obs.iter().filter(|o| o.detector == "jamind").count(), 1);
    }

    #[test]
    fn a_corrupt_byte_before_a_valid_frame_is_skipped() {
        let mut stream = vec![0x00, 0xFF, 0xB5]; // junk + a false sync start
        stream.extend(frame(CLASS_MON, ID_MON_RF, &mon_rf_payload(2000, 130)));
        let obs = observations(&stream, Orient::Negate);
        assert_eq!(obs.iter().filter(|o| o.detector == "agc").count(), 1);
    }

    #[test]
    fn a_bad_checksum_frame_is_rejected() {
        let mut bytes = frame(CLASS_MON, ID_MON_RF, &mon_rf_payload(2000, 130));
        let n = bytes.len();
        bytes[n - 1] ^= 0xFF; // corrupt CK_B
        assert!(observations(&bytes, Orient::Negate).is_empty());
    }

    #[test]
    fn a_truncated_trailing_frame_does_not_panic() {
        let mut bytes = frame(CLASS_MON, ID_MON_RF, &mon_rf_payload(2000, 130));
        bytes.truncate(bytes.len() - 5); // chop the tail
        let _ = observations(&bytes, Orient::Negate); // must not panic
    }
}
