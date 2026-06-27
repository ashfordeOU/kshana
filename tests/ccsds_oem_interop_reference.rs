// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate kshana's general (Earth / EME2000) CCSDS OEM **export** and
//! **import** against an independent third-party authority: the **oem** library
//! (Brad Sease <bradsease@gmail.com>, MIT), the astropy-backed CCSDS 502.0-B
//! `OrbitEphemerisMessage` parser (https://pypi.org/project/oem/).
//!
//! `oem` is a completely separate codebase from kshana's `src/oem.rs`: its own KVN
//! tokenizer, its own CCSDS 502.0-B mandatory-keyword + frame/time enforcement, its
//! own astropy epoch parsing. Feeding it kshana's emitted EME2000 OEM and reading
//! the tokens + Cartesian states back is therefore a genuine external round-trip of
//! the wire format — the same library-vs-library pattern as
//! `lunar_interoperability_export_reference.rs`, here for the non-lunar path.
//!
//! What this validates (the quantity compared):
//!   - the exact CCSDS header tokens kshana emits (REF_FRAME / TIME_SYSTEM /
//!     CENTER_NAME / OBJECT_NAME / OBJECT_ID), as the independent parser reads them;
//!   - every per-epoch Cartesian state — position (km) and velocity (km/s) — as the
//!     independent parser decodes the data lines, to OEM print precision;
//!   - an IMPORT-direction cross-check: kshana's own `parse_oem` and the oem library
//!     decode the SAME states from the vendored external_leo.oem.
//!
//! Two committed kshana fixtures (frozen `to_oem_string` output), 24 states total:
//!   - `kshana_leo_eme2000.oem`          — single segment, 12 epochs (one LEO object);
//!   - `kshana_meo_eme2000_multiseg.oem` — two contiguous arcs (segments) of ONE MEO
//!     object, 6 + 6 epochs.
//!
//! Because CI must not run Python, the fixtures are committed: the frozen kshana OEM
//! the oracle parsed (`kshana_*.oem`) and the oracle's decoded values
//! (`ccsds_oem_interop_reference.txt`), plus the generator
//! (`generate_ccsds_oem_interop_reference.py`), all under
//! `tests/fixtures/ccsds_oem_interop/`.
//!
//! HONEST SCOPE: this is an OEM **interchange** round-trip. It proves that what
//! kshana writes, an independent CCSDS-502 parser reads back identically, and that
//! the two parsers agree on an external file's states. It does NOT validate the
//! EME2000 frame *realisation* (kshana propagates in TEME; here only the token
//! `EME2000` and the numeric carry-through are checked, not the rotation between
//! them) nor the orbit physics — those are separate references.
//!
//! Two interop FINDINGS surfaced while building this (documented in the generator):
//!   1. The oem library enforces a single OBJECT_NAME across all segments (CCSDS
//!      502.0: segments are contiguous arcs of ONE object). kshana's
//!      `OemFile::from_propagators` writes one segment per *satellite* (distinct
//!      OBJECT_NAMEs), which the oem library REJECTS — so the multi-segment fixture
//!      here is two arcs of one object.
//!   2. The oem library REJECTS the vendored external_leo.oem AS-IS (its COVARIANCE
//!      block packs several lower-triangular matrix entries per line); kshana's
//!      `parse_oem` skips the whole block and ingests it. The cross-check below
//!      therefore compares the states only (covariance is non-state data).

use kshana::oem::{parse_oem, OemFile, OemMetadata, OemSegment, OemStateLine};
use kshana::orbit::{Orbit, Propagator};
use kshana::rinex::EpochUtc;

const REF: &str =
    include_str!("fixtures/ccsds_oem_interop/ccsds_oem_interop_reference.txt");
const OEM_LEO: &str = include_str!("fixtures/ccsds_oem_interop/kshana_leo_eme2000.oem");
const OEM_MEO: &str =
    include_str!("fixtures/ccsds_oem_interop/kshana_meo_eme2000_multiseg.oem");
const EXTERNAL_LEO: &str = include_str!("fixtures/interop/external_leo.oem");

// OEM data lines are printed at 6 dp (km position) and 9 dp (km/s velocity); the
// independent parser decodes the same digits, so agreement is to print precision.
const POS_TOL_KM: f64 = 1e-6; // 1 mm
const VEL_TOL_KM_S: f64 = 1e-9; // 1 µm/s

fn epoch(y: i32, mo: u32, d: u32, h: u32, mi: u32, s: f64) -> EpochUtc {
    EpochUtc {
        year: y,
        month: mo,
        day: d,
        hour: h,
        minute: mi,
        second: s,
    }
}

/// Rebuild one EME2000/UTC segment of `n` epochs from a kshana propagator, exactly
/// as the fixture generator (`examples/gen_ccsds_oem_interop_fixtures.rs`) did:
/// real `state_eci` states, whole-second epoch stamps, standard CCSDS tokens.
fn segment(
    object: &str,
    prop: &Propagator,
    t0: &EpochUtc,
    base_offset_s: f64,
    sample_offset_s: f64,
    step_s: f64,
    n: usize,
) -> OemSegment {
    let base_sod = t0.hour as f64 * 3600.0 + t0.minute as f64 * 60.0 + t0.second;
    let stamp = |i: usize| -> EpochUtc {
        let total = base_sod + base_offset_s + i as f64 * step_s;
        let mut sod = total;
        let hour = (sod / 3600.0).floor();
        sod -= hour * 3600.0;
        let minute = (sod / 60.0).floor();
        sod -= minute * 60.0;
        EpochUtc {
            year: t0.year,
            month: t0.month,
            day: t0.day,
            hour: hour as u32,
            minute: minute as u32,
            second: sod,
        }
    };
    let mut states = Vec::with_capacity(n);
    for i in 0..n {
        let t = sample_offset_s + i as f64 * step_s;
        let s = prop.state_eci(t);
        states.push(OemStateLine {
            epoch: stamp(i),
            pos_km: [s.r_m[0] / 1000.0, s.r_m[1] / 1000.0, s.r_m[2] / 1000.0],
            vel_km_s: [
                s.v_m_s[0] / 1000.0,
                s.v_m_s[1] / 1000.0,
                s.v_m_s[2] / 1000.0,
            ],
        });
    }
    let start = states.first().unwrap().epoch.clone();
    let stop = states.last().unwrap().epoch.clone();
    OemSegment {
        meta: OemMetadata {
            object_name: object.to_string(),
            object_id: object.to_string(),
            center_name: "EARTH".to_string(),
            ref_frame: "EME2000".to_string(),
            time_system: "UTC".to_string(),
            start,
            stop,
        },
        states,
    }
}

fn build_leo() -> OemFile {
    let created = epoch(2026, 6, 27, 0, 0, 0.0);
    let t0 = epoch(2024, 1, 1, 0, 0, 0.0);
    let leo = Propagator::Kepler(Orbit::keplerian(6_878_000.0, 0.001, 0.9, 0.3, 0.2, 0.4));
    OemFile {
        version: "2.0".to_string(),
        creation_date: created,
        originator: "KSHANA".to_string(),
        segments: vec![segment("KSHANA-LEO-1", &leo, &t0, 0.0, 0.0, 300.0, 12)],
    }
}

fn build_meo() -> OemFile {
    let created = epoch(2026, 6, 27, 0, 0, 0.0);
    let t0 = epoch(2024, 1, 1, 0, 0, 0.0);
    let meo = Propagator::Kepler(Orbit::keplerian(26_560_000.0, 0.01, 0.96, 0.3, 0.2, 0.4));
    let arc_a = segment("KSHANA-MEO-1", &meo, &t0, 0.0, 0.0, 600.0, 6);
    let arc_b = segment("KSHANA-MEO-1", &meo, &t0, 3600.0, 3600.0, 600.0, 6);
    OemFile {
        version: "2.0".to_string(),
        creation_date: created,
        originator: "KSHANA".to_string(),
        segments: vec![arc_a, arc_b],
    }
}

/// Parse `a,b,c` into three f64s.
fn csv3(s: &str) -> [f64; 3] {
    let v: Vec<f64> = s
        .trim()
        .split(',')
        .map(|x| x.trim().parse().unwrap())
        .collect();
    assert_eq!(v.len(), 3, "expected 3 components in '{s}'");
    [v[0], v[1], v[2]]
}

/// The committed `.oem` fixtures must be byte-identical to what kshana emits *now*
/// from the identical inputs — this binds the pinned oracle output (generated by
/// parsing exactly these bytes) to kshana's current serialiser. If kshana's emitter
/// changes, this fails and the fixtures + oracle reference must be regenerated via
/// `examples/gen_ccsds_oem_interop_fixtures.rs` + the generator script.
#[test]
fn committed_oem_fixtures_match_current_kshana_export() {
    assert_eq!(
        build_leo().to_oem_string(),
        OEM_LEO,
        "LEO: kshana export differs from committed .oem fixture — regenerate fixtures + oracle"
    );
    assert_eq!(
        build_meo().to_oem_string(),
        OEM_MEO,
        "MEO multiseg: kshana export differs from committed .oem fixture — regenerate fixtures + oracle"
    );
}

/// One combo's expected shape in the oracle reference.
struct Combo {
    label: &'static str,
    oem: &'static str,
    object: &'static str,
    seg_states: &'static [usize], // states per segment, in order
}

fn combos() -> Vec<Combo> {
    vec![
        Combo {
            label: "LEO_SINGLE",
            oem: OEM_LEO,
            object: "KSHANA-LEO-1",
            seg_states: &[12],
        },
        Combo {
            label: "MEO_MULTISEG",
            oem: OEM_MEO,
            object: "KSHANA-MEO-1",
            seg_states: &[6, 6],
        },
    ]
}

/// The independent oem library's decoded tokens + Cartesian states must match what
/// kshana's OWN `parse_oem` reads back from the identical committed bytes: tokens
/// exact, position to <=1e-6 km, velocity to <=1e-9 km/s. This proves an INDEPENDENT
/// CCSDS-502 parser interprets kshana's OEM identically to kshana itself.
#[test]
fn oem_oracle_matches_kshana_parse_of_its_own_export() {
    let cs = combos();
    let mut n_states = 0usize;
    let mut worst_pos = 0.0f64;
    let mut worst_vel = 0.0f64;

    for c in &cs {
        // kshana's own parse of the committed bytes (the import side of src/oem.rs).
        let parsed = parse_oem(c.oem).unwrap_or_else(|e| {
            panic!("{}: kshana parse_oem failed on its own export: {e}", c.label)
        });
        assert_eq!(
            parsed.segments.len(),
            c.seg_states.len(),
            "{}: kshana parsed {} segments, expected {}",
            c.label,
            parsed.segments.len(),
            c.seg_states.len()
        );

        for (sidx, seg) in parsed.segments.iter().enumerate() {
            // --- tokens, from the oracle's TOKENS line for this combo+segment ---
            let head = format!("TOKENS {} {} ", c.label, sidx);
            let tok_line = REF
                .lines()
                .find(|l| l.starts_with(&head))
                .unwrap_or_else(|| panic!("{} seg {sidx}: no TOKENS line in reference", c.label));
            let parts: Vec<&str> = tok_line.splitn(6, '|').collect();
            assert_eq!(parts.len(), 6, "{}: TOKENS needs 6 fields: {tok_line}", c.label);
            let ref_frame = parts[1].trim();
            let time_system = parts[2].trim();
            let center_name = parts[3].trim();
            let object_name = parts[4].trim();
            let object_id = parts[5].trim();
            // Oracle tokens vs the tokens kshana's parser read from the same bytes.
            assert_eq!(ref_frame, seg.meta.ref_frame, "{} seg {sidx}: REF_FRAME", c.label);
            assert_eq!(ref_frame, "EME2000", "{} seg {sidx}: REF_FRAME token", c.label);
            assert_eq!(time_system, seg.meta.time_system, "{} seg {sidx}: TIME_SYSTEM", c.label);
            assert_eq!(time_system, "UTC", "{} seg {sidx}: TIME_SYSTEM token", c.label);
            assert_eq!(center_name, seg.meta.center_name, "{} seg {sidx}: CENTER_NAME", c.label);
            assert_eq!(center_name, "EARTH", "{} seg {sidx}: CENTER_NAME token", c.label);
            assert_eq!(object_name, seg.meta.object_name, "{} seg {sidx}: OBJECT_NAME", c.label);
            assert_eq!(object_name, c.object, "{} seg {sidx}: OBJECT_NAME token", c.label);
            assert_eq!(object_id, seg.meta.object_id, "{} seg {sidx}: OBJECT_ID", c.label);

            // --- per-state position / velocity, from the oracle's STATE lines ---
            assert_eq!(
                seg.states.len(),
                c.seg_states[sidx],
                "{} seg {sidx}: state count",
                c.label
            );
            let mut seen = 0usize;
            for line in REF.lines() {
                let shead = format!("STATE {} {} | ", c.label, sidx);
                if !line.starts_with(&shead) {
                    continue;
                }
                // STATE <combo> <seg> | <idx> | px,py,pz | vx,vy,vz
                let parts: Vec<&str> = line.splitn(4, '|').collect();
                assert_eq!(parts.len(), 4, "{}: STATE needs 4 fields: {line}", c.label);
                let idx: usize = parts[1].trim().parse().unwrap();
                let pos = csv3(parts[2]);
                let vel = csv3(parts[3]);
                let st = &seg.states[idx];
                for k in 0..3 {
                    let dp = (pos[k] - st.pos_km[k]).abs();
                    let dv = (vel[k] - st.vel_km_s[k]).abs();
                    worst_pos = worst_pos.max(dp);
                    worst_vel = worst_vel.max(dv);
                    assert!(
                        dp <= POS_TOL_KM,
                        "{} seg {sidx} state {idx} pos[{k}]: oracle {:.9} km vs kshana {:.9} km (|Δ|={dp:.2e} > {POS_TOL_KM:.0e})",
                        c.label, pos[k], st.pos_km[k]
                    );
                    assert!(
                        dv <= VEL_TOL_KM_S,
                        "{} seg {sidx} state {idx} vel[{k}]: oracle {:.12} km/s vs kshana {:.12} km/s (|Δ|={dv:.2e} > {VEL_TOL_KM_S:.0e})",
                        c.label, vel[k], st.vel_km_s[k]
                    );
                }
                seen += 1;
            }
            assert_eq!(
                seen, c.seg_states[sidx],
                "{} seg {sidx}: expected {} STATE lines, saw {seen}",
                c.label, c.seg_states[sidx]
            );
            n_states += seen;
        }
    }

    assert!(
        n_states >= 20,
        "expected >=20 oracle-checked states across >=2 fixtures, got {n_states}"
    );
    assert!(cs.len() >= 2, "expected >=2 fixtures");
    eprintln!(
        "ccsds_oem_interop: {n_states} states vs the independent oem library across {} fixtures; \
         worst |Δpos| = {worst_pos:.2e} km, worst |Δvel| = {worst_vel:.2e} km/s",
        cs.len()
    );
}

/// Import-direction cross-check: kshana's own `parse_oem` of the vendored
/// external_leo.oem must decode the SAME Cartesian states + tokens that the
/// independent oem library decoded (recorded as XTOKENS / XLEO in the reference).
/// The reference also records (XCOV) that the oem library REJECTS the file AS-IS due
/// to its multi-entry covariance lines — a real interop difference; kshana's parser
/// is tolerant of that block, so only the states (the comparable content) are
/// cross-checked here.
#[test]
fn external_oem_import_agrees_with_oracle() {
    // The recorded finding: the oem library rejected the file AS-IS.
    let xcov = REF
        .lines()
        .find(|l| l.starts_with("XCOV "))
        .expect("no XCOV line in reference");
    assert!(
        xcov.contains("REJECTED"),
        "expected the oem library to reject external_leo.oem as-is (covariance format finding): {xcov}"
    );

    // kshana parses the file unchanged (covariance block skipped).
    let f = parse_oem(EXTERNAL_LEO).expect("kshana parse_oem of external_leo.oem");
    assert_eq!(f.segments.len(), 1, "external_leo: one segment");
    let seg = &f.segments[0];

    // Tokens, oracle (covariance-stripped decode) vs kshana.
    let xtok = REF
        .lines()
        .find(|l| l.starts_with("XTOKENS "))
        .expect("no XTOKENS line in reference");
    let parts: Vec<&str> = xtok.splitn(6, '|').collect();
    assert_eq!(parts.len(), 6, "XTOKENS needs 6 fields: {xtok}");
    assert_eq!(parts[1].trim(), seg.meta.ref_frame, "external REF_FRAME");
    assert_eq!(parts[1].trim(), "EME2000", "external REF_FRAME token");
    assert_eq!(parts[2].trim(), seg.meta.time_system, "external TIME_SYSTEM");
    assert_eq!(parts[3].trim(), seg.meta.center_name, "external CENTER_NAME");
    assert_eq!(parts[4].trim(), seg.meta.object_name, "external OBJECT_NAME");
    assert_eq!(parts[5].trim(), seg.meta.object_id, "external OBJECT_ID");

    // Per-state, oracle vs kshana, on the same file.
    let mut seen = 0usize;
    let mut worst_pos = 0.0f64;
    let mut worst_vel = 0.0f64;
    for line in REF.lines() {
        if !line.starts_with("XLEO ") {
            continue;
        }
        // XLEO <idx> | px,py,pz | vx,vy,vz
        let parts: Vec<&str> = line.splitn(3, '|').collect();
        assert_eq!(parts.len(), 3, "XLEO needs 3 fields: {line}");
        let idx: usize = parts[0].trim().trim_start_matches("XLEO").trim().parse().unwrap();
        let pos = csv3(parts[1]);
        let vel = csv3(parts[2]);
        let st = &seg.states[idx];
        for k in 0..3 {
            let dp = (pos[k] - st.pos_km[k]).abs();
            let dv = (vel[k] - st.vel_km_s[k]).abs();
            worst_pos = worst_pos.max(dp);
            worst_vel = worst_vel.max(dv);
            assert!(
                dp <= POS_TOL_KM,
                "external state {idx} pos[{k}]: oracle {:.9} vs kshana {:.9} (|Δ|={dp:.2e})",
                pos[k], st.pos_km[k]
            );
            assert!(
                dv <= VEL_TOL_KM_S,
                "external state {idx} vel[{k}]: oracle {:.12} vs kshana {:.12} (|Δ|={dv:.2e})",
                vel[k], st.vel_km_s[k]
            );
        }
        seen += 1;
    }
    assert_eq!(seen, seg.states.len(), "external: oracle/kshana state count");
    assert_eq!(seen, 4, "external_leo.oem has 4 data lines");
    eprintln!(
        "ccsds_oem_interop import: kshana parse_oem and the oem library agree on all {seen} \
         external_leo.oem states; worst |Δpos| = {worst_pos:.2e} km, worst |Δvel| = {worst_vel:.2e} km/s \
         (oem library rejects the file's covariance format as-is — interop finding)"
    );
}
