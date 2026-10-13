// SPDX-License-Identifier: AGPL-3.0-only
//! A real RINEX 4.00 observation file through `kshana::rinex_obs::parse_obs`.
//!
//! Data: the first four 30 s epochs of the IGS MGEX RINEX 4 pilot file
//! `MAO000USA_R_20231980000_01D_30S_MO` (Compact RINEX, expanded by the stdlib
//! decoder in `tests/fixtures/rinex4_obs_mao0_2023198/make_fixture.py`; see
//! NOTICE.md there). Seven systems, 58 satellites per epoch.
//!
//! Status: MODELLED (format ingest). The expected values below are read straight
//! from the published file — the header records, and the first epoch's
//! observations, which Compact RINEX stores literally (`3&26102727224` is
//! 26 102 727.224 m) — so they check that the RINEX 4 header and the record
//! columns are read, not that any computed quantity is right. The synthetic
//! RINEX 4.02 header test with the new `DOI` / `LICENSE OF USE` /
//! `STATION INFORMATION` records is in `src/rinex_obs.rs`.
//!
//! PIN-SCOPE: header fields, epoch structure, and first-epoch observation values
//! of the committed four-epoch RINEX 4.00 slice.
//! PIN-EXCLUDES: epochs 2–4 values (decoded by the fixture script, not by an
//! independent reader), positioning, and every other station or day.

use kshana::rinex_obs::parse_obs;

const OBS: &str =
    include_str!("fixtures/rinex4_obs_mao0_2023198/MAO000USA_R_20231980000_4EP_30S_MO.rnx");

#[test]
fn real_rinex_4_00_observation_header_is_read() {
    let f = parse_obs(OBS).expect("a real RINEX 4.00 observation file parses");
    let h = &f.header;
    assert!((h.version - 4.00).abs() < 1e-9);
    assert_eq!(h.system, 'M');
    let counts: Vec<(char, usize)> = h.obs_types.iter().map(|(s, c)| (*s, c.len())).collect();
    assert_eq!(
        counts,
        vec![
            ('G', 22),
            ('E', 20),
            ('S', 8),
            ('R', 16),
            ('C', 24),
            ('J', 24),
            ('I', 4)
        ]
    );
    // Continuation lines are read in order.
    assert_eq!(h.codes_for('G').unwrap()[13], "S2L");
    assert_eq!(h.codes_for('C').unwrap()[23], "S7D");
    assert_eq!(
        h.approx_xyz,
        Some([-5_466_067.022_1, -2_404_333.722_2, 2_242_124.299_0])
    );
    let t0 = h.time_of_first_obs.expect("TIME OF FIRST OBS");
    assert_eq!((t0.year, t0.month, t0.day, t0.hour), (2023, 7, 17, 0));
}

#[test]
fn real_rinex_4_00_epochs_and_first_epoch_values_are_read() {
    let f = parse_obs(OBS).unwrap();
    assert_eq!(f.epochs.len(), 4);
    for (k, e) in f.epochs.iter().enumerate() {
        assert_eq!(e.flag, 0);
        assert_eq!(e.sats.len(), 58);
        assert!((e.time.minute as f64 * 60.0 + e.time.second - 30.0 * k as f64).abs() < 1e-9);
        // Every record is aligned to its system's code list.
        for s in &e.sats {
            let n = f
                .header
                .codes_for(s.sat.chars().next().unwrap())
                .unwrap()
                .len();
            assert_eq!(s.obs.len(), n, "{}", s.sat);
        }
    }
    // First epoch, G16, from the Compact RINEX literals
    // `3&26102727224 3&137170663661 3&-1705786 3&38802` with flags `&606&6...`.
    let g16 = f.epochs[0].sats.iter().find(|s| s.sat == "G16").unwrap();
    let c1c = g16.obs[0].unwrap();
    assert_eq!(
        (c1c.value, c1c.lli, c1c.ssi),
        (26_102_727.224, None, Some(6))
    );
    let l1c = g16.obs[1].unwrap();
    assert_eq!(
        (l1c.value, l1c.lli, l1c.ssi),
        (137_170_663.661, Some(0), Some(6))
    );
    assert_eq!(f.observation(0, "G16", "D1C"), Some(-1705.786));
    assert_eq!(f.observation(0, "G16", "S1C"), Some(38.802));
    // E19 (Galileo, five frequencies), first-epoch literals.
    assert_eq!(f.observation(0, "E19", "C1C"), Some(27_709_903.261));
    assert_eq!(f.observation(0, "E19", "S8Q"), Some(39.805));
    // C59 (a BeiDou GEO) tracks no B1C/B2a: its first eight fields are blank.
    let c59 = f.epochs[0].sats.iter().find(|s| s.sat == "C59").unwrap();
    assert!(c59.obs[..8].iter().all(Option::is_none));
    assert_eq!(f.observation(0, "C59", "C2I"), Some(40_114_813.625));
    assert_eq!(f.satellites().len(), 58);
}
