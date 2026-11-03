// SPDX-License-Identifier: AGPL-3.0-only
//! The resource governor: a memory cap per job (roadmap L10b).
//!
//! `KSHANA_MAX_MEMORY` caps the memory one command may plan to hold: a whole number of bytes, or
//! one with a binary suffix, `K`, `M`, `G` or `T` (`2G` is 2 GiB; `B` and `iB` are accepted after
//! the suffix, any case). Unset means no cap. The CPU side is `KSHANA_THREADS` ([`crate::par`]).
//!
//! Streaming paths (an IQ recording read in chunks, `--epochs`, `--summary`, `--csv`) hold a fixed
//! amount whatever the length of the input and are never refused. A command that must hold a
//! whole document in memory (the `--json` of `iq track`) estimates its size from the input before
//! it starts and, when that is over the cap, stops with a message naming the streaming output to
//! use instead, rather than running for an hour and then exhausting the machine.

/// The environment variable that sets the cap.
pub const ENV: &str = "KSHANA_MAX_MEMORY";

/// Parse a memory size: bytes, or a number with a binary `K`/`M`/`G`/`T` suffix.
pub fn parse_size(text: &str) -> Option<u64> {
    let t = text.trim();
    let lower = t.to_ascii_lowercase();
    let body = lower
        .strip_suffix("ib")
        .or_else(|| lower.strip_suffix('b'))
        .unwrap_or(&lower);
    let (num, shift) = match body.chars().last()? {
        'k' => (&body[..body.len() - 1], 10),
        'm' => (&body[..body.len() - 1], 20),
        'g' => (&body[..body.len() - 1], 30),
        't' => (&body[..body.len() - 1], 40),
        _ => (body, 0),
    };
    let n: u64 = num.trim().parse().ok()?;
    n.checked_mul(1u64 << shift).filter(|&b| b > 0)
}

/// The cap from `KSHANA_MAX_MEMORY`, if it is set.
pub fn max_memory() -> Result<Option<u64>, String> {
    match std::env::var(ENV) {
        Err(_) => Ok(None),
        Ok(v) if v.trim().is_empty() => Ok(None),
        Ok(v) => parse_size(&v)
            .map(Some)
            .ok_or_else(|| crate::terr!("e-governor-bad-max-memory", value = v)),
    }
}

/// Whole mebibytes, rounded up, for messages.
fn mib(bytes: u64) -> String {
    bytes.div_ceil(1 << 20).to_string()
}

/// Refuse a job that plans to hold `estimate` bytes when that is over the cap. `output` names
/// what would be held (an option such as `--json`) and `instead` the streaming alternative.
pub fn check(estimate: u64, output: &str, instead: &str) -> Result<(), String> {
    match max_memory()? {
        Some(cap) if estimate > cap => Err(crate::terr!(
            "e-governor-over-cap",
            output = output,
            need = mib(estimate),
            cap = mib(cap),
            instead = instead
        )),
        _ => Ok(()),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn sizes() {
        assert_eq!(parse_size("1024"), Some(1024));
        assert_eq!(parse_size("2G"), Some(2 << 30));
        assert_eq!(parse_size("2GiB"), Some(2 << 30));
        assert_eq!(parse_size(" 512mb "), Some(512 << 20));
        assert_eq!(parse_size("64k"), Some(64 << 10));
        assert_eq!(parse_size("1T"), Some(1 << 40));
        for bad in ["", "G", "two", "-1G", "0", "1.5G", "99999999999T"] {
            assert_eq!(parse_size(bad), None, "{bad}");
        }
    }

    #[test]
    fn mebibytes_round_up() {
        assert_eq!(mib(1), "1");
        assert_eq!(mib(1 << 20), "1");
        assert_eq!(mib((1 << 20) + 1), "2");
    }
}
