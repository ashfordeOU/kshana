// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate kshana's CCSDS 502.0 OEM **covariance-block interchange**
//! against an independent third-party authority: the **oem** library (Brad Sease
//! <bradsease@gmail.com>, MIT, v0.4.5), the astropy-backed CCSDS 502.0-B
//! `OrbitEphemerisMessage` parser (https://pypi.org/project/oem/) — the SAME
//! independent parser already trusted by the Validated "CCSDS OEM interoperability"
//! row.
//!
//! `oem` is a completely separate codebase from kshana's `src/oem.rs`: its own KVN
//! tokenizer (`oem/parsers.py::parse_kvn_oem`), its own covariance-section state
//! machine, and its own lower-triangular → symmetric-6×6 reconstruction
//! (`oem/components/types.py::Covariance._from_raw_data`). Having kshana EMIT a
//! CCSDS covariance block and letting `oem` reconstruct the 6×6 matrix is therefore
//! a genuine external interchange of the covariance wire format.
//!
//! WHAT THIS VALIDATES (the uniquely-defined quantity compared):
//!   kshana's `covariance_block_kvn` serialises a 6×6 position/velocity covariance
//!   as the CCSDS 502.0 UNLABELLED lower-triangular KVN block (bare numbers, one
//!   matrix row per line, 21 entries). Because `oem` parses a covariance ONLY inside
//!   a segment (Section.DATA → COVARIANCE_START…COVARIANCE_STOP), the block is
//!   embedded — as kshana emits it — inside a full valid OEM 2.0 segment (frozen in
//!   `tests/fixtures/ccsds_cov/kshana_cov_leo.oem`). The independent `oem` library
//!   parses that file and RECONSTRUCTS the symmetric 6×6 matrix; the recorded
//!   reconstruction (`p5_ccsds_cov_reference.txt`) must equal kshana's INPUT
//!   covariance element-for-element, to f64 round-off. The comparison is
//!   oracle-reconstruction-vs-kshana-INPUT — NOT a re-parse by kshana's own reader,
//!   which would be a self-check.
//!
//! NEGATIVE CONTROL (two independent ways):
//!   1. Value fidelity: because the reference is `oem`'s reconstruction of the
//!      matrix kshana emitted, any wrong entry kshana wrote would be reconstructed
//!      wrong and the element-for-element comparison would fail. `perturbed_negative_control`
//!      demonstrates this directly by corrupting one input entry and showing the
//!      oracle no longer matches.
//!   2. Format necessity: the reference records that `oem` REJECTS the labelled
//!      `CX_X = …` covariance variant ("Invalid covariance header") — so kshana's
//!      UNLABELLED bare-number layout is precisely the form this independent parser
//!      needs; a differently-formatted block would not have parsed at all.
//!
//! HONEST SCOPE: this closes the row-named "no cross-validation against a
//! third-party CCSDS OEM covariance fixture" gap — it validates the CCSDS-502
//! covariance-block KVN INTERCHANGE round-trip (kshana emit → independent `oem`
//! parse → symmetric-matrix reconstruct). It does NOT validate the numerical CONTENT
//! of any particular covariance (a filter/OD question owned by other rows), only
//! that kshana emits the standard wire format such that an independent CCSDS-502
//! reader reconstructs the identical matrix.
//!
//! Because CI must not run Python, everything is committed under
//! `tests/fixtures/ccsds_cov/`: the frozen kshana OEM the oracle parsed
//! (`kshana_cov_leo.oem`), the oracle's recorded reconstruction
//! (`p5_ccsds_cov_reference.txt`), and the generator
//! (`generate_p5_ccsds_cov_reference.py`). The fixture is regenerated from kshana's
//! own serialiser by `examples/gen_p5_ccsds_cov_fixture.rs`.

use kshana::oem::{
    covariance_block_kvn, Covariance6, OemFile, OemMetadata, OemSegment, OemStateLine,
};
use kshana::orbit::{Orbit, Propagator};
use kshana::rinex::EpochUtc;

const REF: &str = include_str!("fixtures/ccsds_cov/p5_ccsds_cov_reference.txt");
const OEM_COV: &str = include_str!("fixtures/ccsds_cov/kshana_cov_leo.oem");

// The covariance entries span ~1e-4 (position km²) down to ~1e-11 (velocity
// km²/s²). The KVN prints each with 15 significant digits and both kshana and the
// oracle round-trip f64s, so agreement is to a few ULP. Compare with a RELATIVE
// tolerance so the tiny velocity-block entries are held to the same fidelity as the
// large position-block entries.
const REL_TOL: f64 = 1e-12;
const ABS_FLOOR: f64 = 1e-30; // guards exact-zero entries (there are none here)

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

fn iso(e: &EpochUtc) -> String {
    format!(
        "{:04}-{:02}-{:02}T{:02}:{:02}:{:09.6}",
        e.year, e.month, e.day, e.hour, e.minute, e.second
    )
}

/// The realistic LEO orbit-determination covariance kshana serialises — the SAME
/// construction as `examples/gen_p5_ccsds_cov_fixture.rs`. Built as L·Lᵀ from a
/// lower-triangular L with distinct entries, so the matrix is symmetric
/// positive-definite with distinct off-diagonals (a transpose/index bug could not
/// pass unnoticed). Units: [x,y,z] km², [ẋ,ẏ,ż] km²/s², cross-terms km²/s.
#[allow(clippy::needless_range_loop)]
fn od_covariance() -> Covariance6 {
    let l: [[f64; 6]; 6] = [
        [1.2e-2, 0.0, 0.0, 0.0, 0.0, 0.0],
        [3.0e-3, 1.5e-2, 0.0, 0.0, 0.0, 0.0],
        [-2.0e-3, 4.0e-3, 1.8e-2, 0.0, 0.0, 0.0],
        [1.0e-5, -3.0e-6, 2.0e-6, 6.0e-6, 0.0, 0.0],
        [-2.0e-6, 5.0e-6, 1.0e-6, 1.5e-6, 5.0e-6, 0.0],
        [3.0e-6, 1.0e-6, -4.0e-6, 8.0e-7, 1.2e-6, 4.0e-6],
    ];
    let mut c = [[0.0f64; 6]; 6];
    for i in 0..6 {
        for j in 0..6 {
            let mut s = 0.0;
            for k in 0..6 {
                s += l[i][k] * l[j][k];
            }
            c[i][j] = s;
        }
    }
    c
}

/// Build one EME2000/UTC LEO segment of `n` epochs, epochs stamped on a whole-second
/// grid — the SAME construction as `examples/gen_p5_ccsds_cov_fixture.rs`.
fn segment(object: &str, prop: &Propagator, t0: EpochUtc, step_s: f64, n: usize) -> OemSegment {
    let base_sod = t0.hour as f64 * 3600.0 + t0.minute as f64 * 60.0 + t0.second;
    let stamp = |i: usize| -> EpochUtc {
        let total = base_sod + i as f64 * step_s;
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
        let t = i as f64 * step_s;
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
    let start = states.first().unwrap().epoch;
    let stop = states.last().unwrap().epoch;
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

/// Re-emit the frozen fixture from kshana's own serialiser: header + one segment via
/// `OemFile::to_oem_string`, then kshana's `covariance_block_kvn` spliced in after
/// the state lines (inside the segment, where CCSDS 502.0 places it).
fn build_cov_oem(cov: &Covariance6) -> String {
    let created = epoch(2026, 6, 27, 0, 0, 0.0);
    let t0 = epoch(2024, 1, 1, 0, 0, 0.0);
    let leo = Propagator::Kepler(Orbit::keplerian(6_878_000.0, 0.001, 0.9, 0.3, 0.2, 0.4));
    let f = OemFile {
        version: "2.0".to_string(),
        creation_date: created,
        originator: "KSHANA".to_string(),
        segments: vec![segment("KSHANA-COV-LEO-1", &leo, t0, 300.0, 6)],
    };
    let mut text = f.to_oem_string();
    let cov_epoch = iso(&f.segments[0].states[0].epoch);
    let block = covariance_block_kvn(&cov_epoch, cov, Some("RTN"));
    if !text.ends_with('\n') {
        text.push('\n');
    }
    text.push('\n');
    text.push_str(&block);
    text
}

/// Read the oracle-reconstructed symmetric 6×6 matrix from the reference file: the
/// 21 `COV i j | value` lower-triangular entries mirrored into the upper triangle.
#[allow(clippy::needless_range_loop)]
fn oracle_matrix() -> [[f64; 6]; 6] {
    let mut m = [[f64::NAN; 6]; 6];
    let mut seen = 0usize;
    for line in REF.lines() {
        if !line.starts_with("COV ") {
            continue;
        }
        // COV <i> <j> | <value>
        let parts: Vec<&str> = line.splitn(2, '|').collect();
        assert_eq!(parts.len(), 2, "malformed COV line: {line}");
        let idx: Vec<&str> = parts[0].split_whitespace().collect();
        assert_eq!(idx.len(), 3, "malformed COV index: {line}");
        let i: usize = idx[1].parse().unwrap();
        let j: usize = idx[2].parse().unwrap();
        let v: f64 = parts[1].trim().parse().unwrap();
        m[i][j] = v;
        m[j][i] = v; // mirror to the upper triangle
        seen += 1;
    }
    assert_eq!(
        seen, 21,
        "reference must carry 21 lower-triangular entries, saw {seen}"
    );
    for i in 0..6 {
        for j in 0..6 {
            assert!(
                m[i][j].is_finite(),
                "reference matrix entry [{i}][{j}] missing"
            );
        }
    }
    m
}

fn rel_close(a: f64, b: f64) -> (bool, f64) {
    let scale = a.abs().max(b.abs()).max(ABS_FLOOR);
    let rel = (a - b).abs() / scale;
    (rel <= REL_TOL, rel)
}

/// The committed `.oem` fixture must be byte-identical to what kshana emits NOW from
/// the identical inputs — this binds the pinned oracle reconstruction (generated by
/// parsing exactly these bytes) to kshana's current `covariance_block_kvn` +
/// `to_oem_string` serialisers. If kshana's emitter changes, this fails and the
/// fixture + oracle reference must be regenerated via
/// `examples/gen_p5_ccsds_cov_fixture.rs` + the generator script.
#[test]
fn committed_cov_fixture_matches_current_kshana_emit() {
    let cov = od_covariance();
    assert_eq!(
        build_cov_oem(&cov),
        OEM_COV,
        "kshana covariance-OEM emit differs from committed fixture — regenerate fixture + oracle"
    );
}

/// The core external check: the independent `oem` library's reconstructed 6×6
/// covariance (recorded in the reference) must equal kshana's INPUT covariance
/// element-for-element, to f64 round-off. Also confirms the covariance frame/epoch
/// the oracle read.
#[test]
#[allow(clippy::needless_range_loop)]
fn oem_oracle_reconstructs_kshana_input_covariance() {
    let input = od_covariance();
    let oracle = oracle_matrix();

    // The oracle recorded the frame and epoch it parsed from the block.
    let frame = REF
        .lines()
        .find_map(|l| l.strip_prefix("COVFRAME |"))
        .expect("no COVFRAME line in reference")
        .trim();
    assert_eq!(
        frame, "RTN",
        "oracle read the covariance frame kshana emitted"
    );
    let cov_epoch = REF
        .lines()
        .find_map(|l| l.strip_prefix("COVEPOCH |"))
        .expect("no COVEPOCH line in reference")
        .trim();
    assert_eq!(
        cov_epoch, "2024-01-01T00:00:00.000000",
        "oracle read the covariance epoch kshana emitted"
    );

    // Element-for-element: oracle reconstruction vs kshana input.
    let mut worst_rel = 0.0f64;
    for i in 0..6 {
        for j in 0..6 {
            let (ok, rel) = rel_close(oracle[i][j], input[i][j]);
            worst_rel = worst_rel.max(rel);
            assert!(
                ok,
                "cov[{i}][{j}]: oem reconstructed {:.17e} vs kshana input {:.17e} (rel {rel:.2e} > {REL_TOL:.0e})",
                oracle[i][j], input[i][j]
            );
        }
    }

    // The oracle reconstruction is symmetric (it mirrored the lower triangle), and
    // kshana's input is symmetric by construction — cross-check both.
    for i in 0..6 {
        for j in 0..6 {
            assert!(
                (oracle[i][j] - oracle[j][i]).abs() <= ABS_FLOOR.max(oracle[i][j].abs() * REL_TOL),
                "oracle matrix not symmetric at [{i}][{j}]"
            );
        }
    }

    eprintln!(
        "ccsds_oem_covariance: independent oem library reconstructed all 36 entries of kshana's \
         6x6 covariance from the emitted CCSDS block; worst relative disagreement = {worst_rel:.2e} \
         (<= {REL_TOL:.0e})"
    );
}

/// Format-necessity leg of the negative control: the reference records that the
/// independent `oem` library REJECTS the labelled `CX_X = …` covariance variant, so
/// kshana's UNLABELLED bare-number lower-triangular layout is exactly the form this
/// parser needs. A differently-formatted block would not have parsed at all.
#[test]
fn oracle_rejects_the_labelled_covariance_variant() {
    let negctl = REF
        .lines()
        .find(|l| l.starts_with("NEGCTL "))
        .expect("no NEGCTL line in reference");
    assert!(
        negctl.contains("REJECTED"),
        "expected the oem library to REJECT the labelled CX_X= variant: {negctl}"
    );
    assert!(
        negctl.contains("Invalid covariance header"),
        "expected the specific covariance-header rejection reason: {negctl}"
    );
}

/// Executable negative control: if kshana's INPUT covariance is perturbed by one
/// entry, it no longer matches the oracle's reconstruction of the (unperturbed)
/// emitted block — proving the test has teeth and would FAIL were kshana wrong.
#[test]
#[allow(clippy::needless_range_loop)]
fn perturbed_negative_control() {
    let oracle = oracle_matrix();
    let mut input = od_covariance();
    // Perturb a single position-block entry by 1 part in 10^6 — far above REL_TOL.
    input[0][0] *= 1.0 + 1e-6;

    // At least one (i,j) must now disagree beyond tolerance.
    let mut any_fail = false;
    for i in 0..6 {
        for j in 0..6 {
            let (ok, _rel) = rel_close(oracle[i][j], input[i][j]);
            if !ok {
                any_fail = true;
            }
        }
    }
    assert!(
        any_fail,
        "perturbing kshana's covariance input must break the oracle match (negative control)"
    );
}
