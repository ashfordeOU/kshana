// SPDX-License-Identifier: AGPL-3.0-only
//! The `lab-attestation` record of an evidence pack made from a laboratory session.
//!
//! A statement by a named operator about the setup a hardware session used: whether the
//! equipment was connected through a conducted path or kept in a shielded enclosure, how much
//! attenuation sat between them, and what emitted any radio-frequency signal. It is recorded
//! in the signed manifest as given and is never inferred or verified: Kshana did not see the
//! bench, and an attestation does not make any emission lawful. See `docs/HARDWARE-SAFETY.md`.

use serde::{Deserialize, Serialize};

/// What the report says about the record's standing.
pub const STANDING: &str = "attested by the named operator; not verified by Kshana";

const MAX_FIELD: usize = 2000;

/// The setup the operator attests to.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct LabAttestation {
    /// The person (or role) responsible for the session.
    pub operator: String,
    /// The laboratory or company.
    pub organisation: String,
    /// The day of the session, `YYYY-MM-DD`.
    pub date: String,
    /// `conducted` (equipment joined by a cable path) or `shielded` (kept in an RF enclosure).
    pub setup: String,
    /// Total attenuation from the emitter to the device (dB); required for `conducted`.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub attenuation_db: Option<f64>,
    /// The enclosure, by model or identifier; required for `shielded`.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub enclosure: Option<String>,
    /// What produced any radio-frequency signal (for example a laboratory-owned simulator).
    pub emitter: String,
    /// The operator's own statement, free text.
    pub statement: String,
    /// An optional detached signature by the operator over the statement, recorded as given.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub signature: Option<String>,
}

fn day_ok(d: &str) -> bool {
    let p: Vec<&str> = d.split('-').collect();
    matches!(p.as_slice(), [y, m, day]
        if y.len() == 4 && m.len() == 2 && day.len() == 2
            && y.bytes().chain(m.bytes()).chain(day.bytes()).all(|b| b.is_ascii_digit())
            && (1..=12).contains(&m.parse::<u32>().unwrap_or(0))
            && (1..=31).contains(&day.parse::<u32>().unwrap_or(0)))
}

impl LabAttestation {
    /// Read an attestation from TOML: the fields at the top level, or inside a
    /// `[lab-attestation]` table. Validated.
    pub fn from_toml(text: &str) -> Result<Self, String> {
        let table: toml::Table = text
            .parse()
            .map_err(|e| crate::terr!("e-evidence-lab-invalid-lab-attestation-toml", e = e))?;
        let body = match table.get("lab-attestation") {
            Some(toml::Value::Table(t)) => t.clone(),
            Some(_) => return Err(crate::terr!("e-evidence-lab-lab-attestation-must-be-table")),
            None => table,
        };
        let a: LabAttestation = toml::Value::Table(body)
            .try_into()
            .map_err(|e| crate::terr!("e-evidence-lab-invalid-lab-attestation", e = e))?;
        a.validate()?;
        Ok(a)
    }

    /// Check the record is complete and states a setup Kshana accepts as a lab run.
    pub fn validate(&self) -> Result<(), String> {
        for (name, v) in [
            ("operator", &self.operator),
            ("organisation", &self.organisation),
            ("emitter", &self.emitter),
            ("statement", &self.statement),
        ] {
            if v.trim().is_empty() {
                return Err(crate::terr!(
                    "e-evidence-lab-lab-attestation-is-required",
                    name = name
                ));
            }
        }
        for (name, v) in [
            ("operator", Some(&self.operator)),
            ("organisation", Some(&self.organisation)),
            ("emitter", Some(&self.emitter)),
            ("statement", Some(&self.statement)),
            ("enclosure", self.enclosure.as_ref()),
            ("signature", self.signature.as_ref()),
        ] {
            if v.is_some_and(|s| s.len() > MAX_FIELD) {
                return Err(crate::terr!(
                    "e-evidence-lab-lab-attestation-is-over-bytes",
                    name = name,
                    MAX_FIELD = MAX_FIELD
                ));
            }
        }
        if !day_ok(&self.date) {
            return Err(crate::terr!(
                "e-evidence-lab-lab-attestation-date-is-not",
                date = format!("{:?}", self.date)
            ));
        }
        match self.setup.as_str() {
            "conducted" => match self.attenuation_db {
                Some(a) if a.is_finite() && a >= 0.0 => {}
                _ => {
                    return Err(
                        "lab-attestation: a conducted setup needs attenuation_db, a finite number of dB, 0 or more"
                            .into(),
                    )
                }
            },
            "shielded" => {
                if self.enclosure.as_deref().is_none_or(|e| e.trim().is_empty()) {
                    return Err(crate::terr!("e-evidence-lab-lab-attestation-shielded-setup-needs"));
                }
            }
            other => {
                return Err(crate::terr!("e-evidence-lab-lab-attestation-setup-must-be", other = format!("{:?}", other)))
            }
        }
        if self.attenuation_db.is_some_and(|a| !a.is_finite()) {
            return Err(crate::terr!(
                "e-evidence-lab-lab-attestation-attenuation-db-must"
            ));
        }
        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    const OK: &str = r#"
[lab-attestation]
operator = "lab technician"
organisation = "a laboratory"
date = "2026-11-02"
setup = "conducted"
attenuation_db = 60.0
emitter = "laboratory-owned simulator"
statement = "No emission outside the cable path."
"#;

    #[test]
    fn a_complete_attestation_parses_from_a_table_or_the_top_level() {
        let a = LabAttestation::from_toml(OK).unwrap();
        assert_eq!(
            (a.setup.as_str(), a.attenuation_db),
            ("conducted", Some(60.0))
        );
        let flat = OK.replace("[lab-attestation]\n", "");
        assert_eq!(LabAttestation::from_toml(&flat).unwrap(), a);
    }

    #[test]
    fn what_is_missing_or_not_accepted_is_named() {
        let bad = |s: &str| LabAttestation::from_toml(s).unwrap_err();
        assert!(bad(&OK.replace("attenuation_db = 60.0\n", "")).contains("attenuation_db"));
        assert!(bad(&OK.replace("conducted", "over-the-air")).contains("over-the-air"));
        assert!(bad(&OK.replace("conducted", "shielded")).contains("enclosure"));
        assert!(bad(&OK.replace("2026-11-02", "2 Nov")).contains("date"));
        assert!(bad(&OK.replace("a laboratory", "  ")).contains("organisation"));
        assert!(bad(&format!("{OK}extra = 1\n")).contains("extra"));
        assert!(bad(&OK.replace("60.0", "-3.0")).contains("attenuation_db"));
    }
}
