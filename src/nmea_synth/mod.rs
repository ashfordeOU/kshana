// SPDX-License-Identifier: AGPL-3.0-only
//! Synthetic bridge NMEA 0183 for crew training: the `nmea-scenario` subcommand.
//!
//! A scenario TOML describes a vessel track (waypoints, rate-of-turn and speed limits, a
//! current) and a timeline of scripted events: jamming, a position drag-off spoof, a time
//! spoof, a replay delay, each with its recovery. The generator writes the full bridge
//! sentence set (GGA, RMC, VTG, GSV, GSA, GNS, ZDA, HDT, VBW), checksum-valid and
//! deterministic per seed, to a file or over TCP or UDP, and an instructor log (JSON and
//! text) saying what was injected when, with the true track.
//!
//! **Text only.** Nothing here synthesises RF, IQ or any waveform, and nothing transmits
//! anything but NMEA text to an address the user names. The output is for training and
//! testing and must never be fed to a vessel's live navigation systems; a proprietary
//! marker sentence says so inside the stream.
//!
//! The generator is general: it does not depend on [`crate::receiver_trust`] except that
//! the tests read its output back with that module's NMEA reader.

pub mod cli;
pub mod clock;
pub mod config;
pub mod gen;
pub mod log;
pub mod nmea;
pub mod sky;
pub mod stream;
pub mod track;

pub use config::TrainingScenario;
pub use gen::{generate, Generated};

/// Parse a scenario from TOML text and generate the run: the one call a binding needs.
/// `seed` replaces the scenario's seed when given. The result holds the NMEA text
/// ([`Generated::nmea_text`]) and the instructor log ([`log::InstructorLog::to_json`],
/// [`log::InstructorLog::to_text`]).
pub fn generate_from_toml(toml_text: &str, seed: Option<u64>) -> Result<Generated, String> {
    let mut scn = TrainingScenario::parse(toml_text)?;
    if let Some(s) = seed {
        scn.scenario.seed = s;
    }
    generate(&scn)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn text_entry_point_matches_the_struct_path_and_honours_the_seed() {
        let text = include_str!("../../scenarios/training/open-sea-jamming.toml");
        let a = generate_from_toml(text, None).unwrap();
        let b = generate(&TrainingScenario::parse(text).unwrap()).unwrap();
        assert_eq!(a.nmea_text(), b.nmea_text());
        assert_ne!(
            a.nmea_text(),
            generate_from_toml(text, Some(99)).unwrap().nmea_text()
        );
        assert!(generate_from_toml("[scenario]", None).is_err());
    }
}
