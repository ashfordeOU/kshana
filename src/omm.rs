// SPDX-License-Identifier: Apache-2.0
//! CCSDS OMM (Orbit Mean-Elements Message, 502.0-B-2) writer.
//!
//! [`crate::oem`] emits the *ephemeris* (state-vector) message; this module emits the
//! *mean-elements* message — the standards-track way to publish SGP4/TLE mean orbital
//! elements (mean motion, eccentricity, inclination, RAAN, argument of perigee, mean
//! anomaly, plus `BSTAR`) in CCSDS KVN form, so a Kshana scenario's orbit can be consumed
//! by any OMM-aware tool instead of as a bespoke two-line element set.
//!
//! Scope (honest): the KVN serialisation and the TLE→OMM mapping ship here; the XML
//! (`ndm/omm`) rendering and a reference-parser round-trip are follow-ons (see `ROADMAP.md`).

use crate::tle::Tle;
use std::f64::consts::PI;

/// Minutes per day (TLE mean motion is per minute; OMM is per day).
const MIN_PER_DAY: f64 = 1440.0;

/// A CCSDS OMM mean-elements message.
#[derive(Clone, Debug)]
pub struct OmmFile {
    /// `CCSDS_OMM_VERS` value (`2.0`).
    pub version: String,
    /// `CREATION_DATE` (ISO-8601).
    pub creation_date: String,
    /// `ORIGINATOR`.
    pub originator: String,
    /// `OBJECT_NAME`.
    pub object_name: String,
    /// `OBJECT_ID` (international designator, e.g. `1998-067A`).
    pub object_id: String,
    /// `CENTER_NAME` (e.g. `EARTH`).
    pub center_name: String,
    /// `REF_FRAME` (e.g. `TEME`).
    pub ref_frame: String,
    /// `TIME_SYSTEM` (e.g. `UTC`).
    pub time_system: String,
    /// `MEAN_ELEMENT_THEORY` (e.g. `SGP4`).
    pub mean_element_theory: String,
    /// `EPOCH` (ISO-8601).
    pub epoch: String,
    /// `MEAN_MOTION` (revolutions/day).
    pub mean_motion_rev_day: f64,
    /// `ECCENTRICITY`.
    pub eccentricity: f64,
    /// `INCLINATION` (deg).
    pub inclination_deg: f64,
    /// `RA_OF_ASC_NODE` (deg).
    pub ra_of_asc_node_deg: f64,
    /// `ARG_OF_PERICENTER` (deg).
    pub arg_of_pericenter_deg: f64,
    /// `MEAN_ANOMALY` (deg).
    pub mean_anomaly_deg: f64,
    /// `BSTAR` drag term (1/earth-radii).
    pub bstar: f64,
    /// `NORAD_CAT_ID`.
    pub norad_cat_id: u32,
    /// `EPHEMERIS_TYPE` (0 for SGP4).
    pub ephemeris_type: u32,
    /// `CLASSIFICATION_TYPE` (`U` for unclassified).
    pub classification: char,
}

impl OmmFile {
    /// Build an OMM from SGP4/TLE mean elements, converting to the OMM units
    /// (mean motion in rev/day, angles in degrees). The caller supplies the message
    /// metadata (names, identifiers, epoch string) that the bare elements do not carry.
    #[allow(clippy::too_many_arguments)]
    pub fn from_tle(
        tle: &Tle,
        object_name: &str,
        object_id: &str,
        epoch: &str,
        creation_date: &str,
        originator: &str,
        norad_cat_id: u32,
    ) -> Self {
        Self {
            version: "2.0".into(),
            creation_date: creation_date.into(),
            originator: originator.into(),
            object_name: object_name.into(),
            object_id: object_id.into(),
            center_name: "EARTH".into(),
            ref_frame: "TEME".into(),
            time_system: "UTC".into(),
            mean_element_theory: "SGP4".into(),
            epoch: epoch.into(),
            mean_motion_rev_day: tle.no_kozai_rad_min * MIN_PER_DAY / (2.0 * PI),
            eccentricity: tle.ecco,
            inclination_deg: tle.inclo_rad.to_degrees(),
            ra_of_asc_node_deg: tle.nodeo_rad.to_degrees(),
            arg_of_pericenter_deg: tle.argpo_rad.to_degrees(),
            mean_anomaly_deg: tle.mo_rad.to_degrees(),
            bstar: tle.bstar,
            norad_cat_id,
            ephemeris_type: 0,
            classification: 'U',
        }
    }

    /// Build one OMM per satellite from a block of TLEs (two- or three-line form).
    /// Each full line-1 + line-2 pair becomes an OMM carrying the satellite's real
    /// NORAD catalogue number, COSPAR designator, and epoch (parsed from line 1 via
    /// [`crate::tle::parse_tle_identity`]); the preceding name line, if any, is the
    /// `OBJECT_NAME`, otherwise the object is named `OBJECT <catalogue id>`. The
    /// `originator` and `creation_date` are stamped on every message. A bare line-2
    /// (analytic Keplerian, no SGP4 mean elements) cannot become an OMM and is
    /// skipped; an `Err` is returned if the block yields no full element set.
    pub fn from_tle_block(
        text: &str,
        originator: &str,
        creation_date: &str,
    ) -> Result<Vec<OmmFile>, String> {
        let mut out = Vec::new();
        let mut name: Option<String> = None;
        let mut pending_l1: Option<String> = None;
        for raw in text.lines() {
            let line = raw.trim();
            if line.starts_with("1 ") && line.len() >= 63 {
                pending_l1 = Some(line.to_string());
            } else if line.starts_with("2 ") && line.len() >= 63 {
                match pending_l1.take() {
                    Some(l1) => {
                        let tle = crate::tle::parse_tle(&l1, line)?;
                        let id = crate::tle::parse_tle_identity(&l1)?;
                        let object_name = name
                            .take()
                            .unwrap_or_else(|| format!("OBJECT {}", id.norad_cat_id));
                        out.push(OmmFile::from_tle(
                            &tle,
                            &object_name,
                            &id.intl_designator,
                            &id.epoch_iso,
                            creation_date,
                            originator,
                            id.norad_cat_id,
                        ));
                    }
                    // Line 2 with no line 1: analytic Keplerian only — no OMM.
                    None => name = None,
                }
            } else if !line.is_empty() {
                // A name line: remember it for the next element set.
                name = Some(line.to_string());
                pending_l1 = None;
            }
        }
        if out.is_empty() {
            return Err("OMM export needs full (line 1 + line 2) TLEs; this block has none".into());
        }
        Ok(out)
    }

    /// Serialise to CCSDS OMM KVN (keyword = value) form.
    pub fn to_omm_kvn(&self) -> String {
        let mut s = String::new();
        s.push_str(&format!("CCSDS_OMM_VERS = {}\n", self.version));
        s.push_str(&format!("CREATION_DATE = {}\n", self.creation_date));
        s.push_str(&format!("ORIGINATOR = {}\n", self.originator));
        s.push_str("META_START\n");
        s.push_str(&format!("OBJECT_NAME = {}\n", self.object_name));
        s.push_str(&format!("OBJECT_ID = {}\n", self.object_id));
        s.push_str(&format!("CENTER_NAME = {}\n", self.center_name));
        s.push_str(&format!("REF_FRAME = {}\n", self.ref_frame));
        s.push_str(&format!("TIME_SYSTEM = {}\n", self.time_system));
        s.push_str(&format!(
            "MEAN_ELEMENT_THEORY = {}\n",
            self.mean_element_theory
        ));
        s.push_str("META_STOP\n");
        s.push_str(&format!("EPOCH = {}\n", self.epoch));
        s.push_str(&format!("MEAN_MOTION = {:.8}\n", self.mean_motion_rev_day));
        s.push_str(&format!("ECCENTRICITY = {:.7}\n", self.eccentricity));
        s.push_str(&format!("INCLINATION = {:.4}\n", self.inclination_deg));
        s.push_str(&format!(
            "RA_OF_ASC_NODE = {:.4}\n",
            self.ra_of_asc_node_deg
        ));
        s.push_str(&format!(
            "ARG_OF_PERICENTER = {:.4}\n",
            self.arg_of_pericenter_deg
        ));
        s.push_str(&format!("MEAN_ANOMALY = {:.4}\n", self.mean_anomaly_deg));
        s.push_str(&format!("EPHEMERIS_TYPE = {}\n", self.ephemeris_type));
        s.push_str(&format!("CLASSIFICATION_TYPE = {}\n", self.classification));
        s.push_str(&format!("NORAD_CAT_ID = {}\n", self.norad_cat_id));
        s.push_str(&format!("BSTAR = {:.8e}\n", self.bstar));
        s
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn sample_tle() -> Tle {
        // ISS-like mean elements: i = 51.6°, ≈ 15.5 rev/day.
        Tle {
            epoch_days_1950: 26000.0,
            bstar: 1.0e-4,
            ecco: 0.000_6,
            argpo_rad: 30.0_f64.to_radians(),
            inclo_rad: 51.6_f64.to_radians(),
            mo_rad: 120.0_f64.to_radians(),
            no_kozai_rad_min: 15.5 * 2.0 * PI / MIN_PER_DAY,
            nodeo_rad: 247.0_f64.to_radians(),
        }
    }

    #[test]
    fn from_tle_converts_to_omm_units() {
        let omm = OmmFile::from_tle(
            &sample_tle(),
            "ISS",
            "1998-067A",
            "2024-01-01T00:00:00",
            "2024-01-01T01:00:00",
            "KSHANA",
            25544,
        );
        assert!(
            (omm.mean_motion_rev_day - 15.5).abs() < 1e-9,
            "n = {}",
            omm.mean_motion_rev_day
        );
        assert!((omm.inclination_deg - 51.6).abs() < 1e-9);
        assert!((omm.ra_of_asc_node_deg - 247.0).abs() < 1e-9);
        assert!((omm.mean_anomaly_deg - 120.0).abs() < 1e-9);
        assert!((omm.eccentricity - 0.000_6).abs() < 1e-12);
    }

    #[test]
    fn kvn_has_the_required_omm_fields() {
        let omm = OmmFile::from_tle(
            &sample_tle(),
            "ISS",
            "1998-067A",
            "2024-01-01T00:00:00",
            "2024-01-01T01:00:00",
            "KSHANA",
            25544,
        );
        let kvn = omm.to_omm_kvn();
        assert!(kvn.starts_with("CCSDS_OMM_VERS = 2.0\n"));
        for key in [
            "MEAN_ELEMENT_THEORY = SGP4",
            "MEAN_MOTION = 15.5",
            "ECCENTRICITY = 0.0006000",
            "INCLINATION = 51.6000",
            "RA_OF_ASC_NODE = 247.0000",
            "ARG_OF_PERICENTER = 30.0000",
            "MEAN_ANOMALY = 120.0000",
            "NORAD_CAT_ID = 25544",
            "META_START",
            "META_STOP",
        ] {
            assert!(kvn.contains(key), "OMM KVN missing {key}:\n{kvn}");
        }
    }

    // A two-object three-line TLE block (name + line 1 + line 2 each).
    const BLOCK: &str = "ISS (ZARYA)\n\
        1 25544U 98067A   24001.00000000  .00000000  00000-0  00000-0 0  9990\n\
        2 25544  51.6400 247.4627 0006703 130.5360 325.0288 15.72125391563537\n\
        VANGUARD 1\n\
        1 00005U 58002B   00179.78495062  .00000023  00000-0  28098-4 0  4753\n\
        2 00005  34.2682 348.7242 1859667 331.7664  19.3264 10.82419157413667";

    #[test]
    fn from_tle_block_builds_one_omm_per_satellite_with_real_ids() {
        let files = OmmFile::from_tle_block(BLOCK, "KSHANA", "2024-01-01T00:00:00")
            .expect("valid TLE block");
        assert_eq!(files.len(), 2);

        assert_eq!(files[0].object_name, "ISS (ZARYA)");
        assert_eq!(files[0].object_id, "1998-067A");
        assert_eq!(files[0].norad_cat_id, 25544);
        assert_eq!(files[0].epoch, "2024-001T00:00:00.000000");
        assert!((files[0].mean_motion_rev_day - 15.72125391).abs() < 1e-6);

        assert_eq!(files[1].object_name, "VANGUARD 1");
        assert_eq!(files[1].object_id, "1958-002B");
        assert_eq!(files[1].norad_cat_id, 5);
    }

    #[test]
    fn from_tle_block_names_unnamed_objects_by_catalog_number() {
        // No name line before the element set: name falls back to the catalogue id.
        let bare = "1 00005U 58002B   00179.78495062  .00000023  00000-0  28098-4 0  4753\n\
                    2 00005  34.2682 348.7242 1859667 331.7664  19.3264 10.82419157413667";
        let files = OmmFile::from_tle_block(bare, "KSHANA", "2024-01-01T00:00:00").unwrap();
        assert_eq!(files.len(), 1);
        assert_eq!(files[0].object_name, "OBJECT 5");
    }

    #[test]
    fn from_tle_block_errors_when_there_are_no_full_element_sets() {
        // A line-2-only block (analytic Keplerian, e.g. a synthetic Walker set)
        // carries no SGP4 mean elements, so it cannot become an OMM.
        let line2_only = "2 00005  34.2682 348.7242 1859667 331.7664  19.3264 10.82419157413667";
        assert!(OmmFile::from_tle_block(line2_only, "KSHANA", "2024-01-01T00:00:00").is_err());
    }
}
