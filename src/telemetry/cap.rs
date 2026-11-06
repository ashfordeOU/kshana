// SPDX-License-Identifier: AGPL-3.0-only
//! OASIS Common Alerting Protocol 1.2 messages from the GNSS trust stream (roadmap A4).
//!
//! One CAP `alert` is written each time the trust band changes after calibration:
//! * nominal → degraded or untrusted: `msgType` `Alert`;
//! * degraded ↔ untrusted: `Update`, referencing the previous message;
//! * back to nominal: `Update` with `urgency` `Past`, the all-clear, referencing the previous message.
//!
//! The message says what Kshana observed (the band, the monitors behind it, the score and the epoch) for an
//! area the operator names: a circle around the receiver's reported position when the stream carries
//! one, else around the station position given in the configuration. `status` and `scope` are the
//! operator's choice and have no default, so an exercise is never sent as `Actual` by accident. The
//! advisory statement is part of every `description`.
//!
//! The XML is checked against the OASIS CAP 1.2 schema in `tests/telemetry_cap.rs` (when `xmllint` and
//! the schema are present) and parsed in every test run.
use super::sample::{Band, TrustSample};
use std::fmt::Write;

/// The operator's settings for CAP messages.
#[derive(Clone, Debug, PartialEq)]
pub struct CapConfig {
    /// `sender`: an identifier of the sending system, for example `kshana@station.example`.
    pub sender: String,
    /// `status`: `Actual`, `Exercise`, `System`, `Test` or `Draft`.
    pub status: String,
    /// `scope`: `Public`, `Restricted` or `Private`.
    pub scope: String,
    /// `areaDesc`: a name for the area.
    pub area_desc: String,
    /// Station position (lat, lon degrees) when the stream carries none.
    pub station: Option<(f64, f64)>,
    /// Radius of the area circle, km.
    pub radius_km: f64,
    /// UTC time of `t_s = 0`, as seconds since 1970, to date each message.
    pub t0_unix_s: i64,
}

const STATUS: [&str; 5] = ["Actual", "Exercise", "System", "Test", "Draft"];
const SCOPE: [&str; 3] = ["Public", "Restricted", "Private"];

fn esc(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
        .replace('"', "&quot;")
}

fn iso(unix: f64) -> String {
    let secs = unix.floor() as i64;
    let days = secs.div_euclid(86_400);
    let sod = secs.rem_euclid(86_400);
    // Civil date from days since 1970-01-01 (Howard Hinnant's algorithm).
    let z = days + 719_468;
    let era = z.div_euclid(146_097);
    let doe = z - era * 146_097;
    let yoe = (doe - doe / 1460 + doe / 36_524 - doe / 146_096) / 365;
    let doy = doe - (365 * yoe + yoe / 4 - yoe / 100);
    let mp = (5 * doy + 2) / 153;
    let d = doy - (153 * mp + 2) / 5 + 1;
    let m = if mp < 10 { mp + 3 } else { mp - 9 };
    let y = yoe + era * 400 + i64::from(m <= 2);
    format!(
        "{y:04}-{m:02}-{d:02}T{:02}:{:02}:{:02}+00:00",
        sod / 3600,
        sod / 60 % 60,
        sod % 60
    )
}

/// CAP messages for the band changes in `samples` (in time order). Returns an error when the
/// configuration is not valid CAP.
pub fn alerts(samples: &[TrustSample], cfg: &CapConfig) -> Result<Vec<String>, String> {
    if !STATUS.contains(&cfg.status.as_str()) {
        return Err(crate::terr!(
            "e-telemetry-cap-bad-status",
            v = cfg.status.clone()
        ));
    }
    if !SCOPE.contains(&cfg.scope.as_str()) {
        return Err(crate::terr!(
            "e-telemetry-cap-bad-scope",
            v = cfg.scope.clone()
        ));
    }
    if cfg.sender.trim().is_empty() || cfg.sender.contains([' ', ',', '<', '&']) {
        return Err(crate::terr!("e-telemetry-cap-bad-sender"));
    }
    if !(cfg.radius_km.is_finite() && cfg.radius_km > 0.0) {
        return Err(crate::terr!("e-telemetry-cap-bad-radius"));
    }
    let mut out = Vec::new();
    let mut prev_band = Band::Nominal;
    let mut prev_ref: Option<String> = None;
    for s in samples {
        let b = match s.band {
            Band::Calibrating | Band::Unknown => continue,
            b => b,
        };
        if b == prev_band {
            continue;
        }
        let at = cfg.t0_unix_s as f64 + s.t_s;
        let sent = iso(at);
        let id = format!("kshana-{}-{}", at.floor() as i64, out.len() + 1);
        let pos = s.position.map(|p| (p.lat_deg, p.lon_deg)).or(cfg.station);
        let Some((lat, lon)) = pos else {
            return Err(crate::terr!("e-telemetry-cap-no-position"));
        };
        let (msg_type, urgency, severity, certainty) = match (prev_ref.is_some(), b) {
            (false, Band::Untrusted) => ("Alert", "Immediate", "Severe", "Observed"),
            (false, _) => ("Alert", "Expected", "Moderate", "Observed"),
            (true, Band::Nominal) => ("Update", "Past", "Minor", "Observed"),
            (true, Band::Untrusted) => ("Update", "Immediate", "Severe", "Observed"),
            (true, _) => ("Update", "Expected", "Moderate", "Observed"),
        };
        let mut x = String::new();
        let _ = write!(
            x,
            "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<alert xmlns=\"urn:oasis:names:tc:emergency:cap:1.2\">\n  <identifier>{}</identifier>\n  <sender>{}</sender>\n  <sent>{sent}</sent>\n  <status>{}</status>\n  <msgType>{msg_type}</msgType>\n  <scope>{}</scope>\n",
            esc(&id),
            esc(&cfg.sender),
            cfg.status,
            cfg.scope
        );
        if let Some(r) = &prev_ref {
            let _ = writeln!(x, "  <references>{}</references>", esc(r));
        }
        let headline =
            crate::i18n::in_english(|| crate::t!("telemetry-cap-headline", band = b.label()));
        let mut desc = crate::i18n::in_english(|| {
            crate::t!(
                "telemetry-cap-description",
                band = b.label(),
                prev = prev_band.label(),
                t = format!("{:.3}", s.t_s)
            )
        });
        if !s.reasons.is_empty() {
            desc.push(' ');
            desc.push_str(&crate::i18n::in_english(|| {
                crate::t!("telemetry-cap-reasons", reasons = s.reasons.join(", "))
            }));
        }
        desc.push(' ');
        desc.push_str(&crate::i18n::in_english(|| {
            crate::t!("telemetry-cap-advisory")
        }));
        let _ = write!(
            x,
            "  <info>\n    <language>en</language>\n    <category>Infra</category>\n    <event>{}</event>\n    <urgency>{urgency}</urgency>\n    <severity>{severity}</severity>\n    <certainty>{certainty}</certainty>\n    <senderName>Kshana</senderName>\n    <headline>{}</headline>\n    <description>{}</description>\n",
            esc(&crate::i18n::in_english(|| crate::t!("telemetry-cap-event"))),
            esc(&headline),
            esc(&desc)
        );
        if let Some(sc) = s.score {
            let _ = writeln!(
                x,
                "    <parameter>\n      <valueName>trustScore</valueName>\n      <value>{sc:.1}</value>\n    </parameter>"
            );
        }
        let _ = write!(
            x,
            "    <parameter>\n      <valueName>trustBand</valueName>\n      <value>{}</value>\n    </parameter>\n    <area>\n      <areaDesc>{}</areaDesc>\n      <circle>{lat:.6},{lon:.6} {:.3}</circle>\n    </area>\n  </info>\n</alert>\n",
            b.label(),
            esc(&cfg.area_desc),
            cfg.radius_km
        );
        out.push(x);
        prev_ref = Some(format!("{},{},{}", cfg.sender, id, sent));
        prev_band = b;
    }
    Ok(out)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn dates_are_utc_iso_with_offset() {
        assert_eq!(iso(0.0), "1970-01-01T00:00:00+00:00");
        assert_eq!(iso(1_735_689_600.9), "2025-01-01T00:00:00+00:00");
        assert_eq!(iso(951_782_400.0 + 86_399.0), "2000-02-29T23:59:59+00:00");
    }
}
