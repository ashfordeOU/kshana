// SPDX-License-Identifier: AGPL-3.0-only
//! Conversion between the OEM and the OCM of CCSDS 502.0-B-3, keeping provenance.
//!
//! * [`oem_to_ocm`]: each OEM segment becomes one OCM trajectory block (`TRAJ_TYPE = CARTPV`, or
//!   `CARTPVA` with accelerations) and the OEM covariance matrices become `COV` blocks
//!   (`COV_TYPE = CARTPV`, `COV_ORDERING = LTM`). One object per message, as the OCM requires
//!   (§6.1.2).
//! * [`ocm_to_oem`]: each `CARTPV`/`CARTPVA` trajectory block becomes an OEM segment, and each
//!   `CARTPV` covariance (`LTM`, `UTM` or `FULL`) a covariance matrix of the segment whose span holds
//!   its epoch.
//!
//! Numbers are carried as the text written, so states, covariances and absolute epochs survive a
//! round trip unchanged. Relative OCM time tags are made absolute (to the microsecond). A segment's
//! START_TIME and STOP_TIME are rebuilt from its first and last data line, which is the same as the
//! source whenever the data span the segment.
//!
//! Provenance: the source header's comments, CLASSIFICATION, CREATION_DATE, ORIGINATOR and
//! MESSAGE_ID are kept, and one `COMMENT PROVENANCE ...` line is added per conversion naming the
//! source message type and its originator, message id and creation date. Earlier provenance lines
//! are kept, so a chain of conversions stays readable in the result.

use super::ephem::{read_oem, OemCov, OemDoc, OemSeg};
use super::Report;
use crate::odm::{OcmBlock, OcmMessage, OdmHeader, Section};

fn provenance(kind: &str, originator: &str, id: Option<&str>, created: &str) -> String {
    format!(
        "PROVENANCE SOURCE={kind} ORIGINATOR={originator} MESSAGE_ID={} CREATION_DATE={created} TOOL=kshana-orbit-data-convert",
        id.unwrap_or("NONE")
    )
}

/// `YYYY-MM-DDThh:mm:ss.ffffff` from days since 1950 Jan 0.0 (the [`crate::norad::epoch_days_1950`]
/// scale). Days outside 0 to 1,000,000 are clamped to that range.
pub fn iso_from_days_1950(d: f64) -> String {
    let d = if d.is_finite() {
        d.clamp(0.0, 1e6)
    } else {
        0.0
    };
    let mut whole = d.floor();
    let mut us = ((d - whole) * 86_400e6).round() as i64;
    if us >= 86_400_000_000 {
        whole += 1.0;
        us -= 86_400_000_000;
    }
    // Day 1 of 1950 is 1950-01-01; days from 1970-01-01 then the civil-from-days algorithm.
    let z = whole as i64 - 1 - 7305 + 719_468;
    let era = z.div_euclid(146_097);
    let doe = z - era * 146_097;
    let yoe = (doe - doe / 1460 + doe / 36_524 - doe / 146_096) / 365;
    let doy = doe - (365 * yoe + yoe / 4 - yoe / 100);
    let mp = (5 * doy + 2) / 153;
    let day = doy - (153 * mp + 2) / 5 + 1;
    let month = if mp < 10 { mp + 3 } else { mp - 9 };
    let year = yoe + era * 400 + i64::from(month <= 2);
    let (h, rem) = (us / 3_600_000_000, us % 3_600_000_000);
    let (m, rem) = (rem / 60_000_000, rem % 60_000_000);
    format!(
        "{year:04}-{month:02}-{day:02}T{h:02}:{m:02}:{:02}.{:06}",
        rem / 1_000_000,
        rem % 1_000_000
    )
}

fn looks_international(id: &str) -> bool {
    let b = id.as_bytes();
    b.len() >= 9
        && b[..4].iter().all(u8::is_ascii_digit)
        && b[4] == b'-'
        && b[5..8].iter().all(u8::is_ascii_digit)
        && b[8..].iter().all(u8::is_ascii_alphabetic)
}

/// Convert an OEM (KVN) to an OCM (KVN). Errors: the OEM does not read, it holds more than one
/// object, or a segment lacks what the OCM needs.
pub fn oem_to_ocm(text: &str) -> Result<String, String> {
    let mut rep = Report::new("OEM", super::ephem::STANDARD);
    let doc = read_oem(text, &mut rep);
    if let Some(f) = rep.findings.first() {
        return Err(f.message.clone());
    }
    oem_doc_to_ocm(&doc)
}

fn oem_doc_to_ocm(doc: &OemDoc) -> Result<String, String> {
    let first = doc
        .segments
        .first()
        .ok_or_else(|| crate::terr!("e-orbit-data-convert-empty"))?;
    let objects: std::collections::BTreeSet<&str> = doc
        .segments
        .iter()
        .map(|s| s.get("OBJECT_ID").unwrap_or(""))
        .collect();
    if objects.len() > 1 {
        return Err(crate::terr!(
            "e-orbit-data-convert-one-object",
            n = objects.len()
        ));
    }
    let need = |s: &OemSeg, k: &str| -> Result<String, String> {
        s.get(k)
            .map(str::to_string)
            .ok_or_else(|| crate::terr!("e-orbit-data-convert-missing", key = k))
    };
    let created = doc.get("CREATION_DATE").unwrap_or("").to_string();
    let originator = doc.get("ORIGINATOR").unwrap_or("").to_string();
    let mut comments = doc.header_comments.clone();
    comments.push(provenance(
        "OEM",
        &originator,
        doc.get("MESSAGE_ID"),
        &created,
    ));
    let header = OdmHeader {
        version: "3.0".into(),
        comments,
        classification: doc.get("CLASSIFICATION").map(str::to_string),
        creation_date: created.clone(),
        originator,
        message_id: doc.get("MESSAGE_ID").map(str::to_string),
    };
    let mut meta = Section::new();
    meta.set("OBJECT_NAME", need(first, "OBJECT_NAME")?);
    let id = need(first, "OBJECT_ID")?;
    if looks_international(&id) {
        meta.set("INTERNATIONAL_DESIGNATOR", id);
    } else {
        meta.set("OBJECT_DESIGNATOR", id);
    }
    meta.set("TIME_SYSTEM", need(first, "TIME_SYSTEM")?);
    meta.set("EPOCH_TZERO", need(first, "START_TIME")?);
    meta.set("START_TIME", need(first, "START_TIME")?);
    let last = doc.segments.last().unwrap_or(first);
    meta.set("STOP_TIME", need(last, "STOP_TIME")?);
    let mut traj = Vec::new();
    let mut cov = Vec::new();
    for s in &doc.segments {
        let mut b = OcmBlock::default();
        b.section.comments = s.meta_comments.clone();
        b.section.comments.extend(s.data_comments.iter().cloned());
        for (from, to) in [
            ("INTERPOLATION", "INTERPOLATION"),
            ("INTERPOLATION_DEGREE", "INTERPOLATION_DEGREE"),
            ("CENTER_NAME", "CENTER_NAME"),
            ("REF_FRAME", "TRAJ_REF_FRAME"),
            ("REF_FRAME_EPOCH", "TRAJ_FRAME_EPOCH"),
            ("USEABLE_START_TIME", "USEABLE_START_TIME"),
            ("USEABLE_STOP_TIME", "USEABLE_STOP_TIME"),
        ] {
            if let Some(v) = s.get(from) {
                b.section.set(to, v);
            }
        }
        let width = s.lines.first().map_or(7, |l| l.1.len());
        if s.lines.iter().any(|l| l.1.len() != width) || !(width == 7 || width == 10) {
            return Err(crate::terr!("e-orbit-data-convert-width"));
        }
        b.section
            .set("TRAJ_TYPE", if width == 10 { "CARTPVA" } else { "CARTPV" });
        b.lines = s.lines.iter().map(|l| l.1.clone()).collect();
        traj.push(b);
        let frame = s.get("REF_FRAME").unwrap_or("").to_string();
        let mut current: Option<(String, OcmBlock)> = None;
        for c in &s.covs {
            let f = c.frame.clone().unwrap_or_else(|| frame.clone());
            let epoch = c
                .epoch
                .clone()
                .ok_or_else(|| crate::terr!("e-orbit-data-convert-missing", key = "EPOCH"))?;
            if c.values.len() != 21 {
                return Err(crate::terr!("e-orbit-data-convert-width"));
            }
            if current.as_ref().is_none_or(|(cf, _)| *cf != f) {
                if let Some((_, b)) = current.take() {
                    cov.push(b);
                }
                let mut b = OcmBlock::default();
                b.section.set("COV_REF_FRAME", f.clone());
                b.section.set("COV_TYPE", "CARTPV");
                b.section.set("COV_ORDERING", "LTM");
                current = Some((f.clone(), b));
            }
            let (_, b) = current.as_mut().expect("a block was opened above");
            b.section.comments.extend(c.comments.iter().cloned());
            let mut l = vec![epoch];
            l.extend(c.values.iter().cloned());
            b.lines.push(l);
        }
        if let Some((_, b)) = current {
            cov.push(b);
        }
    }
    let m = OcmMessage {
        header,
        metadata: meta,
        traj,
        phys: None,
        cov,
        man: vec![],
        user: None,
    };
    m.to_kvn()
}

/// Convert an OCM (KVN or XML) to an OEM (KVN). Errors: the OCM does not parse, a trajectory is
/// not `CARTPV`/`CARTPVA`, or a covariance is not a `CARTPV` matrix in `LTM`, `UTM` or `FULL`.
pub fn ocm_to_oem(text: &str) -> Result<String, String> {
    let m = OcmMessage::parse(text)?;
    let meta = &m.metadata;
    let tzero = meta
        .get("EPOCH_TZERO")
        .and_then(|v| crate::norad::epoch_days_1950(v).ok());
    let abs = |tag: &str| -> Result<(String, f64), String> {
        if let Ok(d) = crate::norad::epoch_days_1950(tag) {
            return Ok((tag.to_string(), d));
        }
        let s: f64 = tag
            .parse()
            .map_err(|_| crate::terr!("e-orbit-data-convert-time", t = tag))?;
        let t0 = tzero.ok_or_else(|| crate::terr!("e-orbit-data-convert-time", t = tag))?;
        let d = t0 + s / 86_400.0;
        // The CCSDS epochs this module reads lie in 1950-2100 (days 1 to about 55,150).
        if !(0.0..=55_200.0).contains(&d) {
            return Err(crate::terr!("e-orbit-data-convert-time", t = tag));
        }
        Ok((iso_from_days_1950(d), d))
    };
    let h = &m.header;
    let mut out = String::new();
    let kv = |o: &mut String, k: &str, v: &str| o.push_str(&format!("{k:<20} = {v}\n"));
    kv(&mut out, "CCSDS_OEM_VERS", "3.0");
    for c in &h.comments {
        out.push_str(&format!("COMMENT {c}\n"));
    }
    out.push_str(&format!(
        "COMMENT {}\n",
        provenance(
            "OCM",
            &h.originator,
            h.message_id.as_deref(),
            &h.creation_date
        )
    ));
    if let Some(c) = &h.classification {
        kv(&mut out, "CLASSIFICATION", c);
    }
    kv(&mut out, "CREATION_DATE", &h.creation_date);
    kv(&mut out, "ORIGINATOR", &h.originator);
    if let Some(id) = &h.message_id {
        kv(&mut out, "MESSAGE_ID", id);
    }
    let object_name = meta.get("OBJECT_NAME").unwrap_or("UNKNOWN");
    let object_id = meta
        .get("INTERNATIONAL_DESIGNATOR")
        .or(meta.get("OBJECT_DESIGNATOR"))
        .unwrap_or("UNKNOWN");
    let time_system = meta.get("TIME_SYSTEM").unwrap_or("UTC");
    // Covariance matrices, absolute epoch, frame, 21 LTM values as text.
    let mut covs: Vec<(f64, OemCov)> = Vec::new();
    for b in &m.cov {
        let t = b.section.get("COV_TYPE").unwrap_or("");
        let ord = b.section.get("COV_ORDERING").unwrap_or("");
        if t != "CARTPV" || !matches!(ord, "LTM" | "UTM" | "FULL") {
            return Err(crate::terr!(
                "e-orbit-data-convert-cov",
                kind = t,
                ordering = ord
            ));
        }
        for l in b.lines.iter().filter(|l| !l.is_empty()) {
            let (e, d) = abs(&l[0])?;
            let vals = &l[1..];
            let ltm: Vec<String> = if ord == "LTM" {
                vals.to_vec()
            } else {
                let n = 6;
                let idx = |i: usize, j: usize| -> Option<&String> {
                    if ord == "FULL" {
                        vals.get(i * n + j)
                    } else {
                        // UTM row i holds columns i..n.
                        let start: usize = (0..i).map(|r| n - r).sum();
                        vals.get(start + (j - i))
                    }
                };
                let mut v = Vec::new();
                for i in 0..n {
                    for j in 0..=i {
                        let x = if ord == "FULL" { idx(i, j) } else { idx(j, i) };
                        v.push(x.cloned().unwrap_or_default());
                    }
                }
                v
            };
            if ltm.len() != 21 || ltm.iter().any(String::is_empty) {
                return Err(crate::terr!("e-orbit-data-convert-width"));
            }
            covs.push((
                d,
                OemCov {
                    comments: b.section.comments.clone(),
                    epoch: Some(e),
                    frame: b.section.get("COV_REF_FRAME").map(str::to_string),
                    values: ltm,
                    line: 0,
                },
            ));
        }
    }
    let n_traj = m.traj.len();
    for (ti, b) in m.traj.iter().enumerate() {
        let tt = b.section.get("TRAJ_TYPE").unwrap_or("");
        if tt != "CARTPV" && tt != "CARTPVA" {
            return Err(crate::terr!("e-orbit-data-convert-traj", kind = tt));
        }
        let mut lines = Vec::new();
        for l in b.lines.iter().filter(|l| !l.is_empty()) {
            let (e, d) = abs(&l[0])?;
            let mut t = vec![e];
            t.extend(l[1..].iter().cloned());
            lines.push((d, t));
        }
        let (Some(first), Some(last)) = (lines.first(), lines.last()) else {
            continue;
        };
        let (d0, d1) = (first.0, last.0);
        out.push_str("\nMETA_START\n");
        for c in &b.section.comments {
            out.push_str(&format!("COMMENT {c}\n"));
        }
        kv(&mut out, "OBJECT_NAME", object_name);
        kv(&mut out, "OBJECT_ID", object_id);
        kv(
            &mut out,
            "CENTER_NAME",
            b.section.get("CENTER_NAME").unwrap_or("EARTH"),
        );
        kv(
            &mut out,
            "REF_FRAME",
            b.section.get("TRAJ_REF_FRAME").unwrap_or(""),
        );
        if let Some(v) = b.section.get("TRAJ_FRAME_EPOCH") {
            kv(&mut out, "REF_FRAME_EPOCH", v);
        }
        kv(&mut out, "TIME_SYSTEM", time_system);
        kv(&mut out, "START_TIME", &first.1[0]);
        for k in ["USEABLE_START_TIME", "USEABLE_STOP_TIME"] {
            if let Some(v) = b.section.get(k) {
                kv(&mut out, k, &abs(v)?.0);
            }
        }
        kv(&mut out, "STOP_TIME", &last.1[0]);
        for k in ["INTERPOLATION", "INTERPOLATION_DEGREE"] {
            if let Some(v) = b.section.get(k) {
                kv(&mut out, k, v);
            }
        }
        out.push_str("META_STOP\n");
        for (_, t) in &lines {
            out.push_str(&t.join(" "));
            out.push('\n');
        }
        let mine: Vec<&OemCov> = covs
            .iter()
            .filter(|(d, _)| (*d >= d0 - 1e-9 || ti == 0) && (*d <= d1 + 1e-9 || ti + 1 == n_traj))
            .map(|(_, c)| c)
            .collect();
        if !mine.is_empty() {
            out.push_str("COVARIANCE_START\n");
            for c in mine {
                for cm in &c.comments {
                    out.push_str(&format!("COMMENT {cm}\n"));
                }
                kv(&mut out, "EPOCH", c.epoch.as_deref().unwrap_or(""));
                if let Some(f) = &c.frame {
                    kv(&mut out, "COV_REF_FRAME", f);
                }
                let mut k = 0;
                for i in 0..6 {
                    out.push_str(&c.values[k..k + i + 1].join(" "));
                    out.push('\n');
                    k += i + 1;
                }
            }
            out.push_str("COVARIANCE_STOP\n");
        }
    }
    Ok(out)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn iso_dates() {
        let d = crate::norad::epoch_days_1950("2024-02-29T12:34:56.789").unwrap();
        assert_eq!(iso_from_days_1950(d), "2024-02-29T12:34:56.789000");
        let d = crate::norad::epoch_days_1950("1999-12-31T23:59:59.9999999").unwrap();
        assert_eq!(iso_from_days_1950(d), "2000-01-01T00:00:00.000000");
        let d = crate::norad::epoch_days_1950("1950-01-01T00:00:00").unwrap();
        assert_eq!(iso_from_days_1950(d), "1950-01-01T00:00:00.000000");
    }
}
