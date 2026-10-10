// SPDX-License-Identifier: AGPL-3.0-only
//! Truth Doppler from a Kshana scene's truth sidecar, for the false-lock check on
//! synthetic recordings.

use crate::iq::scene::TruthRecord;
use std::collections::BTreeMap;
use std::path::Path;

/// True Doppler per satellite over time, from a truth sidecar (CSV or JSON Lines).
#[derive(Clone, Debug, Default)]
pub struct TruthDoppler {
    series: BTreeMap<u32, Vec<(f64, f64)>>,
}

impl TruthDoppler {
    /// Read a truth sidecar written by `kshana iq scene` (CSV with its header, or JSON
    /// Lines).
    pub fn load(path: &Path) -> Result<Self, String> {
        let text = std::fs::read_to_string(path).map_err(|e| format!("{}: {e}", path.display()))?;
        Self::parse(&text).map_err(|e| format!("{}: {e}", path.display()))
    }

    /// Parse sidecar text.
    pub fn parse(text: &str) -> Result<Self, String> {
        let mut series: BTreeMap<u32, Vec<(f64, f64)>> = BTreeMap::new();
        for (i, line) in text.lines().enumerate() {
            let line = line.trim();
            if line.is_empty() || line == TruthRecord::CSV_HEADER {
                continue;
            }
            let r = if line.starts_with('{') {
                serde_json::from_str::<TruthRecord>(line).map_err(|e| e.to_string())
            } else {
                TruthRecord::from_csv_row(line).map_err(|e| e.to_string())
            }
            .map_err(|e| format!("truth line {}: {e}", i + 1))?;
            series
                .entry(r.sat_id)
                .or_default()
                .push((r.t_s, r.doppler_hz));
        }
        for v in series.values_mut() {
            v.sort_by(|a, b| a.0.total_cmp(&b.0));
        }
        Ok(Self { series })
    }

    /// A cursor over satellite `id`'s Doppler, or `None` when the truth does not hold it.
    pub fn cursor(&self, id: u32) -> Option<TruthCursor<'_>> {
        self.series
            .get(&id)
            .filter(|v| !v.is_empty())
            .map(|v| TruthCursor { v, i: 0 })
    }
}

/// Linear interpolation of one satellite's truth Doppler, for queries in time order.
pub struct TruthCursor<'a> {
    v: &'a [(f64, f64)],
    i: usize,
}

impl TruthCursor<'_> {
    /// Doppler at `t_s` (held flat outside the truth's span).
    pub fn at(&mut self, t_s: f64) -> f64 {
        let v = self.v;
        while self.i + 1 < v.len() && v[self.i + 1].0 <= t_s {
            self.i += 1;
        }
        let (t0, d0) = v[self.i];
        if t_s <= t0 || self.i + 1 >= v.len() {
            return d0;
        }
        let (t1, d1) = v[self.i + 1];
        d0 + (d1 - d0) * (t_s - t0) / (t1 - t0)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn interpolates_csv_truth() {
        let rec = |t: f64, d: f64| TruthRecord {
            t_s: t,
            sat_id: 4,
            visible: true,
            elevation_deg: 45.0,
            azimuth_deg: 0.0,
            cn0_dbhz: 45.0,
            pseudorange_m: 2e7,
            code_phase_chips: 0.0,
            doppler_hz: d,
            carrier_phase_cycles: 0.0,
        };
        let text = format!(
            "{}\n{}\n{}\n",
            TruthRecord::CSV_HEADER,
            rec(0.0, 100.0).csv_row(),
            rec(1.0, 200.0).csv_row()
        );
        let t = TruthDoppler::parse(&text).unwrap();
        let mut c = t.cursor(4).unwrap();
        assert_eq!(c.at(-1.0), 100.0);
        assert_eq!(c.at(0.25), 125.0);
        assert_eq!(c.at(5.0), 200.0);
        assert!(t.cursor(5).is_none());
    }
}
