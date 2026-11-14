// SPDX-License-Identifier: AGPL-3.0-only
//! IEEE 1588 PTP management (roadmap 0.42 I2): the text that linuxptp's `pmc` prints, and the
//! binary management message with the data sets a timing monitor reads. Read only: this module
//! parses and builds GET requests and responses; it sends nothing and never builds a SET or a
//! COMMAND.
//!
//! Sources. The binary layouts are those of IEEE 1588-2008 clause 15 (management messages) as
//! implemented by linuxptp (GPL-2.0; `msg.h` for the common header and the management message,
//! `ds.h` for the default, current, parent, time-properties and port data sets, `tlv.h` for the
//! management TLV, the management ids and the linuxptp-specific `TIME_STATUS_NP`). The text form is
//! what `pmc_show` in linuxptp's `pmc.c` prints (labels, field order and number formats), checked on
//! 14 November 2026 against the linuxptp sources. No linuxptp code is reproduced.
//!
//! Binary management message (all fields big-endian): the 34-byte common header (message type 0xD,
//! version 2, length, domain, flags, correction, source port identity, sequence id, control field 4,
//! log message interval 0x7F), the target port identity, starting boundary hops, boundary hops, the
//! action (low nibble: 0 GET, 1 SET, 2 RESPONSE, 3 COMMAND, 4 ACKNOWLEDGE), a reserved byte, then the
//! management TLV: type 0x0001, length (2 + data), management id, data.

use serde::Serialize;
use std::collections::BTreeMap;

/// `DEFAULT_DATA_SET`.
pub const MID_DEFAULT_DATA_SET: u16 = 0x2000;
/// `CURRENT_DATA_SET`.
pub const MID_CURRENT_DATA_SET: u16 = 0x2001;
/// `PARENT_DATA_SET`.
pub const MID_PARENT_DATA_SET: u16 = 0x2002;
/// `TIME_PROPERTIES_DATA_SET`.
pub const MID_TIME_PROPERTIES_DATA_SET: u16 = 0x2003;
/// `PORT_DATA_SET`.
pub const MID_PORT_DATA_SET: u16 = 0x2004;
/// linuxptp `TIME_STATUS_NP`.
pub const MID_TIME_STATUS_NP: u16 = 0xC000;

/// Port states as linuxptp names them (`ps_str`), by value.
pub const PORT_STATES: [&str; 11] = [
    "NONE",
    "INITIALIZING",
    "FAULTY",
    "DISABLED",
    "LISTENING",
    "PRE_MASTER",
    "MASTER",
    "PASSIVE",
    "UNCALIBRATED",
    "SLAVE",
    "GRAND_MASTER",
];

/// The name `pmc` uses for a management id this module decodes.
pub fn mid_name(id: u16) -> Option<&'static str> {
    Some(match id {
        MID_DEFAULT_DATA_SET => "DEFAULT_DATA_SET",
        MID_CURRENT_DATA_SET => "CURRENT_DATA_SET",
        MID_PARENT_DATA_SET => "PARENT_DATA_SET",
        MID_TIME_PROPERTIES_DATA_SET => "TIME_PROPERTIES_DATA_SET",
        MID_PORT_DATA_SET => "PORT_DATA_SET",
        MID_TIME_STATUS_NP => "TIME_STATUS_NP",
        _ => return None,
    })
}

/// The management id of a `pmc` data-set name.
pub fn mid_of(name: &str) -> Option<u16> {
    [
        MID_DEFAULT_DATA_SET,
        MID_CURRENT_DATA_SET,
        MID_PARENT_DATA_SET,
        MID_TIME_PROPERTIES_DATA_SET,
        MID_PORT_DATA_SET,
        MID_TIME_STATUS_NP,
    ]
    .into_iter()
    .find(|&m| mid_name(m) == Some(name))
}

const ACTIONS: [&str; 5] = ["GET", "SET", "RESPONSE", "COMMAND", "ACKNOWLEDGE"];

/// A clock identity (8 bytes) and port number.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub struct PortIdentity {
    /// Clock identity.
    pub clock: [u8; 8],
    /// Port number.
    pub port: u16,
}

/// A clock identity as linuxptp prints it (`001122.fffe.334455`).
pub fn clock_id_str(c: &[u8; 8]) -> String {
    format!(
        "{:02x}{:02x}{:02x}.{:02x}{:02x}.{:02x}{:02x}{:02x}",
        c[0], c[1], c[2], c[3], c[4], c[5], c[6], c[7]
    )
}

impl PortIdentity {
    fn text(&self) -> String {
        format!("{}-{}", clock_id_str(&self.clock), self.port)
    }
}

impl Serialize for PortIdentity {
    fn serialize<S: serde::Serializer>(&self, s: S) -> Result<S::Ok, S::Error> {
        s.serialize_str(&self.text())
    }
}

/// Clock class, accuracy and offset-scaled log variance.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq, Serialize)]
pub struct ClockQuality {
    /// clockClass.
    pub clock_class: u8,
    /// clockAccuracy (enumeration, for example 0x21 = within 100 ns).
    pub clock_accuracy: u8,
    /// offsetScaledLogVariance.
    pub offset_scaled_log_variance: u16,
}

/// A decoded data set.
#[derive(Clone, Debug, PartialEq, Serialize)]
#[serde(tag = "data_set", rename_all = "SCREAMING_SNAKE_CASE")]
pub enum DataSet {
    /// `DEFAULT_DATA_SET`.
    DefaultDataSet {
        /// twoStepFlag.
        two_step: bool,
        /// slaveOnly.
        slave_only: bool,
        /// numberPorts.
        number_ports: u16,
        /// priority1.
        priority1: u8,
        /// clockQuality.
        quality: ClockQuality,
        /// priority2.
        priority2: u8,
        /// clockIdentity.
        #[serde(serialize_with = "ser_clock")]
        clock_identity: [u8; 8],
        /// domainNumber.
        domain: u8,
    },
    /// `CURRENT_DATA_SET`.
    CurrentDataSet {
        /// stepsRemoved.
        steps_removed: u16,
        /// offsetFromMaster, ns.
        offset_from_master_ns: f64,
        /// meanPathDelay, ns.
        mean_path_delay_ns: f64,
    },
    /// `PARENT_DATA_SET`.
    ParentDataSet {
        /// parentPortIdentity.
        parent_port: PortIdentity,
        /// parentStats.
        parent_stats: u8,
        /// observedParentOffsetScaledLogVariance.
        observed_offset_scaled_log_variance: u16,
        /// observedParentClockPhaseChangeRate.
        observed_phase_change_rate: i32,
        /// grandmasterPriority1.
        gm_priority1: u8,
        /// grandmasterClockQuality.
        gm_quality: ClockQuality,
        /// grandmasterPriority2.
        gm_priority2: u8,
        /// grandmasterIdentity.
        #[serde(serialize_with = "ser_clock")]
        gm_identity: [u8; 8],
    },
    /// `TIME_PROPERTIES_DATA_SET`.
    TimePropertiesDataSet {
        /// currentUtcOffset, s.
        current_utc_offset: i16,
        /// The flags: leap61 (bit 0), leap59 (1), currentUtcOffsetValid (2), ptpTimescale (3),
        /// timeTraceable (4), frequencyTraceable (5).
        flags: u8,
        /// timeSource (enumeration, for example 0x20 GNSS, 0xA0 internal oscillator).
        time_source: u8,
    },
    /// `PORT_DATA_SET`.
    PortDataSet {
        /// portIdentity.
        port: PortIdentity,
        /// portState.
        port_state: u8,
        /// logMinDelayReqInterval.
        log_min_delay_req_interval: i8,
        /// peerMeanPathDelay, ns (whole nanoseconds, as `pmc` prints it).
        peer_mean_path_delay_ns: i64,
        /// logAnnounceInterval.
        log_announce_interval: i8,
        /// announceReceiptTimeout.
        announce_receipt_timeout: u8,
        /// logSyncInterval.
        log_sync_interval: i8,
        /// delayMechanism.
        delay_mechanism: u8,
        /// logMinPdelayReqInterval.
        log_min_pdelay_req_interval: i8,
        /// versionNumber (low nibble).
        version: u8,
    },
    /// linuxptp `TIME_STATUS_NP`.
    TimeStatusNp {
        /// master_offset, ns.
        master_offset_ns: i64,
        /// ingress_time, ns.
        ingress_time_ns: i64,
        /// cumulativeScaledRateOffset (raw; divide by 2^41 for the rate offset).
        cumulative_scaled_rate_offset: i32,
        /// scaledLastGmPhaseChange.
        scaled_last_gm_phase_change: i32,
        /// gmTimeBaseIndicator.
        gm_time_base_indicator: u16,
        /// lastGmPhaseChange: nanoseconds (msb 16, lsb 64) and fractional nanoseconds (16).
        last_gm_phase_change: (u16, u64, u16),
        /// gmPresent.
        gm_present: bool,
        /// gmIdentity.
        #[serde(serialize_with = "ser_clock")]
        gm_identity: [u8; 8],
    },
}

fn ser_clock<S: serde::Serializer>(c: &[u8; 8], s: S) -> Result<S::Ok, S::Error> {
    s.serialize_str(&clock_id_str(c))
}

/// A management message.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct MgmtMessage {
    /// domainNumber.
    pub domain: u8,
    /// sourcePortIdentity.
    pub source: PortIdentity,
    /// sequenceId.
    pub sequence_id: u16,
    /// targetPortIdentity.
    pub target: PortIdentity,
    /// startingBoundaryHops.
    pub starting_boundary_hops: u8,
    /// boundaryHops.
    pub boundary_hops: u8,
    /// Action: 0 GET, 1 SET, 2 RESPONSE, 3 COMMAND, 4 ACKNOWLEDGE.
    pub action: u8,
    /// managementId.
    pub management_id: u16,
    /// The data set, where the message carries one this module decodes.
    pub data: Option<DataSet>,
}

fn be16(b: &[u8], o: usize) -> Option<u16> {
    Some(u16::from_be_bytes(b.get(o..o + 2)?.try_into().ok()?))
}
fn be32(b: &[u8], o: usize) -> Option<u32> {
    Some(u32::from_be_bytes(b.get(o..o + 4)?.try_into().ok()?))
}
fn be64(b: &[u8], o: usize) -> Option<u64> {
    Some(u64::from_be_bytes(b.get(o..o + 8)?.try_into().ok()?))
}
fn clock(b: &[u8], o: usize) -> Option<[u8; 8]> {
    b.get(o..o + 8)?.try_into().ok()
}
fn pid(b: &[u8], o: usize) -> Option<PortIdentity> {
    Some(PortIdentity {
        clock: clock(b, o)?,
        port: be16(b, o + 8)?,
    })
}
fn quality(b: &[u8], o: usize) -> Option<ClockQuality> {
    Some(ClockQuality {
        clock_class: *b.get(o)?,
        clock_accuracy: *b.get(o + 1)?,
        offset_scaled_log_variance: be16(b, o + 2)?,
    })
}

fn bad(why: &str) -> String {
    crate::terr!("e-ptp-mgmt-bad", why = why)
}

/// Decode a management message (the UDP payload, or the bytes after an Ethernet header).
pub fn decode(b: &[u8]) -> Result<MgmtMessage, String> {
    if b.len() < 54 {
        return Err(bad("length"));
    }
    if b[0] & 0x0F != 0x0D {
        return Err(bad("type"));
    }
    let len = usize::from(be16(b, 2).unwrap_or(0));
    if len < 54 || len > b.len() {
        return Err(bad("length"));
    }
    let b = &b[..len];
    let tlv_type = be16(b, 48).unwrap_or(0);
    let tlv_len = usize::from(be16(b, 50).unwrap_or(0));
    if tlv_type != 0x0001 {
        return Err(bad("tlv"));
    }
    if tlv_len < 2 || 52 + tlv_len > len {
        return Err(bad("length"));
    }
    let management_id = be16(b, 52).unwrap_or(0);
    let d = &b[54..52 + tlv_len];
    let data = if d.is_empty() {
        None
    } else {
        decode_data(management_id, d)
    };
    Ok(MgmtMessage {
        domain: b[4],
        source: pid(b, 20).ok_or_else(|| bad("length"))?,
        sequence_id: be16(b, 30).unwrap_or(0),
        target: pid(b, 34).ok_or_else(|| bad("length"))?,
        starting_boundary_hops: b[44],
        boundary_hops: b[45],
        action: b[46] & 0x0F,
        management_id,
        data,
    })
}

fn decode_data(id: u16, d: &[u8]) -> Option<DataSet> {
    Some(match id {
        MID_DEFAULT_DATA_SET => DataSet::DefaultDataSet {
            two_step: d.first()? & 1 != 0,
            slave_only: d.first()? & 2 != 0,
            number_ports: be16(d, 2)?,
            priority1: *d.get(4)?,
            quality: quality(d, 5)?,
            priority2: *d.get(9)?,
            clock_identity: clock(d, 10)?,
            domain: *d.get(18)?,
        },
        MID_CURRENT_DATA_SET => DataSet::CurrentDataSet {
            steps_removed: be16(d, 0)?,
            offset_from_master_ns: be64(d, 2)? as i64 as f64 / 65536.0,
            mean_path_delay_ns: be64(d, 10)? as i64 as f64 / 65536.0,
        },
        MID_PARENT_DATA_SET => DataSet::ParentDataSet {
            parent_port: pid(d, 0)?,
            parent_stats: *d.get(10)?,
            observed_offset_scaled_log_variance: be16(d, 12)?,
            observed_phase_change_rate: be32(d, 14)? as i32,
            gm_priority1: *d.get(18)?,
            gm_quality: quality(d, 19)?,
            gm_priority2: *d.get(23)?,
            gm_identity: clock(d, 24)?,
        },
        MID_TIME_PROPERTIES_DATA_SET => DataSet::TimePropertiesDataSet {
            current_utc_offset: be16(d, 0)? as i16,
            flags: *d.get(2)?,
            time_source: *d.get(3)?,
        },
        MID_PORT_DATA_SET => DataSet::PortDataSet {
            port: pid(d, 0)?,
            port_state: *d.get(10)?,
            log_min_delay_req_interval: *d.get(11)? as i8,
            peer_mean_path_delay_ns: (be64(d, 12)? as i64) >> 16,
            log_announce_interval: *d.get(20)? as i8,
            announce_receipt_timeout: *d.get(21)?,
            log_sync_interval: *d.get(22)? as i8,
            delay_mechanism: *d.get(23)?,
            log_min_pdelay_req_interval: *d.get(24)? as i8,
            version: d.get(25)? & 0x0F,
        },
        MID_TIME_STATUS_NP => DataSet::TimeStatusNp {
            master_offset_ns: be64(d, 0)? as i64,
            ingress_time_ns: be64(d, 8)? as i64,
            cumulative_scaled_rate_offset: be32(d, 16)? as i32,
            scaled_last_gm_phase_change: be32(d, 20)? as i32,
            gm_time_base_indicator: be16(d, 24)?,
            last_gm_phase_change: (be16(d, 26)?, be64(d, 28)?, be16(d, 36)?),
            gm_present: be32(d, 38)? != 0,
            gm_identity: clock(d, 42)?,
        },
        _ => return None,
    })
}

fn encode_data(ds: &DataSet) -> Vec<u8> {
    let mut d = Vec::new();
    let q = |d: &mut Vec<u8>, q: &ClockQuality| {
        d.push(q.clock_class);
        d.push(q.clock_accuracy);
        d.extend(q.offset_scaled_log_variance.to_be_bytes());
    };
    let p = |d: &mut Vec<u8>, p: &PortIdentity| {
        d.extend(p.clock);
        d.extend(p.port.to_be_bytes());
    };
    match ds {
        DataSet::DefaultDataSet {
            two_step,
            slave_only,
            number_ports,
            priority1,
            quality,
            priority2,
            clock_identity,
            domain,
        } => {
            d.push(u8::from(*two_step) | (u8::from(*slave_only) << 1));
            d.push(0);
            d.extend(number_ports.to_be_bytes());
            d.push(*priority1);
            q(&mut d, quality);
            d.push(*priority2);
            d.extend(clock_identity);
            d.push(*domain);
            d.push(0);
        }
        DataSet::CurrentDataSet {
            steps_removed,
            offset_from_master_ns,
            mean_path_delay_ns,
        } => {
            d.extend(steps_removed.to_be_bytes());
            d.extend(((offset_from_master_ns * 65536.0).round() as i64).to_be_bytes());
            d.extend(((mean_path_delay_ns * 65536.0).round() as i64).to_be_bytes());
        }
        DataSet::ParentDataSet {
            parent_port,
            parent_stats,
            observed_offset_scaled_log_variance,
            observed_phase_change_rate,
            gm_priority1,
            gm_quality,
            gm_priority2,
            gm_identity,
        } => {
            p(&mut d, parent_port);
            d.push(*parent_stats);
            d.push(0);
            d.extend(observed_offset_scaled_log_variance.to_be_bytes());
            d.extend(observed_phase_change_rate.to_be_bytes());
            d.push(*gm_priority1);
            q(&mut d, gm_quality);
            d.push(*gm_priority2);
            d.extend(gm_identity);
        }
        DataSet::TimePropertiesDataSet {
            current_utc_offset,
            flags,
            time_source,
        } => {
            d.extend(current_utc_offset.to_be_bytes());
            d.push(*flags);
            d.push(*time_source);
        }
        DataSet::PortDataSet {
            port,
            port_state,
            log_min_delay_req_interval,
            peer_mean_path_delay_ns,
            log_announce_interval,
            announce_receipt_timeout,
            log_sync_interval,
            delay_mechanism,
            log_min_pdelay_req_interval,
            version,
        } => {
            p(&mut d, port);
            d.push(*port_state);
            d.push(*log_min_delay_req_interval as u8);
            d.extend((peer_mean_path_delay_ns << 16).to_be_bytes());
            d.push(*log_announce_interval as u8);
            d.push(*announce_receipt_timeout);
            d.push(*log_sync_interval as u8);
            d.push(*delay_mechanism);
            d.push(*log_min_pdelay_req_interval as u8);
            d.push(*version);
        }
        DataSet::TimeStatusNp {
            master_offset_ns,
            ingress_time_ns,
            cumulative_scaled_rate_offset,
            scaled_last_gm_phase_change,
            gm_time_base_indicator,
            last_gm_phase_change,
            gm_present,
            gm_identity,
        } => {
            d.extend(master_offset_ns.to_be_bytes());
            d.extend(ingress_time_ns.to_be_bytes());
            d.extend(cumulative_scaled_rate_offset.to_be_bytes());
            d.extend(scaled_last_gm_phase_change.to_be_bytes());
            d.extend(gm_time_base_indicator.to_be_bytes());
            d.extend(last_gm_phase_change.0.to_be_bytes());
            d.extend(last_gm_phase_change.1.to_be_bytes());
            d.extend(last_gm_phase_change.2.to_be_bytes());
            d.extend(i32::from(*gm_present).to_be_bytes());
            d.extend(gm_identity);
        }
    }
    if d.len() % 2 == 1 {
        d.push(0); // TLV data are padded to an even length
    }
    d
}

/// Encode a GET request or a RESPONSE. A SET or COMMAND (action 1 or 3) is refused: this module
/// never builds a message that changes a clock.
pub fn encode(m: &MgmtMessage) -> Result<Vec<u8>, String> {
    if !matches!(m.action, 0 | 2) {
        return Err(bad("action"));
    }
    let data = m.data.as_ref().map(encode_data).unwrap_or_default();
    let len = 54 + data.len();
    let mut b = Vec::with_capacity(len);
    b.push(0x0D); // transportSpecific 0, messageType MANAGEMENT
    b.push(0x02); // versionPTP 2
    b.extend((len as u16).to_be_bytes());
    b.push(m.domain);
    b.push(0);
    b.extend([0u8; 2]); // flags
    b.extend([0u8; 8]); // correction
    b.extend([0u8; 4]);
    b.extend(m.source.clock);
    b.extend(m.source.port.to_be_bytes());
    b.extend(m.sequence_id.to_be_bytes());
    b.push(0x04); // control: management
    b.push(0x7F); // logMessageInterval
    b.extend(m.target.clock);
    b.extend(m.target.port.to_be_bytes());
    b.push(m.starting_boundary_hops);
    b.push(m.boundary_hops);
    b.push(m.action & 0x0F);
    b.push(0);
    b.extend(0x0001u16.to_be_bytes());
    b.extend(((2 + data.len()) as u16).to_be_bytes());
    b.extend(m.management_id.to_be_bytes());
    b.extend(data);
    Ok(b)
}

/// A GET request for one data set, addressed to all clocks and ports (as `pmc` does by default).
pub fn get_request(management_id: u16, sequence_id: u16, domain: u8) -> Vec<u8> {
    let m = MgmtMessage {
        domain,
        source: PortIdentity::default(),
        sequence_id,
        target: PortIdentity {
            clock: [0xFF; 8],
            port: 0xFFFF,
        },
        starting_boundary_hops: 1,
        boundary_hops: 1,
        action: 0,
        management_id,
        data: None,
    };
    encode(&m).unwrap_or_default()
}

fn flag(v: u8, bit: u8) -> u8 {
    u8::from(v & (1 << bit) != 0)
}

/// The block `pmc` prints for a RESPONSE (tab-indented, as `pmc_show` writes it). Used to check the
/// text parser against the binary decoder.
pub fn render_pmc(m: &MgmtMessage) -> Option<String> {
    let mut s = format!(
        "\t{} seq {} {} MANAGEMENT {} ",
        m.source.text(),
        m.sequence_id,
        ACTIONS.get(usize::from(m.action))?,
        mid_name(m.management_id)?
    );
    let mut kv = |k: &str, v: String| {
        s.push_str("\n\t\t");
        s.push_str(k);
        s.push(' ');
        s.push_str(&v);
    };
    match m.data.as_ref()? {
        DataSet::DefaultDataSet {
            two_step,
            slave_only,
            number_ports,
            priority1,
            quality,
            priority2,
            clock_identity,
            domain,
        } => {
            kv("twoStepFlag", u8::from(*two_step).to_string());
            kv("slaveOnly", u8::from(*slave_only).to_string());
            kv("numberPorts", number_ports.to_string());
            kv("priority1", priority1.to_string());
            kv("clockClass", quality.clock_class.to_string());
            kv("clockAccuracy", format!("0x{:02x}", quality.clock_accuracy));
            kv(
                "offsetScaledLogVariance",
                format!("0x{:04x}", quality.offset_scaled_log_variance),
            );
            kv("priority2", priority2.to_string());
            kv("clockIdentity", clock_id_str(clock_identity));
            kv("domainNumber", domain.to_string());
        }
        DataSet::CurrentDataSet {
            steps_removed,
            offset_from_master_ns,
            mean_path_delay_ns,
        } => {
            kv("stepsRemoved", steps_removed.to_string());
            kv("offsetFromMaster", format!("{offset_from_master_ns:.1}"));
            kv("meanPathDelay", format!("{mean_path_delay_ns:.1}"));
        }
        DataSet::ParentDataSet {
            parent_port,
            parent_stats,
            observed_offset_scaled_log_variance,
            observed_phase_change_rate,
            gm_priority1,
            gm_quality,
            gm_priority2,
            gm_identity,
        } => {
            kv("parentPortIdentity", parent_port.text());
            kv("parentStats", parent_stats.to_string());
            kv(
                "observedParentOffsetScaledLogVariance",
                format!("0x{observed_offset_scaled_log_variance:04x}"),
            );
            kv(
                "observedParentClockPhaseChangeRate",
                format!("0x{:08x}", *observed_phase_change_rate as u32),
            );
            kv("grandmasterPriority1", gm_priority1.to_string());
            kv("gm.ClockClass", gm_quality.clock_class.to_string());
            kv(
                "gm.ClockAccuracy",
                format!("0x{:02x}", gm_quality.clock_accuracy),
            );
            kv(
                "gm.OffsetScaledLogVariance",
                format!("0x{:04x}", gm_quality.offset_scaled_log_variance),
            );
            kv("grandmasterPriority2", gm_priority2.to_string());
            kv("grandmasterIdentity", clock_id_str(gm_identity));
        }
        DataSet::TimePropertiesDataSet {
            current_utc_offset,
            flags,
            time_source,
        } => {
            kv("currentUtcOffset", current_utc_offset.to_string());
            kv("leap61", flag(*flags, 0).to_string());
            kv("leap59", flag(*flags, 1).to_string());
            kv("currentUtcOffsetValid", flag(*flags, 2).to_string());
            kv("ptpTimescale", flag(*flags, 3).to_string());
            kv("timeTraceable", flag(*flags, 4).to_string());
            kv("frequencyTraceable", flag(*flags, 5).to_string());
            kv("timeSource", format!("0x{time_source:02x}"));
        }
        DataSet::PortDataSet {
            port,
            port_state,
            log_min_delay_req_interval,
            peer_mean_path_delay_ns,
            log_announce_interval,
            announce_receipt_timeout,
            log_sync_interval,
            delay_mechanism,
            log_min_pdelay_req_interval,
            version,
        } => {
            kv("portIdentity", port.text());
            kv(
                "portState",
                PORT_STATES
                    .get(usize::from(*port_state))
                    .unwrap_or(&PORT_STATES[0])
                    .to_string(),
            );
            kv(
                "logMinDelayReqInterval",
                log_min_delay_req_interval.to_string(),
            );
            kv("peerMeanPathDelay", peer_mean_path_delay_ns.to_string());
            kv("logAnnounceInterval", log_announce_interval.to_string());
            kv(
                "announceReceiptTimeout",
                announce_receipt_timeout.to_string(),
            );
            kv("logSyncInterval", log_sync_interval.to_string());
            kv("delayMechanism", delay_mechanism.to_string());
            kv(
                "logMinPdelayReqInterval",
                log_min_pdelay_req_interval.to_string(),
            );
            kv("versionNumber", version.to_string());
        }
        DataSet::TimeStatusNp {
            master_offset_ns,
            ingress_time_ns,
            cumulative_scaled_rate_offset,
            scaled_last_gm_phase_change,
            gm_time_base_indicator,
            last_gm_phase_change,
            gm_present,
            gm_identity,
        } => {
            kv("master_offset", master_offset_ns.to_string());
            kv("ingress_time", ingress_time_ns.to_string());
            kv(
                "cumulativeScaledRateOffset",
                format!(
                    "{:+.9}",
                    f64::from(*cumulative_scaled_rate_offset) / 2f64.powi(41)
                ),
            );
            kv(
                "scaledLastGmPhaseChange",
                scaled_last_gm_phase_change.to_string(),
            );
            kv("gmTimeBaseIndicator", gm_time_base_indicator.to_string());
            kv(
                "lastGmPhaseChange",
                format!(
                    "0x{:04x}'{:016x}.{:04x}",
                    last_gm_phase_change.0, last_gm_phase_change.1, last_gm_phase_change.2
                ),
            );
            kv("gmPresent", gm_present.to_string());
            kv("gmIdentity", clock_id_str(gm_identity));
        }
    }
    Some(s)
}

/// One response block of `pmc` output.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct PmcBlock {
    /// The responding port (`001122.fffe.334455-1`).
    pub source_port: String,
    /// Sequence number.
    pub seq: u16,
    /// `RESPONSE`, `ACKNOWLEDGE`, ...
    pub action: String,
    /// The data set or TLV name (`CURRENT_DATA_SET`), or `MANAGEMENT_ERROR_STATUS`.
    pub id: String,
    /// The indented fields, as printed.
    pub fields: BTreeMap<String, String>,
}

/// Parse the text `pmc` prints (`pmc -u -b 0 'GET CURRENT_DATA_SET' ...`, or a log of it). The
/// `sending:` echo lines are passed over; each response block becomes a [`PmcBlock`].
pub fn parse_pmc(text: &str) -> Vec<PmcBlock> {
    let mut out: Vec<PmcBlock> = Vec::new();
    for line in text.lines() {
        let t = line.trim();
        if t.is_empty() || t.starts_with("sending:") {
            continue;
        }
        let w: Vec<&str> = t.split_whitespace().collect();
        if w.len() >= 5 && w[1] == "seq" && w[0].contains('-') && w[0].contains('.') {
            let id = match w.get(4) {
                Some(&"MANAGEMENT") => w.get(5).copied().unwrap_or("").to_string(),
                Some(other) => other.to_string(),
                None => String::new(),
            };
            out.push(PmcBlock {
                source_port: w[0].to_string(),
                seq: w[2].parse().unwrap_or(0),
                action: w[3].to_string(),
                id,
                fields: BTreeMap::new(),
            });
        } else if let (Some(b), Some((k, v))) = (out.last_mut(), t.split_once(char::is_whitespace))
        {
            b.fields.insert(k.to_string(), v.trim().to_string());
        }
    }
    out
}

/// The timing state a monitor wants from one clock, gathered from the blocks of one `pmc` run (the
/// last value of each field wins). Every field is `None` when no block carried it.
#[derive(Clone, Debug, Default, PartialEq, Serialize)]
pub struct PtpStatus {
    /// PORT_DATA_SET portState.
    pub port_state: Option<String>,
    /// CURRENT_DATA_SET offsetFromMaster, ns.
    pub offset_from_master_ns: Option<f64>,
    /// CURRENT_DATA_SET meanPathDelay, ns.
    pub mean_path_delay_ns: Option<f64>,
    /// CURRENT_DATA_SET stepsRemoved.
    pub steps_removed: Option<u32>,
    /// TIME_STATUS_NP master_offset, ns.
    pub master_offset_ns: Option<i64>,
    /// TIME_STATUS_NP gmPresent.
    pub gm_present: Option<bool>,
    /// The grandmaster identity (TIME_STATUS_NP gmIdentity or PARENT_DATA_SET grandmasterIdentity).
    pub gm_identity: Option<String>,
    /// PARENT_DATA_SET gm.ClockClass.
    pub gm_clock_class: Option<u8>,
    /// PARENT_DATA_SET gm.ClockAccuracy.
    pub gm_clock_accuracy: Option<u8>,
    /// PARENT_DATA_SET gm.OffsetScaledLogVariance.
    pub gm_offset_scaled_log_variance: Option<u16>,
    /// DEFAULT_DATA_SET clockClass (this clock).
    pub clock_class: Option<u8>,
    /// TIME_PROPERTIES_DATA_SET currentUtcOffset, s.
    pub current_utc_offset: Option<i32>,
    /// TIME_PROPERTIES_DATA_SET currentUtcOffsetValid.
    pub current_utc_offset_valid: Option<bool>,
    /// leap61.
    pub leap61: Option<bool>,
    /// leap59.
    pub leap59: Option<bool>,
    /// ptpTimescale.
    pub ptp_timescale: Option<bool>,
    /// timeTraceable.
    pub time_traceable: Option<bool>,
    /// frequencyTraceable.
    pub frequency_traceable: Option<bool>,
    /// timeSource.
    pub time_source: Option<u8>,
    /// Blocks read.
    pub blocks: usize,
    /// Management error responses seen.
    pub errors: usize,
}

fn hexnum(s: &str) -> Option<u64> {
    u64::from_str_radix(s.strip_prefix("0x").unwrap_or(s), 16).ok()
}
fn boolish(s: &str) -> Option<bool> {
    match s {
        "1" | "true" => Some(true),
        "0" | "false" => Some(false),
        _ => None,
    }
}

/// Gather a [`PtpStatus`] from parsed blocks.
pub fn status(blocks: &[PmcBlock]) -> PtpStatus {
    let mut st = PtpStatus {
        blocks: blocks.len(),
        ..Default::default()
    };
    for b in blocks {
        let f = |k: &str| b.fields.get(k).map(String::as_str);
        match b.id.as_str() {
            "MANAGEMENT_ERROR_STATUS" => st.errors += 1,
            "CURRENT_DATA_SET" => {
                st.steps_removed = f("stepsRemoved")
                    .and_then(|v| v.parse().ok())
                    .or(st.steps_removed);
                st.offset_from_master_ns = f("offsetFromMaster")
                    .and_then(|v| v.parse().ok())
                    .or(st.offset_from_master_ns);
                st.mean_path_delay_ns = f("meanPathDelay")
                    .and_then(|v| v.parse().ok())
                    .or(st.mean_path_delay_ns);
            }
            "PORT_DATA_SET" => {
                st.port_state = f("portState").map(str::to_string).or(st.port_state.take());
            }
            "TIME_STATUS_NP" => {
                st.master_offset_ns = f("master_offset")
                    .and_then(|v| v.parse().ok())
                    .or(st.master_offset_ns);
                st.gm_present = f("gmPresent").and_then(boolish).or(st.gm_present);
                st.gm_identity = f("gmIdentity")
                    .map(str::to_string)
                    .or(st.gm_identity.take());
            }
            "PARENT_DATA_SET" => {
                st.gm_clock_class = f("gm.ClockClass")
                    .and_then(|v| v.parse().ok())
                    .or(st.gm_clock_class);
                st.gm_clock_accuracy = f("gm.ClockAccuracy")
                    .and_then(hexnum)
                    .map(|v| v as u8)
                    .or(st.gm_clock_accuracy);
                st.gm_offset_scaled_log_variance = f("gm.OffsetScaledLogVariance")
                    .and_then(hexnum)
                    .map(|v| v as u16)
                    .or(st.gm_offset_scaled_log_variance);
                st.gm_identity = f("grandmasterIdentity")
                    .map(str::to_string)
                    .or(st.gm_identity.take());
            }
            "DEFAULT_DATA_SET" => {
                st.clock_class = f("clockClass")
                    .and_then(|v| v.parse().ok())
                    .or(st.clock_class);
            }
            "TIME_PROPERTIES_DATA_SET" => {
                st.current_utc_offset = f("currentUtcOffset")
                    .and_then(|v| v.parse().ok())
                    .or(st.current_utc_offset);
                st.current_utc_offset_valid = f("currentUtcOffsetValid")
                    .and_then(boolish)
                    .or(st.current_utc_offset_valid);
                st.leap61 = f("leap61").and_then(boolish).or(st.leap61);
                st.leap59 = f("leap59").and_then(boolish).or(st.leap59);
                st.ptp_timescale = f("ptpTimescale").and_then(boolish).or(st.ptp_timescale);
                st.time_traceable = f("timeTraceable").and_then(boolish).or(st.time_traceable);
                st.frequency_traceable = f("frequencyTraceable")
                    .and_then(boolish)
                    .or(st.frequency_traceable);
                st.time_source = f("timeSource")
                    .and_then(hexnum)
                    .map(|v| v as u8)
                    .or(st.time_source);
            }
            _ => {}
        }
    }
    st
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn a_get_request_has_the_header_and_an_empty_tlv() {
        let g = get_request(MID_CURRENT_DATA_SET, 7, 0);
        assert_eq!(g.len(), 54);
        assert_eq!(g[0], 0x0D);
        assert_eq!(&g[48..54], &[0, 1, 0, 2, 0x20, 0x01]);
        let m = decode(&g).unwrap();
        assert_eq!((m.action, m.sequence_id, m.data), (0, 7, None));
    }

    #[test]
    fn set_and_command_are_never_built() {
        let mut m = decode(&get_request(MID_DEFAULT_DATA_SET, 1, 0)).unwrap();
        m.action = 1;
        assert!(encode(&m).is_err());
        m.action = 3;
        assert!(encode(&m).is_err());
    }
}
