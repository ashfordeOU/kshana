// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate kshana's lunar CCSDS OEM **export** against an independent
//! third-party authority: **oem 0.4.5** (Brad Sease <bradsease@gmail.com>, MIT),
//! the astropy-backed `OrbitEphemerisMessage` parser
//! (https://pypi.org/project/oem/).
//!
//! `oem` is a completely separate codebase from kshana's `src/oem.rs`: it has its
//! own KVN tokenizer, its own CCSDS 502.0-B mandatory-keyword enforcement and its
//! own astropy epoch parsing. So feeding it kshana's emitted lunar OEM and reading
//! the tokens / states back is a genuine external round-trip of the wire format —
//! the same library-vs-library pattern as `lambert_reference.rs` (lamberthub) and
//! `klobuchar_reference.rs` (published vectors), except here the oracle parses
//! *kshana's output* rather than re-deriving a number.
//!
//! What this validates (the quantity compared):
//!   - the exact CCSDS header tokens kshana emits (REF_FRAME / TIME_SYSTEM /
//!     CENTER_NAME / OBJECT_NAME / OBJECT_ID), as the independent parser reads them;
//!   - every per-epoch state — position (km) and velocity (km/s) — as the
//!     independent parser decodes the data lines, to OEM print precision;
//!   - a NEGATIVE CONTROL per combo: a corrupted export with TIME_SYSTEM dropped is
//!     rejected by the independent parser (it is enforcing the mandatory keyword,
//!     not rubber-stamping), and kshana's own `oem_conformance` independently flags
//!     the same corruption.
//!
//! Two frame x time-system combos x 9 epochs = 18 states + 2 negative controls:
//!   - MOON_ME / LTC  (mean-Earth frame, Lunar Coordinate Time)
//!   - MOON_PA / TCL  (principal-axis frame, barycentric-style lunar time)
//!
//! HONEST SCOPE: this is an OEM **interchange** round-trip. It proves that what
//! kshana writes, an independent CCSDS OEM parser reads back identically, and that
//! a malformed export is rejected. It does NOT validate the lunar frame/time
//! *semantics* (whether MOON_ME is realised to WGCCRE, whether LTC's rate is
//! right) — those are covered by the dedicated lunar-frame / lunar-time references.
//! The lunar tokens are non-standard CCSDS extensions; the oem library carries
//! them through verbatim, which is precisely the interoperability property tested.
//!
//! The committed fixtures (`kshana_lunar_*.oem`, the frozen kshana output that the
//! oracle parsed; `lunar_interoperability_export_reference.txt`, the oracle's
//! decoded values) and the generator
//! (`generate_lunar_interoperability_export_reference.py`) live in
//! `tests/fixtures/lunar_interoperability_export/`.

use kshana::lunar_interop::{
    export_lunar_oem, oem_conformance, EphemState, LunarFrameId, LunarTimeId,
};
use kshana::lunar_service::LunarConstellation;

const REF: &str = include_str!(
    "fixtures/lunar_interoperability_export/lunar_interoperability_export_reference.txt"
);
const OEM_ME_LTC: &str =
    include_str!("fixtures/lunar_interoperability_export/kshana_lunar_moon_me_ltc.oem");
const OEM_PA_TCL: &str =
    include_str!("fixtures/lunar_interoperability_export/kshana_lunar_moon_pa_tcl.oem");

// OEM data lines are printed at 6 dp (km position) and 9 dp (km/s velocity); the
// independent parser decodes the same digits, so agreement is to print precision:
// half a ULP of the last printed digit plus a tiny float-parse floor.
const POS_TOL_KM: f64 = 1e-6; // 1 mm
const VEL_TOL_KM_S: f64 = 1e-9; // 1 µm/s

/// Re-build the exact deterministic >=9-state grid for satellite `sat_index` of the
/// illustrative LCNS-class constellation (the same recipe kshana uses internally in
/// `lunar_interop::sample_lunar_states`): analytic MCI position + central-difference
/// velocity, pinned here to explicit inputs.
fn grid(sat_index: usize, n: usize, step_s: f64) -> Vec<EphemState> {
    let cons = LunarConstellation::illustrative_lcns(4);
    let sat = cons.sats[sat_index];
    let dt = 1.0_f64;
    (0..n)
        .map(|i| {
            let t = i as f64 * step_s;
            let pos = sat.position_mci(t);
            let p_plus = sat.position_mci(t + dt);
            let p_minus = sat.position_mci(t - dt);
            let vel = [
                (p_plus[0] - p_minus[0]) / (2.0 * dt),
                (p_plus[1] - p_minus[1]) / (2.0 * dt),
                (p_plus[2] - p_minus[2]) / (2.0 * dt),
            ];
            EphemState {
                t_s: t,
                pos_m: pos,
                vel_m_s: vel,
            }
        })
        .collect()
}

fn csv3(s: &str) -> [f64; 3] {
    let v: Vec<f64> = s
        .trim()
        .split(',')
        .map(|x| x.trim().parse().unwrap())
        .collect();
    assert_eq!(v.len(), 3, "expected 3 components in '{s}'");
    [v[0], v[1], v[2]]
}

/// The two combos under test, each producing one committed kshana OEM fixture.
struct Combo {
    label: &'static str,
    object: &'static str,
    frame: LunarFrameId,
    time: LunarTimeId,
    sat_index: usize,
    n: usize,
    step_s: f64,
    fixture: &'static str,
    ref_frame_tok: &'static str,
    time_system_tok: &'static str,
}

fn combos() -> Vec<Combo> {
    vec![
        Combo {
            label: "MOON_ME_LTC",
            object: "LCNS-ILLUSTRATIVE-1",
            frame: LunarFrameId::MoonMe,
            time: LunarTimeId::Ltc,
            sat_index: 0,
            n: 9,
            step_s: 30.0 * 60.0,
            fixture: OEM_ME_LTC,
            ref_frame_tok: "MOON_ME",
            time_system_tok: "LTC",
        },
        Combo {
            label: "MOON_PA_TCL",
            object: "LCNS-ILLUSTRATIVE-3",
            frame: LunarFrameId::MoonPa,
            time: LunarTimeId::Tcl,
            sat_index: 2,
            n: 9,
            step_s: 20.0 * 60.0,
            fixture: OEM_PA_TCL,
            ref_frame_tok: "MOON_PA",
            time_system_tok: "TCL",
        },
    ]
}

/// The committed `.oem` fixtures must be byte-identical to what kshana emits *now*
/// from the identical grid — this binds the pinned oracle output (generated by
/// parsing exactly these bytes) to kshana's current behaviour. If kshana's emitter
/// changes, this fails and the fixtures+oracle must be regenerated.
#[test]
fn committed_oem_fixtures_match_current_kshana_export() {
    for c in combos() {
        let states = grid(c.sat_index, c.n, c.step_s);
        let oem = export_lunar_oem(c.object, c.frame, c.time, &states);
        assert_eq!(
            oem, c.fixture,
            "{}: kshana export differs from committed .oem fixture — \
             regenerate the fixture + oracle reference",
            c.label
        );
    }
}

/// The independent oem library's decoded tokens + states must match kshana's
/// emitted values: tokens exact, position to <=1e-6 km, velocity to <=1e-9 km/s.
#[test]
fn oem_oracle_roundtrips_tokens_and_states() {
    let cs = combos();
    let mut n_states = 0usize;
    let mut worst_pos = 0.0f64;
    let mut worst_vel = 0.0f64;

    for c in &cs {
        // The kshana-side truth: the same states kshana wrote into the OEM, in km
        // / km/s (the emitter divides metres by 1000).
        let states = grid(c.sat_index, c.n, c.step_s);
        let truth_km: Vec<([f64; 3], [f64; 3])> = states
            .iter()
            .map(|s| {
                (
                    [
                        s.pos_m[0] / 1000.0,
                        s.pos_m[1] / 1000.0,
                        s.pos_m[2] / 1000.0,
                    ],
                    [
                        s.vel_m_s[0] / 1000.0,
                        s.vel_m_s[1] / 1000.0,
                        s.vel_m_s[2] / 1000.0,
                    ],
                )
            })
            .collect();

        // --- tokens, from the oracle's TOKENS line for this combo ---
        let tok_line = REF
            .lines()
            .find(|l| l.starts_with(&format!("TOKENS {} ", c.label)))
            .unwrap_or_else(|| panic!("{}: no TOKENS line in reference", c.label));
        let parts: Vec<&str> = tok_line.splitn(6, '|').collect();
        assert_eq!(
            parts.len(),
            6,
            "{}: TOKENS needs 6 fields: {tok_line}",
            c.label
        );
        let ref_frame = parts[1].trim();
        let time_system = parts[2].trim();
        let center_name = parts[3].trim();
        let object_name = parts[4].trim();
        let object_id = parts[5].trim();
        assert_eq!(
            ref_frame, c.ref_frame_tok,
            "{}: oracle read REF_FRAME {ref_frame:?}, kshana emitted {:?}",
            c.label, c.ref_frame_tok
        );
        assert_eq!(
            time_system, c.time_system_tok,
            "{}: oracle read TIME_SYSTEM {time_system:?}, kshana emitted {:?}",
            c.label, c.time_system_tok
        );
        assert_eq!(center_name, "MOON", "{}: CENTER_NAME", c.label);
        assert_eq!(object_name, c.object, "{}: OBJECT_NAME", c.label);
        assert_eq!(object_id, c.object, "{}: OBJECT_ID", c.label);

        // --- per-state position / velocity, from the oracle's STATE lines ---
        let mut seen = 0usize;
        for line in REF.lines() {
            let head = format!("STATE {} | ", c.label);
            if !line.starts_with(&head) {
                continue;
            }
            // STATE <combo> | <idx> | px,py,pz | vx,vy,vz
            let parts: Vec<&str> = line.splitn(4, '|').collect();
            assert_eq!(parts.len(), 4, "{}: STATE needs 4 fields: {line}", c.label);
            let idx: usize = parts[1].trim().parse().unwrap();
            let pos = csv3(parts[2]);
            let vel = csv3(parts[3]);
            let (tp, tv) = truth_km[idx];
            for k in 0..3 {
                let dp = (pos[k] - tp[k]).abs();
                let dv = (vel[k] - tv[k]).abs();
                worst_pos = worst_pos.max(dp);
                worst_vel = worst_vel.max(dv);
                assert!(
                    dp <= POS_TOL_KM,
                    "{} state {idx} pos[{k}]: oracle {:.9} km vs kshana {:.9} km (|Δ|={dp:.2e} > {POS_TOL_KM:.0e})",
                    c.label, pos[k], tp[k]
                );
                assert!(
                    dv <= VEL_TOL_KM_S,
                    "{} state {idx} vel[{k}]: oracle {:.12} km/s vs kshana {:.12} km/s (|Δ|={dv:.2e} > {VEL_TOL_KM_S:.0e})",
                    c.label, vel[k], tv[k]
                );
            }
            seen += 1;
        }
        assert_eq!(
            seen, c.n,
            "{}: expected {} STATE lines, saw {seen}",
            c.label, c.n
        );
        n_states += seen;
    }

    assert!(
        n_states >= 18,
        "expected >=18 oracle-checked states, got {n_states}"
    );
    eprintln!(
        "lunar_interoperability_export: {n_states} states vs oem 0.4.5 across {} combos; \
         worst |Δpos| = {worst_pos:.2e} km, worst |Δvel| = {worst_vel:.2e} km/s",
        cs.len()
    );
}

/// The negative control: the independent oem parser rejected the corrupted
/// (TIME_SYSTEM-dropped) export for every combo, AND kshana's own conformance check
/// independently flags the same corruption. Both must agree it is invalid.
#[test]
fn negative_control_dropped_time_system_is_rejected() {
    let mut checked = 0usize;
    for c in combos() {
        // The oracle's recorded verdict on the corrupted export.
        let neg = REF
            .lines()
            .find(|l| l.starts_with(&format!("NEGCTRL {} ", c.label)))
            .unwrap_or_else(|| panic!("{}: no NEGCTRL line in reference", c.label));
        let parts: Vec<&str> = neg.splitn(3, '|').collect();
        assert!(parts.len() >= 2, "{}: NEGCTRL malformed: {neg}", c.label);
        assert_eq!(
            parts[1].trim(),
            "REJECTED",
            "{}: independent oem parser did NOT reject dropped TIME_SYSTEM: {neg}",
            c.label
        );

        // Independently: kshana's own field-conformance must also fail on the same
        // corruption (drop every TIME_SYSTEM line from the good export).
        let states = grid(c.sat_index, c.n, c.step_s);
        let good = export_lunar_oem(c.object, c.frame, c.time, &states);
        assert!(
            oem_conformance(&good).pass,
            "{}: well-formed export should pass kshana conformance",
            c.label
        );
        let broken: String = good
            .lines()
            .filter(|l| !l.trim_start().starts_with("TIME_SYSTEM"))
            .collect::<Vec<_>>()
            .join("\n");
        let conf = oem_conformance(&broken);
        assert!(
            !conf.pass,
            "{}: kshana conformance should fail on dropped TIME_SYSTEM",
            c.label
        );
        assert!(
            conf.missing_fields.iter().any(|f| f == "TIME_SYSTEM"),
            "{}: kshana should report TIME_SYSTEM missing: {conf:?}",
            c.label
        );
        checked += 1;
    }
    assert!(
        checked >= 2,
        "expected >=2 negative controls, got {checked}"
    );
    eprintln!("lunar_interoperability_export: {checked} negative controls rejected by both oem 0.4.5 and kshana conformance");
}
