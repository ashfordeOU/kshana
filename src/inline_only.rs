// SPDX-License-Identifier: AGPL-3.0-only
//! The inline-only boundary for surfaces that run scenario text from an untrusted party
//! (the Model Context Protocol (MCP) server): such a surface accepts content inline, and
//! refuses a scenario that names a file or folder for the engine to read.
//!
//! [`FILE_SOURCE_KEYS`] lists the scenario fields that name a file or folder.
//! `tests/scenario_file_sources_guard.rs` fails when a scenario type gains a field that looks
//! like one and is neither listed here nor explained there.

/// Scenario fields that name a file or folder, wherever they appear in a scenario (a campaign
/// nests scenarios).
pub const FILE_SOURCE_KEYS: &[&str] = &[
    "csv_path",
    "data_dir",
    "data_path",
    "earth_orientation_kernel_path",
    "ephemeris_path",
    "meta_path",
    "moon_orientation_kernel_path",
    "normal_points_dir",
    "planetary_kernel_path",
    "reflectors_path",
    "stations_path",
];

/// Fields that name a file only for one scenario kind (elsewhere they carry the body inline).
pub const FILE_SOURCE_KEYS_BY_KIND: &[(&str, &[&str])] = &[(
    "realtime-frame-eop",
    &["eop_finals2000a", "eop_finals2000a_later"],
)];

/// Scenario kinds that read their data from files on the host even when the scenario names none
/// (they fall back to a default data directory). They are refused outright on an inline surface,
/// with a message that names no path and carries no operating-system error text.
pub const FILE_READING_KINDS: &[&str] = &["lunar-llr-datum"];

/// Tables whose `path` key names a receiver log or its navigation file.
const FILE_SOURCE_TABLES: &[&str] = &["log", "nav"];

/// Refuse a scenario that names a file or folder, and one over `max_bytes`. A text that is not
/// valid TOML passes: the engine refuses it with its own message.
pub fn reject_file_sources(toml_text: &str, max_bytes: usize) -> Result<(), String> {
    check(toml_text, max_bytes, true)
}

/// Like [`reject_file_sources`] but without refusing [`FILE_READING_KINDS`]: for a tool that only
/// classifies or describes a scenario and reads nothing (`validate_scenario`).
pub fn reject_file_fields(toml_text: &str, max_bytes: usize) -> Result<(), String> {
    check(toml_text, max_bytes, false)
}

fn check(toml_text: &str, max_bytes: usize, refuse_file_reading_kinds: bool) -> Result<(), String> {
    if toml_text.len() > max_bytes {
        return Err(format!(
            "scenario is {} bytes, over the {max_bytes}-byte limit",
            toml_text.len()
        ));
    }
    let Ok(v) = toml_text.parse::<toml::Table>() else {
        return Ok(());
    };
    fn walk(
        t: &toml::Table,
        kind: &str,
        table_name: &str,
        refuse_kinds: bool,
    ) -> Result<(), String> {
        let kind = t.get("kind").and_then(toml::Value::as_str).unwrap_or(kind);
        if refuse_kinds && FILE_READING_KINDS.contains(&kind) {
            return Err(format!(
                "the scenario kind `{kind}` reads its data from files on the host, so this surface does \
                 not run it; use the `kshana` command line"
            ));
        }
        for (k, v) in t {
            let by_kind = FILE_SOURCE_KEYS_BY_KIND
                .iter()
                .any(|(kd, keys)| *kd == kind && keys.contains(&k.as_str()));
            let in_table = k == "path" && FILE_SOURCE_TABLES.contains(&table_name);
            if FILE_SOURCE_KEYS.contains(&k.as_str()) || by_kind || in_table {
                return Err(format!(
                    "the field `{k}` names a file: this surface accepts inline content only"
                ));
            }
            match v {
                toml::Value::Table(inner) => walk(inner, kind, k, refuse_kinds)?,
                toml::Value::Array(items) => {
                    for item in items {
                        if let toml::Value::Table(inner) = item {
                            walk(inner, kind, k, refuse_kinds)?;
                        }
                    }
                }
                _ => {}
            }
        }
        Ok(())
    }
    walk(&v, "", "", refuse_file_reading_kinds)
}

#[cfg(test)]
mod tests {
    use super::*;

    const MAX: usize = 4 * 1024 * 1024;

    #[test]
    fn scenarios_naming_files_are_refused() {
        let refused = |t: &str| reject_file_sources(t, MAX).unwrap_err();
        assert!(refused("kind = \"telecom-timing\"\ncsv_path = \"x.csv\"").contains("csv_path"));
        assert!(
            refused("kind = \"spectrum\"\n[recording]\nmeta_path = \"a.sigmf-meta\"")
                .contains("meta_path")
        );
        assert!(
            refused("kind = \"realtime-frame-eop\"\neop_finals2000a = \"x\"")
                .contains("eop_finals2000a")
        );
        assert!(
            refused("kind = \"receiver-trust\"\n[log]\nformat = \"nmea\"\npath = \"x\"")
                .contains("path")
        );
        assert!(refused("[log.nav]\npath = \"x\"").contains("path"));
        assert!(refused(
            "kind = \"campaign\"\n[[phases]]\n[phases.scenario]\nplanetary_kernel_path = \"k\""
        )
        .contains("planetary_kernel_path"));
    }

    #[test]
    fn a_kind_that_reads_a_default_data_directory_is_refused_generically() {
        // With no data_dir named, the engine would fall back to a relative default and report the
        // path and the operating-system error. The surface refuses before it gets there.
        let e = reject_file_sources("kind = \"lunar-llr-datum\"\nseed = 1", MAX).unwrap_err();
        assert!(
            e.contains("lunar-llr-datum") && e.contains("command line"),
            "{e}"
        );
        assert!(
            !e.contains("tests/") && !e.contains("fixtures") && !e.contains("No such file"),
            "{e}"
        );
        // classifying reads nothing, so validation may still name the kind
        reject_file_fields("kind = \"lunar-llr-datum\"", MAX).unwrap();
        assert!(reject_file_sources(
            "kind = \"campaign\"\n[[phases]]\n[phases.scenario]\nkind = \"lunar-llr-datum\"",
            MAX
        )
        .is_err());
    }

    #[test]
    fn inline_bodies_result_paths_and_non_toml_pass() {
        reject_file_sources(
            "kind = \"ephemeris\"\neop_finals2000a = \"inline body\"",
            MAX,
        )
        .unwrap();
        reject_file_sources(
            "kind = \"campaign\"\n[[metrics]]\nname = \"a\"\npath = \"quantum.fom.x\"",
            MAX,
        )
        .unwrap();
        reject_file_sources("not toml {{", MAX).unwrap();
        assert!(reject_file_sources("x = 1", 2)
            .unwrap_err()
            .contains("limit"));
    }
}
