// SPDX-License-Identifier: AGPL-3.0-only
//! Readers for machine-side logs: RTKLIB solution files, NovAtel logs, RTCM 3 observation
//! streams and GNSS-SDR outputs. Each is a pure function on bytes or text that returns the
//! same [`Timeline`] the receiver-log readers in [`super::ingest`] return, and is read-only:
//! nothing here writes to a device or decodes more than the public documentation of the
//! format states.
//!
//! Records that share an instant are merged and `t_s` counts from the first epoch, as in
//! [`super::ingest`]. Corrupt or unsupported records are skipped and counted in
//! [`Timeline::skipped_records`], never a panic.

pub mod gnss_sdr;
pub mod imu;
pub mod novatel;
pub mod rtklib;

use super::ingest::timeline_from;
use super::{LogEpoch, Timeline};
use std::collections::BTreeMap;

/// RINEX-style satellite id from the system letter and the PRN a receiver reports: QZSS PRNs
/// count from 193 and SBAS from 120 (`J01`, `S20`); `None` outside 1-99.
pub(crate) fn sat_id_from_prn(letter: char, prn: u32) -> Option<String> {
    let n = match letter {
        'J' => prn.checked_sub(192)?,
        'S' => prn.checked_sub(100)?,
        _ => prn,
    };
    (1..=99).contains(&n).then(|| format!("{letter}{n:02}"))
}

/// Milliseconds in one GPS week.
pub(crate) const WEEK_MS: i64 = 604_800_000;
/// Milliseconds in one day.
pub(crate) const DAY_MS: i64 = 86_400_000;

/// Milliseconds since 1970-01-01T00:00:00 of the GPS epoch (1980-01-06) plus a GPS week and
/// seconds into it, on whatever scale the source states (no leap-second adjustment).
pub(crate) fn gps_week_ms(week: i64, tow_ms: i64) -> i64 {
    super::ingest::days_from_civil(1980, 1, 6) * DAY_MS + week * WEEK_MS + tow_ms
}

/// Epochs keyed by milliseconds on the reader's own time scale, merged on equal keys and
/// finished into a [`Timeline`] with `t_s` counted from the first key.
#[derive(Default)]
pub(crate) struct EpochMap {
    map: BTreeMap<i64, LogEpoch>,
}

impl EpochMap {
    /// The epoch at `key_ms`, created empty when new.
    pub(crate) fn at(&mut self, key_ms: i64) -> &mut LogEpoch {
        self.map.entry(key_ms).or_default()
    }

    /// The earliest key, if any.
    pub(crate) fn first_key(&self) -> Option<i64> {
        self.map.keys().next().copied()
    }

    /// Finish into a [`Timeline`].
    pub(crate) fn finish(self, skipped: usize) -> Timeline {
        let first = self.map.keys().next().copied().unwrap_or(0);
        let epochs = self
            .map
            .into_iter()
            .map(|(k, mut e)| {
                e.t_s = (k - first) as f64 / 1000.0;
                e
            })
            .collect();
        timeline_from(epochs, skipped)
    }
}
