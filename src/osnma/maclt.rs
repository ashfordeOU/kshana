// SPDX-License-Identifier: AGPL-3.0-only
//! MAC look-up table (ICD 3.2.3.8 and Annex C): the per-chain sequence of ADKD types
//! of the tags in a MACK message. Slot 0 is always the self-authenticating Tag0.
//!
//! The built-in entries live in `maclt_data.rs` as compact specifications; further
//! entries can be added at run time with [`MacLookup::with_entry`], as the ICD asks of
//! a receiver.

use std::collections::BTreeMap;

/// One tag slot of a sequence.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Slot {
    /// Tag-Info not fixed by the table; authenticated through MACSEQ.
    Flexible,
    /// Fixed ADKD type; `own` is true when the tag covers the transmitting satellite's
    /// own data (self-authentication) rather than another satellite's.
    Fixed { adkd: u8, own: bool },
}

/// The sequences of one table entry: one per MACK message of the cycle.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Entry {
    pub sequences: Vec<Vec<Slot>>,
}

impl Entry {
    /// Parse `"00S,FLX,04S"` style slot lists, one per message, separated by `|`.
    pub fn parse(spec: &str) -> Option<Self> {
        let sequences = spec
            .split('|')
            .map(|seq| seq.split(',').map(|s| parse_slot(s.trim())).collect())
            .collect::<Option<Vec<Vec<Slot>>>>()?;
        let ok = !sequences.is_empty()
            && sequences
                .iter()
                .all(|s| !s.is_empty() && s[0] == Slot::Fixed { adkd: 0, own: true });
        ok.then_some(Self { sequences })
    }

    /// The sequence in force for the MACK sent in the sub-frame starting at `gst_sf`:
    /// a two-message sequence starts with the first half of a GST minute.
    pub fn sequence_at(&self, gst_sf: u32) -> &[Slot] {
        let i = if self.sequences.len() == 2 && gst_sf % 60 != 0 {
            1
        } else {
            0
        };
        &self.sequences[i]
    }
}

fn parse_slot(s: &str) -> Option<Slot> {
    if s == "FLX" {
        return Some(Slot::Flexible);
    }
    let b = s.as_bytes();
    if b.len() != 3 {
        return None;
    }
    let adkd = s[..2].parse().ok()?;
    let own = match b[2] {
        b'S' => true,
        b'E' => false,
        _ => return None,
    };
    Some(Slot::Fixed { adkd, own })
}

/// The table, keyed by the MACLT field value.
#[derive(Debug, Clone)]
pub struct MacLookup {
    entries: BTreeMap<u8, Entry>,
}

impl Default for MacLookup {
    fn default() -> Self {
        let entries = super::maclt_data::BUILTIN
            .iter()
            .filter_map(|(id, spec)| Entry::parse(spec).map(|e| (*id, e)))
            .collect();
        Self { entries }
    }
}

impl MacLookup {
    pub fn get(&self, maclt: u8) -> Option<&Entry> {
        self.entries.get(&maclt)
    }

    /// Add or replace an entry from its specification string.
    pub fn with_entry(mut self, maclt: u8, spec: &str) -> Option<Self> {
        self.entries.insert(maclt, Entry::parse(spec)?);
        Some(self)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn parses_slots_and_alternates_sequences() {
        let e = Entry::parse("00S,FLX,04S,00E|00S,00E,12E,FLX").unwrap();
        assert_eq!(e.sequences.len(), 2);
        assert_eq!(e.sequences[0][1], Slot::Flexible);
        assert_eq!(e.sequences[0][2], Slot::Fixed { adkd: 4, own: true });
        assert_eq!(
            e.sequences[0][3],
            Slot::Fixed {
                adkd: 0,
                own: false
            }
        );
        // Sub-frame at the top of a minute uses the first sequence, 30 s later the second.
        assert_eq!(e.sequence_at(120)[1], Slot::Flexible);
        assert_eq!(
            e.sequence_at(150)[2],
            Slot::Fixed {
                adkd: 12,
                own: false
            }
        );
    }

    #[test]
    fn rejects_malformed_specs() {
        assert!(Entry::parse("FLX,00S").is_none()); // slot 0 must be 00S
        assert!(Entry::parse("00S,0X").is_none());
        assert!(Entry::parse("00S,00Q").is_none());
        assert!(Entry::parse("").is_none());
    }

    #[test]
    fn user_entries_extend_and_override_the_builtin_set() {
        let base = MacLookup::default();
        let builtin_34 = base.get(34).unwrap().clone();
        // Extends: a new id the built-in set does not have.
        let t = base.with_entry(200, "00S,00E,04S").unwrap();
        assert_eq!(t.get(200).unwrap().sequences[0].len(), 3);
        assert_eq!(t.get(34), Some(&builtin_34));
        // Overrides: an existing id takes the user's sequence.
        let t = t.with_entry(34, "00S,12S|00S,00E").unwrap();
        assert_eq!(t.get(34).unwrap().sequences.len(), 2);
        assert_ne!(t.get(34), Some(&builtin_34));
        // A malformed entry is refused and changes nothing.
        assert!(MacLookup::default().with_entry(34, "FLX").is_none());
    }

    #[test]
    fn builtin_entries_have_matching_lengths() {
        let t = MacLookup::default();
        assert!(t.get(34).is_some());
        for (id, _) in super::super::maclt_data::BUILTIN {
            let e = t
                .get(*id)
                .unwrap_or_else(|| panic!("entry {id} did not parse"));
            let n = e.sequences[0].len();
            assert!(e.sequences.iter().all(|s| s.len() == n), "entry {id}");
        }
        assert!(t.get(1).is_none());
    }
}
