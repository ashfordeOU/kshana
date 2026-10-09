// SPDX-License-Identifier: AGPL-3.0-only
//! The approved open data sources and the licence and attribution text each output file
//! must carry. The review behind this list is `docs/data/INTERFERENCE-DATA-SOURCES.md`.
//! A source that is not on the list is refused: a custom dataset must supply its own
//! licence and attribution text on the command line.

use serde_json::{json, Value};

#[derive(Debug, Clone, PartialEq)]
pub struct Dataset {
    pub key: String,
    pub kind: Kind,
    pub name: String,
    pub licence: String,
    pub licence_url: String,
    pub attribution: String,
    /// Coverage limits of the source that bias the map. Embedded in the output.
    pub coverage_notes: Vec<String>,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Kind {
    Adsb,
    Ais,
}

impl Kind {
    pub fn as_str(self) -> &'static str {
        match self {
            Kind::Adsb => "adsb",
            Kind::Ais => "ais",
        }
    }
}

pub const ADSB_LOL: &str = "adsb-lol";
pub const NOAA_MARINECADASTRE: &str = "noaa-marinecadastre";
pub const KYSTVERKET: &str = "kystverket";

pub fn preset(key: &str) -> Option<Dataset> {
    match key {
        ADSB_LOL => Some(Dataset {
            key: key.into(),
            kind: Kind::Adsb,
            name: "adsb.lol aircraft position archive".into(),
            licence: "ODbL-1.0".into(),
            licence_url: "https://opendatacommons.org/licenses/odbl/1-0/".into(),
            attribution: "Contains aircraft position data from adsb.lol, made available under the Open Database License (ODbL 1.0), https://opendatacommons.org/licenses/odbl/1-0/".into(),
            coverage_notes: vec![
                "Coverage follows volunteer receiver locations: sparse over open sea and in regions with few receivers.".into(),
                "This file is a Derived Database of ODbL data and is itself released under ODbL 1.0.".into(),
            ],
        }),
        NOAA_MARINECADASTRE => Some(Dataset {
            key: key.into(),
            kind: Kind::Ais,
            name: "MarineCadastre AIS vessel traffic (US waters)".into(),
            licence: "Public domain (US federal government work; CC0 1.0 as stated by the publisher)".into(),
            licence_url: "https://creativecommons.org/publicdomain/zero/1.0/".into(),
            attribution: "Source: NOAA Office for Coastal Management and BOEM, MarineCadastre.gov".into(),
            coverage_notes: vec![
                "US waters only, from shore-based and some satellite receivers.".into(),
                "Vessels without an AIS transponder, and any that switch it off, are not seen.".into(),
            ],
        }),
        KYSTVERKET => Some(Dataset {
            key: key.into(),
            kind: Kind::Ais,
            name: "Norwegian Coastal Administration open AIS data".into(),
            licence: "NLOD-2.0".into(),
            licence_url: "https://data.norge.no/nlod/en/2.0".into(),
            attribution: "Contains data under the Norwegian Licence for Open Government Data (NLOD) made available by the Norwegian Coastal Administration, https://data.norge.no/nlod/en/2.0".into(),
            coverage_notes: vec![
                "Open access excludes fishing vessels under 15 m and recreational craft under 45 m, so the map is biased towards larger ships.".into(),
                "Coverage is the Norwegian economic zone and the protection zones off Svalbard and Jan Mayen.".into(),
            ],
        }),
        _ => None,
    }
}

pub fn preset_keys() -> [&'static str; 3] {
    [ADSB_LOL, NOAA_MARINECADASTRE, KYSTVERKET]
}

/// A dataset supplied entirely by the user. Licence and attribution are mandatory so that
/// no output file is written without them.
pub fn custom(kind: Kind, licence: &str, licence_url: &str, attribution: &str) -> Dataset {
    Dataset {
        key: "custom".into(),
        kind,
        name: "user-supplied dataset".into(),
        licence: licence.into(),
        licence_url: licence_url.into(),
        attribution: attribution.into(),
        coverage_notes: vec![
            "Coverage of a user-supplied dataset is not described by Kshana.".into(),
        ],
    }
}

impl Dataset {
    pub fn to_json(&self) -> Value {
        json!({
            "dataset": self.key,
            "name": self.name,
            "licence": self.licence,
            "licence_url": self.licence_url,
            "attribution": self.attribution,
            "coverage_notes": self.coverage_notes,
        })
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn every_preset_carries_licence_and_attribution() {
        for k in preset_keys() {
            let d = preset(k).unwrap();
            assert!(
                !d.licence.is_empty() && !d.licence_url.is_empty() && !d.attribution.is_empty()
            );
            assert!(!d.coverage_notes.is_empty());
        }
        assert!(preset("opensky").is_none() && preset("adsbexchange").is_none());
    }

    #[test]
    fn adsb_preset_is_odbl_and_kystverket_states_its_bias() {
        assert_eq!(preset(ADSB_LOL).unwrap().licence, "ODbL-1.0");
        assert_eq!(preset(ADSB_LOL).unwrap().kind, Kind::Adsb);
        assert!(preset(KYSTVERKET).unwrap().coverage_notes[0].contains("15 m"));
    }
}
