// SPDX-License-Identifier: AGPL-3.0-only
//! Scenario-file schema versions.
//!
//! A scenario file may start with `schema_version = N` (a root key, before any table). It names the
//! version of the scenario schema the file was written for, so that a later engine can upgrade it
//! ([`migrate`]) instead of misreading it. The key is optional: a file without it is read as the
//! current version, exactly as before the key existed.
//!
//! [`split`] checks the key and returns the file **without that one line**, byte for byte otherwise,
//! so the scenario hash and every result of a file are the same with or without the key. A version
//! newer than this engine understands is refused with a message naming both versions.
//!
//! See `docs/STABILITY.md` for the deprecation rule and `docs/SCENARIO-VERSIONS.md` for the
//! history of the versions.

use std::borrow::Cow;

/// The scenario schema version this engine writes and reads.
pub const CURRENT: u32 = 1;

/// The root key that carries the version.
pub const KEY: &str = "schema_version";

/// A scenario source with its version line taken out.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Versioned<'a> {
    /// The version the file states, or `None` when it states none.
    pub stated: Option<u32>,
    /// The source without the version line (borrowed unchanged when there was none).
    pub body: Cow<'a, str>,
}

/// Where the version line is: its byte range (including its line ending) and its value.
fn find(src: &str) -> Result<Option<(usize, usize, u32)>, String> {
    let mut pos = 0usize;
    for line in src.split_inclusive('\n') {
        let start = pos;
        pos += line.len();
        let trimmed = line.trim();
        if trimmed.starts_with('[') {
            // Root keys end at the first table header.
            return Ok(None);
        }
        let Some(rest) = trimmed.strip_prefix(KEY) else {
            continue;
        };
        let rest = rest.trim_start();
        let Some(rest) = rest.strip_prefix('=') else {
            continue; // a key that merely starts with the same letters
        };
        let value = rest.split('#').next().unwrap_or("").trim();
        let n: u32 = value.parse().map_err(|_| {
            crate::terr!(
                "e-scenario-version-not-a-number",
                current = CURRENT.to_string(),
                value = value.to_string()
            )
        })?;
        return Ok(Some((start, pos, n)));
    }
    Ok(None)
}

/// Check the version a scenario states and return it without the version line.
///
/// Errors when the stated version is 0 or newer than [`CURRENT`].
pub fn split(src: &str) -> Result<Versioned<'_>, String> {
    match find(src)? {
        None => Ok(Versioned {
            stated: None,
            body: Cow::Borrowed(src),
        }),
        Some((a, b, n)) => {
            if n == 0 {
                return Err(crate::terr!("e-scenario-version-zero"));
            }
            if n > CURRENT {
                return Err(crate::terr!(
                    "e-scenario-version-newer",
                    stated = n.to_string(),
                    current = CURRENT.to_string()
                ));
            }
            let mut body = String::with_capacity(src.len());
            body.push_str(&src[..a]);
            body.push_str(&src[b..]);
            Ok(Versioned {
                stated: Some(n),
                body: Cow::Owned(body),
            })
        }
    }
}

/// The scenario with its version line removed, for the readers that do not know the key.
pub fn strip(src: &str) -> Result<Cow<'_, str>, String> {
    split(src).map(|v| v.body)
}

/// What [`migrate`] did.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Migration {
    /// The version the file stated (`None`: it stated none and was read as current).
    pub from: Option<u32>,
    /// The version the result states.
    pub to: u32,
    /// The upgraded source.
    pub source: String,
    /// Whether anything changed.
    pub changed: bool,
}

/// Upgrade a scenario to [`CURRENT`] and state the version in it.
///
/// Version 1 is the first, so today the only step is adding `schema_version = 1` to a file that
/// states none; later versions add their steps here, oldest first, and each is tested on the
/// files of the version before it.
pub fn migrate(src: &str) -> Result<Migration, String> {
    let v = split(src)?;
    let from = v.stated;
    if from == Some(CURRENT) {
        return Ok(Migration {
            from,
            to: CURRENT,
            source: src.to_string(),
            changed: false,
        });
    }
    // Insert the key after any leading comment and blank lines, so a file's header stays first.
    let body = v.body.as_ref();
    let mut at = 0usize;
    for line in body.split_inclusive('\n') {
        let t = line.trim();
        if t.is_empty() || t.starts_with('#') {
            at += line.len();
        } else {
            break;
        }
    }
    let mut out = String::with_capacity(body.len() + 24);
    out.push_str(&body[..at]);
    if at > 0 && !body[..at].ends_with('\n') {
        out.push('\n');
    }
    out.push_str(&format!("{KEY} = {CURRENT}\n"));
    out.push_str(&body[at..]);
    Ok(Migration {
        from,
        to: CURRENT,
        source: out,
        changed: true,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    const PLAIN: &str = "# header\nkind = \"holdover\"\nseed = 1\n[time]\nschema_version = 9\n";

    #[test]
    fn no_key_is_borrowed_unchanged() {
        let v = split(PLAIN).unwrap();
        assert_eq!(v.stated, None);
        assert!(matches!(v.body, Cow::Borrowed(_)));
        assert_eq!(v.body, PLAIN);
    }

    #[test]
    fn key_inside_a_table_is_not_the_version() {
        // `schema_version = 9` under [time] belongs to that table, not the file.
        assert_eq!(split(PLAIN).unwrap().stated, None);
    }

    #[test]
    fn stated_current_is_stripped_to_the_plain_file() {
        let with = "# header\nschema_version = 1   # the scenario schema\nkind = \"holdover\"\nseed = 1\n[time]\nschema_version = 9\n";
        let v = split(with).unwrap();
        assert_eq!(v.stated, Some(1));
        assert_eq!(v.body, PLAIN);
    }

    #[test]
    fn newer_and_zero_and_garbage_are_refused() {
        let e = split("schema_version = 2\nkind = \"x\"\n").unwrap_err();
        assert!(
            e.contains("version 2") && e.contains(&CURRENT.to_string()),
            "{e}"
        );
        assert!(split("schema_version = 0\n")
            .unwrap_err()
            .contains("first is 1"));
        assert!(split("schema_version = \"one\"\n")
            .unwrap_err()
            .contains("whole number"));
    }

    #[test]
    fn similar_key_names_are_left_alone() {
        let src = "schema_versioning = true\nkind = \"x\"\n";
        assert_eq!(split(src).unwrap().stated, None);
    }

    #[test]
    fn migrate_adds_the_key_after_the_header_and_round_trips() {
        let m = migrate(PLAIN).unwrap();
        assert!(m.changed);
        assert_eq!(m.from, None);
        assert_eq!(m.to, CURRENT);
        assert!(
            m.source.starts_with("# header\nschema_version = 1\nkind"),
            "{}",
            m.source
        );
        // Stripping the migrated file gives back the original byte for byte.
        assert_eq!(split(&m.source).unwrap().body, PLAIN);
        // Migrating again changes nothing.
        let again = migrate(&m.source).unwrap();
        assert!(!again.changed);
        assert_eq!(again.source, m.source);
    }

    #[test]
    fn migrate_a_file_without_a_trailing_newline_or_header() {
        let m = migrate("kind = \"x\"").unwrap();
        assert_eq!(m.source, "schema_version = 1\nkind = \"x\"");
    }
}
