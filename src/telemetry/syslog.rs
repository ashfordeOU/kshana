// SPDX-License-Identifier: AGPL-3.0-only
//! Syslog output for SIEM ingestion: ArcSight CEF and IBM QRadar LEEF 2.0 payloads in an
//! RFC 5424 syslog envelope. The field mapping is documented in `docs/TRUST-TELEMETRY.md`.
//!
//! Formatting is pure (the timestamp is passed in) so the tests pin exact bytes.

use super::sample::{Band, TrustSample};
use std::io::Write;
use std::net::{TcpStream, UdpSocket};

/// Vendor field of every event.
pub const VENDOR: &str = "Ashforde OU";
/// Product field of every event.
pub const PRODUCT: &str = "Kshana";
/// Device event class prefix: the event id is `gnss-trust.<band>`.
pub const EVENT_PREFIX: &str = "gnss-trust";

/// Payload dialect.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Format {
    /// ArcSight Common Event Format.
    Cef,
    /// QRadar Log Event Extended Format 2.0.
    Leef,
}

/// CEF severity 0-10 for a band: nominal and calibrating are informational, degraded is
/// medium, untrusted is very high.
pub fn cef_severity(b: Band) -> u8 {
    match b {
        Band::Calibrating => 0,
        Band::Nominal => 1,
        Band::Degraded => 5,
        Band::Untrusted => 9,
        Band::Unknown => 3,
    }
}

/// RFC 5424 severity: info (6) for nominal or calibrating, warning (4) for degraded,
/// critical (2) for untrusted, notice (5) for an unknown band.
pub fn syslog_severity(b: Band) -> u8 {
    match b {
        Band::Calibrating | Band::Nominal => 6,
        Band::Degraded => 4,
        Band::Untrusted => 2,
        Band::Unknown => 5,
    }
}

fn cef_header_escape(s: &str) -> String {
    s.replace('\\', "\\\\")
        .replace('|', "\\|")
        .replace(['\n', '\r'], " ")
}

fn cef_ext_escape(s: &str) -> String {
    s.replace('\\', "\\\\")
        .replace('=', "\\=")
        .replace('\n', "\\n")
        .replace('\r', "\\r")
}

fn leef_escape(s: &str) -> String {
    // The delimiter is `^`; neither it nor a line break may appear in a value.
    s.replace(['^', '\n', '\r', '\t'], " ")
}

fn num(x: f64) -> String {
    format!("{x}")
}

/// The CEF line (no syslog envelope).
///
/// `CEF:0|Ashforde OU|Kshana|<version>|gnss-trust.<band>|GNSS trust <band>|<sev>|ext`
/// where the extension carries `cat`, `cs1` band, `cs2` reasons (comma-separated), `cs3`
/// the previous band, `cn1` trust score and `cn2` epoch offset in seconds, `cs4` log time and `cs5` gate state. `cn1` is left
/// out when the source gives no score. `dvchost` is the sending host.
pub fn cef(s: &TrustSample, prev: Option<Band>, host: &str, version: &str) -> String {
    let mut ext = format!(
        "cat=gnss-trust dvchost={} cs1Label=band cs1={} cs2Label=reasons cs2={}",
        cef_ext_escape(host),
        s.band.label(),
        cef_ext_escape(&s.reasons.join(","))
    );
    if let Some(p) = prev {
        ext.push_str(&format!(" cs3Label=previousBand cs3={}", p.label()));
    }
    if let Some(sc) = s.score {
        ext.push_str(&format!(" cn1Label=trustScore cn1={}", num(sc)));
    }
    ext.push_str(&format!(" cn2Label=epochOffsetSeconds cn2={}", num(s.t_s)));
    if let Some(l) = &s.time_label {
        ext.push_str(&format!(" cs4Label=logTime cs4={}", cef_ext_escape(l)));
    }
    if let Some(g) = &s.gate {
        ext.push_str(&format!(" cs5Label=gate cs5={}", cef_ext_escape(g)));
    }
    format!(
        "CEF:0|{}|{}|{}|{EVENT_PREFIX}.{}|GNSS trust {}|{}|{ext}",
        cef_header_escape(VENDOR),
        cef_header_escape(PRODUCT),
        cef_header_escape(version),
        s.band.label(),
        s.band.label(),
        cef_severity(s.band)
    )
}

/// The LEEF 2.0 line (no syslog envelope), delimiter `^`.
///
/// Attributes: `cat`, `sev` (1-10, the CEF severity with a floor of 1), `devHost`, `band`,
/// `previousBand`, `trustScore`, `reasons`, `epochOffsetSeconds`, `logTime`.
pub fn leef(s: &TrustSample, prev: Option<Band>, host: &str, version: &str) -> String {
    let mut a: Vec<String> = vec![
        format!("cat={EVENT_PREFIX}"),
        format!("sev={}", cef_severity(s.band).max(1)),
        format!("devHost={}", leef_escape(host)),
        format!("band={}", s.band.label()),
    ];
    if let Some(p) = prev {
        a.push(format!("previousBand={}", p.label()));
    }
    if let Some(sc) = s.score {
        a.push(format!("trustScore={}", num(sc)));
    }
    a.push(format!("reasons={}", leef_escape(&s.reasons.join(","))));
    a.push(format!("epochOffsetSeconds={}", num(s.t_s)));
    if let Some(l) = &s.time_label {
        a.push(format!("logTime={}", leef_escape(l)));
    }
    if let Some(g) = &s.gate {
        a.push(format!("gate={}", leef_escape(g)));
    }
    format!(
        "LEEF:2.0|{}|{}|{}|{EVENT_PREFIX}.{}|^|{}",
        VENDOR.replace('|', " "),
        PRODUCT,
        version.replace('|', " "),
        s.band.label(),
        a.join("^")
    )
}

/// Wrap a payload in an RFC 5424 envelope: facility local0 (16), `app` `kshana`, message id
/// `GNSSTRUST`. `timestamp` is RFC 3339 UTC, or `None` for the NILVALUE `-`.
pub fn rfc5424(band: Band, timestamp: Option<&str>, host: &str, payload: &str) -> String {
    let pri = 16 * 8 + u32::from(syslog_severity(band));
    let host = if host.is_empty() { "-" } else { host };
    let host: String = host.chars().filter(|c| c.is_ascii_graphic()).collect();
    format!(
        "<{pri}>1 {} {} kshana - GNSSTRUST - {payload}",
        timestamp.unwrap_or("-"),
        if host.is_empty() { "-" } else { &host }
    )
}

/// RFC 3339 UTC timestamp for a Unix time in whole seconds.
pub fn rfc3339_utc(unix_s: i64) -> String {
    let days = unix_s.div_euclid(86_400);
    let rem = unix_s.rem_euclid(86_400);
    // Howard Hinnant's civil-from-days.
    let z = days + 719_468;
    let era = z.div_euclid(146_097);
    let doe = z.rem_euclid(146_097);
    let yoe = (doe - doe / 1460 + doe / 36_524 - doe / 146_096) / 365;
    let y = yoe + era * 400;
    let doy = doe - (365 * yoe + yoe / 4 - yoe / 100);
    let mp = (5 * doy + 2) / 153;
    let d = doy - (153 * mp + 2) / 5 + 1;
    let m = if mp < 10 { mp + 3 } else { mp - 9 };
    let y = if m <= 2 { y + 1 } else { y };
    format!(
        "{y:04}-{m:02}-{d:02}T{:02}:{:02}:{:02}Z",
        rem / 3600,
        rem % 3600 / 60,
        rem % 60
    )
}

/// Where syslog lines go.
pub enum Transport {
    /// One datagram per message.
    Udp(UdpSocket, String),
    /// A stream of newline-terminated messages.
    Tcp(TcpStream),
}

impl Transport {
    /// UDP to `addr` (`host:port`).
    pub fn udp(addr: &str) -> std::io::Result<Self> {
        let s = UdpSocket::bind("0.0.0.0:0")?;
        Ok(Transport::Udp(s, addr.to_string()))
    }

    /// TCP to `addr` (`host:port`).
    pub fn tcp(addr: &str) -> std::io::Result<Self> {
        Ok(Transport::Tcp(TcpStream::connect(addr)?))
    }

    /// Send one message.
    pub fn send(&mut self, line: &str) -> std::io::Result<()> {
        match self {
            Transport::Udp(s, a) => s.send_to(line.as_bytes(), a.as_str()).map(|_| ()),
            Transport::Tcp(s) => {
                s.write_all(line.as_bytes())?;
                s.write_all(b"\n")
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn sample() -> TrustSample {
        TrustSample {
            t_s: 130.5,
            time_label: Some("2026-01-01T00:02:10Z".into()),
            score: Some(41.5),
            band: Band::Degraded,
            reasons: vec!["cn0-drop".into(), "agc".into()],
            gate: Some("withheld".into()),
            position: None,
        }
    }

    #[test]
    fn cef_exact() {
        assert_eq!(
            cef(&sample(), Some(Band::Nominal), "ops-gw1", "0.35.0"),
            "CEF:0|Ashforde OU|Kshana|0.35.0|gnss-trust.degraded|GNSS trust degraded|5|\
             cat=gnss-trust dvchost=ops-gw1 cs1Label=band cs1=degraded \
             cs2Label=reasons cs2=cn0-drop,agc cs3Label=previousBand cs3=nominal \
             cn1Label=trustScore cn1=41.5 cn2Label=epochOffsetSeconds cn2=130.5 \
             cs4Label=logTime cs4=2026-01-01T00:02:10Z cs5Label=gate cs5=withheld"
        );
    }

    #[test]
    fn leef_exact() {
        assert_eq!(
            leef(&sample(), Some(Band::Nominal), "ops-gw1", "0.35.0"),
            "LEEF:2.0|Ashforde OU|Kshana|0.35.0|gnss-trust.degraded|^|\
             cat=gnss-trust^sev=5^devHost=ops-gw1^band=degraded^previousBand=nominal^\
             trustScore=41.5^reasons=cn0-drop,agc^epochOffsetSeconds=130.5^\
             logTime=2026-01-01T00:02:10Z^gate=withheld"
        );
    }

    #[test]
    fn cef_escapes_header_and_extension() {
        let mut s = sample();
        s.score = None;
        s.time_label = None;
        s.reasons = vec!["a=b".into(), "c\nd".into()];
        let line = cef(&s, None, "h|ost", "1|0");
        assert!(line.starts_with("CEF:0|Ashforde OU|Kshana|1\\|0|"));
        assert!(line.contains("cs2=a\\=b,c\\nd"));
        assert!(!line.contains('\n'));
        assert!(!line.contains("cn1"));
        assert!(!line.contains("previousBand"));
    }

    #[test]
    fn leef_strips_delimiter_and_newlines_from_values() {
        let mut s = sample();
        s.reasons = vec!["x^y".into(), "p\nq".into()];
        let line = leef(&s, None, "h", "1");
        assert!(line.contains("reasons=x y,p q^"));
        assert!(!line.contains('\n'));
    }

    #[test]
    fn nominal_severity_floor_in_leef_and_cef_zero_for_calibrating() {
        let mut s = sample();
        s.band = Band::Calibrating;
        assert!(
            cef(&s, None, "h", "1").contains("|gnss-trust.calibrating|GNSS trust calibrating|0|")
        );
        assert!(leef(&s, None, "h", "1").contains("^sev=1^"));
    }

    #[test]
    fn rfc5424_envelope() {
        // local0 (16) * 8 + warning (4) = 132
        assert_eq!(
            rfc5424(Band::Degraded, Some("2026-01-01T00:00:00Z"), "ops-gw1", "X"),
            "<132>1 2026-01-01T00:00:00Z ops-gw1 kshana - GNSSTRUST - X"
        );
        assert_eq!(
            rfc5424(Band::Untrusted, None, "", "X"),
            "<130>1 - - kshana - GNSSTRUST - X"
        );
    }

    #[test]
    fn rfc3339_known_instants() {
        assert_eq!(rfc3339_utc(0), "1970-01-01T00:00:00Z");
        assert_eq!(rfc3339_utc(951_782_400), "2000-02-29T00:00:00Z");
        assert_eq!(rfc3339_utc(1_767_225_599), "2025-12-31T23:59:59Z");
    }
}
