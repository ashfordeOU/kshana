// SPDX-License-Identifier: AGPL-3.0-only
//! A PRN and code allocation registry for LunaNet AFS nodes, with a collision checker.
//!
//! A registry is a list of node allocations (TOML `[[node]]` tables or JSON), each the code
//! combination of one LunaNet service provider node ([`super::codes::NodeCodes`]: node identifier,
//! AFS-I PRN, AFS-Q primary PRN, secondary code S0-S3, tertiary PRN and phase) with a provider
//! name and a status. With no file the registry is LSIS V1.0's interim Table 11 (nodes 1 to 12,
//! [`super::codes::NodeCodes::interim`]); the standard marks the final assignment {LSIS-TBD-2001}.
//!
//! **Checks** (each finding names the nodes):
//!
//! * ranges: PRNs 1 to 210, secondary 0 to 3, tertiary phase below 1500, node identifier present;
//! * collisions: two nodes with the same node identifier, AFS-I PRN, AFS-Q primary PRN, or the
//!   same tertiary PRN and phase (errors: a receiver could not tell them apart on that code);
//! * correlation: for every pair of AFS-Q primary codes, the largest magnitude of the even periodic
//!   cross-correlation over all 10,230 code phases, in dB below the code length, and each code's
//!   largest out-of-phase autocorrelation, against a stated limit (default −20 dB). This needs no
//!   cached LSIS attachment: the AFS-Q primary codes are generated from the IS-GPS-800J indices.
//!   Doppler-shifted (odd and cross-ambiguity) correlation is not computed.
//!
//! MODELLED: the checks are of a stated allocation; the limit is a choice of this tool, not a value
//! of the standard.

use super::codes::{afs_q_primary, NodeCodes, MAX_PRN, Q_PRIMARY_LEN, Q_TERTIARY_LEN};
use crate::portable_math::PortableFloat;
use serde::{Deserialize, Serialize};

/// The honesty label.
pub const LABEL: &str =
    "MODELLED: checks of a stated code allocation; the correlation limit is this tool's choice, \
not a value of LSIS V1.0; zero-Doppler even periodic correlation only.";

/// One node's allocation.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Allocation {
    /// The provider or operator, as the registry names it.
    #[serde(default)]
    pub provider: String,
    /// `interim`, `proposed`, `assigned`, or any other status the registry uses.
    #[serde(default)]
    pub status: String,
    /// The code combination.
    #[serde(flatten)]
    pub codes: NodeCodes,
}

/// A registry file.
#[derive(Clone, Debug, Default, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Registry {
    /// The allocations.
    #[serde(default)]
    pub node: Vec<Allocation>,
}

impl Registry {
    /// LSIS V1.0 Table 11, the interim test-and-integration assignment.
    pub fn interim() -> Self {
        Registry {
            node: (1..=12)
                .filter_map(|id| NodeCodes::interim(id).ok())
                .map(|codes| Allocation {
                    provider: String::new(),
                    status: "interim (LSIS V1.0 Table 11)".into(),
                    codes,
                })
                .collect(),
        }
    }

    /// Parse TOML or JSON text.
    pub fn parse(text: &str) -> Result<Self, String> {
        if text.trim_start().starts_with('{') {
            serde_json::from_str(text)
                .map_err(|e| crate::terr!("e-lunar-afs-kit-bad-registry", e = e))
        } else {
            toml::from_str(text).map_err(|e| crate::terr!("e-lunar-afs-kit-bad-registry", e = e))
        }
    }
}

/// One finding.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Finding {
    /// `error` or `warning`.
    pub severity: &'static str,
    /// What kind.
    pub kind: &'static str,
    /// The node identifiers involved.
    pub nodes: Vec<u16>,
    /// A value, when the finding has one (a PRN, a correlation in dB).
    pub value: f64,
}

/// One pair's correlation.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct PairCorrelation {
    /// First node.
    pub a: u16,
    /// Second node.
    pub b: u16,
    /// Largest |even periodic cross-correlation| over all phases, dB relative to the code length.
    pub max_db: f64,
}

/// The check report.
#[derive(Clone, Debug, Serialize)]
pub struct Report {
    /// Document schema.
    pub schema: &'static str,
    /// Honesty label.
    pub label: &'static str,
    /// Nodes checked.
    pub nodes: usize,
    /// The correlation limit, dB.
    pub limit_db: f64,
    /// Findings.
    pub findings: Vec<Finding>,
    /// Pair correlations of the AFS-Q primary codes (distinct PRNs only).
    pub cross_correlation: Vec<PairCorrelation>,
    /// Largest out-of-phase autocorrelation per AFS-Q primary PRN used, dB.
    pub autocorrelation: Vec<(u16, f64)>,
    /// True when no finding is an error.
    pub valid: bool,
}

/// Pack chips into 64-bit words, twice over (so a window at any rotation can be read).
fn packed_twice(c: &[u8]) -> Vec<u64> {
    let n = c.len();
    let mut w = vec![0u64; (2 * n).div_ceil(64)];
    for i in 0..2 * n {
        if c[i % n] == 1 {
            w[i / 64] |= 1u64 << (i % 64);
        }
    }
    w
}

/// Bits `[off, off + n)` of a packed buffer, as words.
fn window(w: &[u64], off: usize, n: usize) -> Vec<u64> {
    let words = n.div_ceil(64);
    let (q, r) = (off / 64, off % 64);
    let mut out = vec![0u64; words];
    for (k, o) in out.iter_mut().enumerate() {
        let lo = w.get(q + k).copied().unwrap_or(0) >> r;
        let hi = if r == 0 {
            0
        } else {
            w.get(q + k + 1).copied().unwrap_or(0) << (64 - r)
        };
        *o = lo | hi;
    }
    if !n.is_multiple_of(64) {
        out[words - 1] &= (1u64 << (n % 64)) - 1;
    }
    out
}

/// Largest |even periodic correlation| of `a` with `b` over all phases (skipping phase 0 when
/// `skip_zero`), as a count out of the length.
pub fn max_periodic_correlation(a: &[u8], b: &[u8], skip_zero: bool) -> i64 {
    let n = a.len();
    let aw = window(&packed_twice(a), 0, n);
    let bw = packed_twice(b);
    let mut best = 0i64;
    for k in 0..n {
        if skip_zero && k == 0 {
            continue;
        }
        let bk = window(&bw, k, n);
        let diff: u32 = aw.iter().zip(&bk).map(|(x, y)| (x ^ y).count_ones()).sum();
        let corr = n as i64 - 2 * diff as i64;
        best = best.max(corr.abs());
    }
    best
}

fn db(count: i64, n: usize) -> f64 {
    if count == 0 {
        f64::NEG_INFINITY
    } else {
        20.0 * (count as f64 / n as f64).plog10()
    }
}

/// Check a registry.
pub fn check(reg: &Registry, limit_db: f64, correlate: bool) -> Report {
    let mut f = Vec::new();
    let nodes: Vec<&NodeCodes> = reg.node.iter().map(|a| &a.codes).collect();
    let err = |kind: &'static str, nodes: Vec<u16>, value: f64| Finding {
        severity: "error",
        kind,
        nodes,
        value,
    };
    for c in &nodes {
        let bad_prn = |p: u16| !(1..=MAX_PRN).contains(&p);
        if c.node_id == 0 {
            f.push(err("node_id_zero", vec![c.node_id], 0.0));
        }
        for (kind, p) in [
            ("i_prn_out_of_range", c.i_prn),
            ("q_prn_out_of_range", c.q_prn),
            ("tertiary_prn_out_of_range", c.tertiary_prn),
        ] {
            if bad_prn(p) {
                f.push(err(kind, vec![c.node_id], p as f64));
            }
        }
        if c.secondary > 3 {
            f.push(err(
                "secondary_out_of_range",
                vec![c.node_id],
                c.secondary as f64,
            ));
        }
        if c.tertiary_phase as usize >= Q_TERTIARY_LEN {
            f.push(err(
                "tertiary_phase_out_of_range",
                vec![c.node_id],
                c.tertiary_phase as f64,
            ));
        }
    }
    for i in 0..nodes.len() {
        for j in i + 1..nodes.len() {
            let (a, b) = (nodes[i], nodes[j]);
            let pair = vec![a.node_id, b.node_id];
            if a.node_id == b.node_id {
                f.push(err("duplicate_node_id", pair.clone(), a.node_id as f64));
            }
            if a.i_prn == b.i_prn {
                f.push(err("shared_i_prn", pair.clone(), a.i_prn as f64));
            }
            if a.q_prn == b.q_prn {
                f.push(err("shared_q_prn", pair.clone(), a.q_prn as f64));
            }
            if a.tertiary_prn == b.tertiary_prn && a.tertiary_phase == b.tertiary_phase {
                f.push(err("shared_tertiary", pair, a.tertiary_prn as f64));
            }
        }
    }
    let mut cross = Vec::new();
    let mut auto = Vec::new();
    if correlate {
        let mut prns: Vec<u16> = nodes
            .iter()
            .map(|c| c.q_prn)
            .filter(|p| (1..=MAX_PRN).contains(p))
            .collect();
        prns.sort_unstable();
        prns.dedup();
        let codes: Vec<(u16, Vec<u8>)> = prns
            .iter()
            .filter_map(|&p| afs_q_primary(p).ok().map(|c| (p, c)))
            .collect();
        for (p, c) in &codes {
            let a = db(max_periodic_correlation(c, c, true), Q_PRIMARY_LEN);
            auto.push((*p, a));
            if a > limit_db {
                let ids = nodes
                    .iter()
                    .filter(|n| n.q_prn == *p)
                    .map(|n| n.node_id)
                    .collect();
                f.push(Finding {
                    severity: "warning",
                    kind: "autocorrelation_above_limit",
                    nodes: ids,
                    value: a,
                });
            }
        }
        for i in 0..codes.len() {
            for j in i + 1..codes.len() {
                let v = db(
                    max_periodic_correlation(&codes[i].1, &codes[j].1, false),
                    Q_PRIMARY_LEN,
                );
                let id = |p: u16| nodes.iter().find(|n| n.q_prn == p).map_or(0, |n| n.node_id);
                let (a, b) = (id(codes[i].0), id(codes[j].0));
                cross.push(PairCorrelation { a, b, max_db: v });
                if v > limit_db {
                    f.push(Finding {
                        severity: "warning",
                        kind: "cross_correlation_above_limit",
                        nodes: vec![a, b],
                        value: v,
                    });
                }
            }
        }
    }
    let valid = f.iter().all(|x| x.severity != "error");
    Report {
        schema: "kshana.lunar-afs-registry-check/1",
        label: LABEL,
        nodes: nodes.len(),
        limit_db,
        findings: f,
        cross_correlation: cross,
        autocorrelation: auto,
        valid,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_interim_table_is_clean_on_codes() {
        let r = check(&Registry::interim(), -20.0, false);
        assert_eq!(r.nodes, 12);
        assert!(r.valid, "{:?}", r.findings);
        assert!(r.findings.is_empty());
    }

    #[test]
    fn collisions_and_ranges_are_errors() {
        let mut reg = Registry::interim();
        reg.node[1].codes.q_prn = reg.node[0].codes.q_prn;
        reg.node[2].codes.secondary = 7;
        reg.node[3].codes.i_prn = 400;
        reg.node[4].codes.node_id = reg.node[5].codes.node_id;
        let r = check(&reg, -20.0, false);
        assert!(!r.valid);
        let kinds: Vec<&str> = r.findings.iter().map(|f| f.kind).collect();
        for k in [
            "shared_q_prn",
            "secondary_out_of_range",
            "i_prn_out_of_range",
            "duplicate_node_id",
        ] {
            assert!(kinds.contains(&k), "{k} not in {kinds:?}");
        }
    }

    #[test]
    fn correlation_is_exact_on_small_cases_and_weil_codes_are_low() {
        // A code against itself at phase 0 is the full length; an m-sequence of length 7 has
        // out-of-phase autocorrelation -1.
        let m7 = [1u8, 1, 1, 0, 1, 0, 0];
        assert_eq!(max_periodic_correlation(&m7, &m7, false), 7);
        assert_eq!(max_periodic_correlation(&m7, &m7, true), 1);
        // Two AFS-Q primary codes: well below -20 dB.
        let mut reg = Registry::interim();
        reg.node.truncate(2);
        let r = check(&reg, -20.0, true);
        assert_eq!(r.cross_correlation.len(), 1);
        assert!(
            r.cross_correlation[0].max_db < -20.0,
            "{:?}",
            r.cross_correlation
        );
        assert!(
            r.autocorrelation.iter().all(|a| a.1 < -20.0),
            "{:?}",
            r.autocorrelation
        );
        assert!(r.valid);
    }

    #[test]
    fn toml_and_json_read() {
        let t = "[[node]]\nprovider = \"A\"\nstatus = \"proposed\"\nnode_id = 20\ni_prn = 20\nq_prn = 20\nsecondary = 3\ntertiary_prn = 20\ntertiary_phase = 0\n";
        let r = Registry::parse(t).unwrap();
        assert_eq!(r.node[0].codes.node_id, 20);
        let j = serde_json::to_string(&r).unwrap();
        assert_eq!(Registry::parse(&j).unwrap().node, r.node);
        assert!(Registry::parse("[[node]]\nnode_id = 1\nbogus = 2\n").is_err());
    }
}
