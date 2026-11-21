// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle test for the lunar interoperability export, scoped to interchange conformance:
//! Kshana's lunar CCSDS OEM files read by two independent readers.
//!
//! ## Oracles (kind: Library)
//!
//! 1. `oem` 0.4.5 (MIT, <https://pypi.org/project/oem/>);
//! 2. Orekit 12.2 (Apache-2.0, <https://www.orekit.org>) `OemParser` with its default,
//!    strict settings, through the committed driver
//!    `tests/fixtures/lunar_interop_oem_oracle/OrekitOemReader.java`.
//!
//! Both read the Kshana-written files committed under
//! `tests/fixtures/lunar_interoperability_export/`; their output is
//! `tests/fixtures/lunar_interop_oem_oracle/two_reader_output.txt`, written by
//! `generate_lunar_interop_oem_oracle.py`.
//!
//! ## Tolerances (fixed before the first comparison)
//!
//! In EACH reader: header and metadata tokens exact; number of states equal; epochs to
//! 1 microsecond; positions within 5e-7 km and velocities within 5e-10 km/s (half the last
//! written digit) of Kshana's in-memory state. A reader that refuses a file fails.
//!
//! ## Result (recorded, not tuned)
//!
//! Before Kshana wrote SANA-registered names (21 November 2026), the files carried
//! `TIME_SYSTEM` `LTC` and `TCL`: `oem` 0.4.5 decoded them with a warning, and Orekit 12.2
//! refused both ("use of time system LTC (TCL) in CCSDS files requires an additional ICD and
//! is not implemented in Orekit", finding M047).
//!
//! With the default export (`TDB`, `REF_FRAME` `MOON_ME` and `MOON_PA440`) both readers
//! decode both files within the tolerances above, so the pre-registered comparison passes on
//! them. The explicit opt-in file with `LTC` is still decoded by `oem` (with a warning) and
//! still refused by Orekit; the recorded test pins that too. The comparison is of the
//! interchange format only (tokens, epochs and numbers), not of the frame or time semantics.
//!
//! The Orekit driver measures epoch offsets in the file's own `TIME_SYSTEM` (they are labels in
//! that scale). Measured in TAI, as the driver did before any file had a time system Orekit
//! accepts, the TDB offsets fall short by the TDB rate at the epoch, about 0.34 ns per second
//! (4.8 µs after 4 h): a property of the time scales, not of the files.

use kshana::lunar_interop::{export_lunar_oem, in_frame, EphemState, LunarFrameId, LunarTimeId};
use kshana::lunar_service::LunarConstellation;

const OUT: &str = include_str!("fixtures/lunar_interop_oem_oracle/two_reader_output.txt");
const OEM_ME_TDB: &str =
    include_str!("fixtures/lunar_interoperability_export/kshana_lunar_moon_me_tdb.oem");
const OEM_PA440_TDB: &str =
    include_str!("fixtures/lunar_interoperability_export/kshana_lunar_moon_pa440_tdb.oem");
const OEM_ME_LTC_OPTIN: &str =
    include_str!("fixtures/lunar_interoperability_export/kshana_lunar_moon_me_ltc_optin.oem");

const POS_TOL_KM: f64 = 5e-7;
const VEL_TOL_KM_S: f64 = 5e-10;

/// The same state grids the export fixtures were written from (see
/// `tests/lunar_interoperability_export_reference.rs`): inertial, rotated into the frame.
fn grid(sat_index: usize, n: usize, step_s: f64, frame: LunarFrameId) -> Vec<EphemState> {
    in_frame(&inertial_grid(sat_index, n, step_s), frame)
}

fn inertial_grid(sat_index: usize, n: usize, step_s: f64) -> Vec<EphemState> {
    let sat = LunarConstellation::illustrative_lcns(4).sats[sat_index];
    (0..n)
        .map(|i| {
            let t = i as f64 * step_s;
            let p = sat.position_mci(t);
            let pp = sat.position_mci(t + 1.0);
            let pm = sat.position_mci(t - 1.0);
            EphemState {
                t_s: t,
                pos_m: p,
                vel_m_s: [
                    (pp[0] - pm[0]) / 2.0,
                    (pp[1] - pm[1]) / 2.0,
                    (pp[2] - pm[2]) / 2.0,
                ],
            }
        })
        .collect()
}

struct Case {
    file: &'static str,
    object: &'static str,
    frame: LunarFrameId,
    time: LunarTimeId,
    frame_tok: &'static str,
    time_tok: &'static str,
    states: Vec<EphemState>,
    committed: &'static str,
}

fn cases() -> Vec<Case> {
    let me = LunarFrameId::MoonMe;
    let pa = LunarFrameId::MoonPa;
    vec![
        Case {
            file: "kshana_lunar_moon_me_tdb.oem",
            object: "LCNS-ILLUSTRATIVE-1",
            frame: me,
            time: LunarTimeId::Tdb,
            frame_tok: "MOON_ME",
            time_tok: "TDB",
            states: grid(0, 9, 1800.0, me),
            committed: OEM_ME_TDB,
        },
        Case {
            file: "kshana_lunar_moon_pa440_tdb.oem",
            object: "LCNS-ILLUSTRATIVE-3",
            frame: pa,
            time: LunarTimeId::Tdb,
            frame_tok: "MOON_PA440",
            time_tok: "TDB",
            states: grid(2, 9, 1200.0, pa),
            committed: OEM_PA440_TDB,
        },
        Case {
            file: "kshana_lunar_moon_me_ltc_optin.oem",
            object: "LCNS-ILLUSTRATIVE-1",
            frame: me,
            time: LunarTimeId::Ltc,
            frame_tok: "MOON_ME",
            time_tok: "LTC",
            states: grid(0, 9, 1800.0, me),
            committed: OEM_ME_LTC_OPTIN,
        },
    ]
}

/// The lines one reader printed.
fn reader_lines(reader: &str) -> Vec<&'static str> {
    let start = format!("[reader {reader}]");
    OUT.lines()
        .skip_while(|l| *l != start)
        .skip(1)
        .take_while(|l| !l.starts_with("[reader "))
        .collect()
}

/// Compare one reader's decode of one file against Kshana's state; `Err` names the first
/// failure (including a refusal).
fn check_reader(reader: &str, c: &Case) -> Result<(), String> {
    let lines = reader_lines(reader);
    let status = lines
        .iter()
        .find(|l| l.starts_with(&format!("FILE {} ", c.file)))
        .ok_or_else(|| format!("{reader}: no status line for {}", c.file))?;
    if !status.ends_with("DECODED") {
        return Err(format!("{reader}: {status}"));
    }
    let meta = lines
        .iter()
        .find(|l| l.starts_with(&format!("META {} ", c.file)))
        .ok_or_else(|| format!("{reader}: no META for {}", c.file))?;
    let m: Vec<&str> = meta.split(" | ").map(str::trim).collect();
    let want = [c.object, c.object, "MOON", c.frame_tok, c.time_tok];
    for (k, w) in want.iter().enumerate() {
        if m[k + 1] != *w {
            return Err(format!("{reader}: token {k} is {} not {w}", m[k + 1]));
        }
    }
    let states: Vec<Vec<f64>> = lines
        .iter()
        .filter(|l| l.starts_with(&format!("STATE {} ", c.file)))
        .map(|l| {
            l.split_whitespace()
                .skip(2)
                .map(|x| x.trim_start_matches("t+").parse::<f64>().unwrap())
                .collect()
        })
        .collect();
    if states.len() != c.states.len() {
        return Err(format!(
            "{reader}: {} states, wrote {}",
            states.len(),
            c.states.len()
        ));
    }
    for (got, s) in states.iter().zip(&c.states) {
        if (got[0] - s.t_s).abs() > 1e-6 {
            return Err(format!("{reader}: epoch offset {} vs {}", got[0], s.t_s));
        }
        for k in 0..3 {
            if (got[1 + k] - s.pos_m[k] / 1e3).abs() > POS_TOL_KM {
                return Err(format!("{reader}: position {k} off at t+{}", s.t_s));
            }
            if (got[4 + k] - s.vel_m_s[k] / 1e3).abs() > VEL_TOL_KM_S {
                return Err(format!("{reader}: velocity {k} off at t+{}", s.t_s));
            }
        }
    }
    Ok(())
}

/// The recorded outcome is about the bytes Kshana exports today: the export is unchanged,
/// `oem` 0.4.5 decodes every file within the pre-registered tolerances, Orekit 12.2 decodes
/// the default (`TDB`) files and refuses the opt-in `LTC` file on its time-system token.
#[test]
fn recorded_two_reader_outcome_is_for_todays_export() {
    for c in cases() {
        let oem = export_lunar_oem(c.object, c.frame, c.time, &c.states);
        assert_eq!(
            oem, c.committed,
            "{}: the export changed; rerun the generator",
            c.file
        );
        check_reader("oem", &c).unwrap();
        if c.time.sana_registered() {
            check_reader("orekit", &c).unwrap();
        } else {
            let err = check_reader("orekit", &c).unwrap_err();
            assert!(
                err.contains("REFUSED") && err.contains(&format!("time system {}", c.time_tok)),
                "{}: the recorded Orekit outcome changed ({err}); re-examine row M047",
                c.file
            );
        }
    }
}

/// The pre-registered comparison, on the default export (SANA-registered names): both
/// readers decode both files within the tolerances. The opt-in `LTC` file is left out: Orekit
/// 12.2 refuses that token (finding M047).
#[test]
fn lunar_oem_decodes_identically_in_two_independent_readers() {
    for c in cases().iter().filter(|c| c.time.sana_registered()) {
        for reader in ["oem", "orekit"] {
            check_reader(reader, c).unwrap();
        }
    }
}
