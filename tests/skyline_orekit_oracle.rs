// SPDX-License-Identifier: AGPL-3.0-only
//! Azimuth-dependent skyline masks against Orekit 12.2 and gnss_lib_py 1.0.4, as pre-registered
//! in `xval/orekit-skyline/PREREGISTRATION.md` (the inputs, the quantities (a) to (f), the
//! tolerances and the decision rule were committed before either oracle was run).
//!
//! The inputs under `tests/fixtures/skyline_orekit_oracle/inputs/` are committed: six geodetic
//! sites, Earth-fixed satellite positions at four epochs, and six azimuth/elevation tables.
//! The oracle outputs under `outputs/` are written by `xval/orekit-skyline/OrekitSkyline.java`
//! (Orekit `TopocentricFrame` look angles and `ElevationMask` values) and
//! `xval/orekit-skyline/gnss_lib_py_dop.py` (gnss_lib_py `get_dop` on the sets Orekit finds
//! visible). Kshana computes every quantity from the same inputs with its own code.

use kshana::frames::{look_angles, Geodetic};
use kshana::geometry::{sky_geometry, ClockModel, SatelliteInput, SkyRequest};
use kshana::skyline::SkylineCfg;
use std::collections::{BTreeMap, BTreeSet};
use std::path::{Path, PathBuf};

/// Receiver mask (deg) of every satellite in the comparison.
const MASK_DEG: f64 = 5.0;
/// (a), (b), (c): look angles and mask values (deg).
const TOL_ANGLE_DEG: f64 = 1e-9;
/// Elevation below which an azimuth is compared (deg): near the zenith it is ill-conditioned.
const AZ_MAX_EL_DEG: f64 = 89.9;
/// (d): satellites closer than this to the cut (deg) are counted and left out of the set test.
const BOUNDARY_BAND_DEG: f64 = 1e-6;
/// (e), (f): relative tolerance where PDOP < `PDOP_SPLIT`, and where it is not.
const TOL_DOP_WELL: f64 = 1e-9;
const TOL_DOP_ILL: f64 = 1e-6;
const PDOP_SPLIT: f64 = 20.0;

fn dir() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/skyline_orekit_oracle")
}

fn csv(path: &Path) -> Vec<Vec<String>> {
    std::fs::read_to_string(path)
        .unwrap_or_else(|e| panic!("{}: {e}", path.display()))
        .lines()
        .skip(1) // the header
        .filter(|l| !l.trim().is_empty() && !l.starts_with('#'))
        .map(|l| l.split(',').map(str::to_string).collect())
        .collect()
}

fn f(s: &str) -> f64 {
    s.parse().unwrap_or_else(|e| panic!("{s}: {e}"))
}

struct Inputs {
    sites: Vec<(String, Geodetic)>,
    sats: Vec<(String, String, [f64; 3])>,
    masks: BTreeMap<String, kshana::skyline::Skyline>,
}

fn inputs() -> Inputs {
    let d = dir().join("inputs");
    let sites = csv(&d.join("sites.csv"))
        .into_iter()
        .map(|r| {
            (
                r[0].clone(),
                Geodetic {
                    lat_rad: f(&r[1]).to_radians(),
                    lon_rad: f(&r[2]).to_radians(),
                    alt_m: f(&r[3]),
                },
            )
        })
        .collect();
    let sats = csv(&d.join("sats.csv"))
        .into_iter()
        .map(|r| (r[0].clone(), r[1].clone(), [f(&r[2]), f(&r[3]), f(&r[4])]))
        .collect();
    let mut tables: BTreeMap<String, Vec<[f64; 2]>> = BTreeMap::new();
    for r in csv(&d.join("masks.csv")) {
        tables
            .entry(r[0].clone())
            .or_default()
            .push([f(&r[1]), f(&r[2])]);
    }
    let masks = tables
        .into_iter()
        .map(|(k, rows)| {
            let cfg = SkylineCfg {
                table: Some(rows),
                ..Default::default()
            };
            (k, cfg.build().expect("an input table builds"))
        })
        .collect();
    Inputs { sites, sats, masks }
}

/// Write the committed inputs from the engine's presets. Run once; never in the gate.
#[test]
#[ignore = "regenerates the committed inputs; set KSHANA_WRITE_SKYLINE_ORACLE_INPUTS=1"]
fn write_inputs() {
    if std::env::var("KSHANA_WRITE_SKYLINE_ORACLE_INPUTS").as_deref() != Ok("1") {
        return;
    }
    let d = dir().join("inputs");
    std::fs::create_dir_all(&d).unwrap();
    let sites = [
        ("equator", 0.0, 0.0, 0.0),
        ("mid-latitude", 45.0, 10.0, 100.0),
        ("baltic-port", 59.45, 24.75, 15.0),
        ("west-norway", 61.1, 6.6, 20.0),
        ("high-arctic", 78.2, 15.6, 50.0),
        ("southern", -33.9, 151.2, 40.0),
    ];
    let mut s = String::from("site_id,lat_deg,lon_deg,height_m\n");
    for (id, lat, lon, h) in sites {
        s.push_str(&format!("{id},{lat},{lon},{h}\n"));
    }
    std::fs::write(d.join("sites.csv"), s).unwrap();
    let mut s = String::from("epoch_s,sat_id,x_m,y_m,z_m\n");
    for t in [0.0, 3600.0, 7200.0, 21600.0] {
        for name in ["gps-baseline", "galileo", "beidou-meo", "xona-pulsar"] {
            let cfg = kshana::leo_fusion::system::SystemCfg {
                name: name.into(),
                preset: (name != "xona-pulsar").then(|| name.into()),
                leo_preset: (name == "xona-pulsar").then(|| name.into()),
                ..Default::default()
            };
            let sys = cfg.build().unwrap();
            for (j, o) in sys.orbits.iter().enumerate() {
                let (p, _) = o.state(t);
                s.push_str(&format!(
                    "{t},{name}-{},{:.3},{:.3},{:.3}\n",
                    j + 1,
                    p[0],
                    p[1],
                    p[2]
                ));
            }
        }
    }
    std::fs::write(d.join("sats.csv"), s).unwrap();
    let mut s = String::from("mask_id,az_deg,el_deg\n");
    for p in kshana::skyline::preset_list() {
        for (i, el) in p.table.iter().enumerate() {
            s.push_str(&format!("{},{i},{el:.12}\n", p.name));
        }
    }
    for (az, el) in [(12.5, 20.0), (100.25, 5.0), (200.0, 35.5), (350.75, 10.0)] {
        s.push_str(&format!("irregular-4,{az},{el}\n"));
    }
    for k in 0..37 {
        let az = 7.3 + 9.7 * k as f64;
        let el = 12.0 + 10.0 * (0.37 * k as f64).sin() + 0.25 * (k % 3) as f64;
        s.push_str(&format!("irregular-37,{az:.4},{el:.6}\n"));
    }
    std::fs::write(d.join("masks.csv"), s).unwrap();
}

fn wrap_diff(a: f64, b: f64) -> f64 {
    let d = (a - b).rem_euclid(360.0);
    d.min(360.0 - d)
}

#[test]
fn skyline_masks_agree_with_orekit_and_gnss_lib_py_as_pre_registered() {
    let out = dir().join("outputs");
    let orekit_path = out.join("orekit.csv");
    let glp_path = out.join("gnss_lib_py_dop.csv");
    if !orekit_path.exists() || !glp_path.exists() {
        // Pre-registration state: the oracles have not been run yet.
        eprintln!(
            "skyline oracle outputs absent ({}): pre-registered, not yet compared",
            out.display()
        );
        return;
    }
    let inp = inputs();
    let orekit_text = std::fs::read_to_string(&orekit_path).unwrap();
    let header: Vec<&str> = orekit_text.lines().next().unwrap().split(',').collect();
    let mask_ids: Vec<String> = header[5..]
        .iter()
        .map(|h| h.trim_start_matches("cut_").to_string())
        .collect();
    assert_eq!(
        mask_ids.iter().cloned().collect::<BTreeSet<_>>(),
        inp.masks.keys().cloned().collect::<BTreeSet<_>>()
    );
    let orekit: BTreeMap<(String, String, String), (f64, f64, Vec<f64>)> = csv(&orekit_path)
        .into_iter()
        .map(|r| {
            (
                (r[0].clone(), r[1].clone(), r[2].clone()),
                (f(&r[3]), f(&r[4]), r[5..].iter().map(|v| f(v)).collect()),
            )
        })
        .collect();

    let (mut worst_el, mut worst_az, mut worst_cut) = (0.0_f64, 0.0_f64, 0.0_f64);
    let (mut n_look, mut band, mut set_mismatch) = (0usize, 0usize, Vec::new());
    // Kshana's own visible sets: (site, epoch, mask) -> [(sat, az, el)].
    let mut kshana_sets: BTreeMap<(String, String, String), Vec<(String, f64, f64)>> =
        BTreeMap::new();
    let mut orekit_sets: BTreeMap<(String, String, String), BTreeSet<String>> = BTreeMap::new();
    for (site, geo) in &inp.sites {
        for (epoch, sat, pos) in &inp.sats {
            let l = look_angles(*geo, *pos);
            let (az, el) = (l.az_rad.to_degrees(), l.el_rad.to_degrees());
            let key = (site.clone(), epoch.clone(), sat.clone());
            let Some((oaz, oel, ocuts)) = orekit.get(&key) else {
                assert!(
                    el < 1e-6,
                    "{key:?}: Kshana sees it at {el} deg, Orekit not at all"
                );
                continue;
            };
            n_look += 1;
            worst_el = worst_el.max((el - oel).abs());
            if el < AZ_MAX_EL_DEG {
                worst_az = worst_az.max(wrap_diff(az, *oaz));
            }
            for (k, m) in mask_ids.iter().enumerate() {
                let sky = &inp.masks[m];
                let cut = sky.cut_deg(az);
                worst_cut = worst_cut.max((cut - ocuts[k]).abs());
                let ocut_eff = MASK_DEG.max(ocuts[k]);
                if (oel - ocut_eff).abs() < BOUNDARY_BAND_DEG {
                    band += 1;
                    continue;
                }
                let kvis = sky.visible(az, el, MASK_DEG);
                let ovis = *oel >= ocut_eff;
                if kvis != ovis {
                    set_mismatch.push(format!("{key:?} {m}: kshana {kvis} orekit {ovis}"));
                }
                let set_key = (site.clone(), epoch.clone(), m.clone());
                if kvis {
                    kshana_sets
                        .entry(set_key.clone())
                        .or_default()
                        .push((sat.clone(), az, el));
                }
                if ovis {
                    orekit_sets.entry(set_key).or_default().insert(sat.clone());
                }
            }
        }
    }
    eprintln!(
        "skyline oracle: {n_look} look angles; worst |d el| {worst_el:.3e} deg, |d az| \
         {worst_az:.3e} deg, |d mask| {worst_cut:.3e} deg; {band} satellite-masks in the \
         boundary band"
    );
    assert!(n_look > 1000, "only {n_look} look angles compared");
    assert!(worst_el <= TOL_ANGLE_DEG, "(a) elevation: {worst_el:e} deg");
    assert!(worst_az <= TOL_ANGLE_DEG, "(b) azimuth: {worst_az:e} deg");
    assert!(worst_cut <= TOL_ANGLE_DEG, "(c) mask: {worst_cut:e} deg");
    assert!(
        set_mismatch.is_empty(),
        "(d) visible sets differ:\n{}",
        set_mismatch.join("\n")
    );

    // (e), (f): DOP and cofactor of every set of at least four.
    let labels = ["ee", "en", "eu", "et", "nn", "nu", "nt", "uu", "ut", "tt"];
    let index = |l: &str| -> (usize, usize) {
        let ax = |c: char| match c {
            'e' => 0,
            'n' => 1,
            'u' => 2,
            _ => 3,
        };
        let mut c = l.chars();
        (ax(c.next().unwrap()), ax(c.next().unwrap()))
    };
    let (mut worst_dop, mut worst_q, mut n_sets) = (0.0_f64, 0.0_f64, 0usize);
    let glp = csv(&glp_path);
    let glp_keys: BTreeSet<(String, String, String)> = glp
        .iter()
        .map(|r| (r[0].clone(), r[1].clone(), r[2].clone()))
        .collect();
    let kshana_keys: BTreeSet<(String, String, String)> = kshana_sets
        .iter()
        .filter(|(_, v)| v.len() >= 4)
        .map(|(k, _)| k.clone())
        .collect();
    assert_eq!(kshana_keys, glp_keys, "(d) the sets of four or more differ");
    for r in &glp {
        let key = (r[0].clone(), r[1].clone(), r[2].clone());
        let vis = &kshana_sets[&key];
        assert_eq!(vis.len(), r[3].parse::<usize>().unwrap(), "{key:?}");
        assert_eq!(
            vis.iter().map(|v| v.0.clone()).collect::<BTreeSet<_>>(),
            orekit_sets[&key],
            "{key:?}"
        );
        let req = SkyRequest {
            satellites: Some(
                vis.iter()
                    .map(|(id, az, el)| SatelliteInput {
                        id: Some(id.clone()),
                        az_deg: Some(*az),
                        el_deg: Some(*el),
                        ..Default::default()
                    })
                    .collect(),
            ),
            mask_deg: Some(-90.0),
            clock: ClockModel::Common,
            ..Default::default()
        };
        let g = sky_geometry(&req).unwrap();
        let d = g
            .dop
            .expect("four or more satellites in a non-degenerate sky");
        let q = g.cofactor_enu.unwrap();
        let o: Vec<f64> = r[4..9].iter().map(|v| f(v)).collect();
        let tol = if o[1] < PDOP_SPLIT {
            TOL_DOP_WELL
        } else {
            TOL_DOP_ILL
        };
        for (k, (a, b)) in [d.gdop, d.pdop, d.hdop, d.vdop, d.tdop]
            .iter()
            .zip(&o)
            .enumerate()
        {
            let rel = (a - b).abs() / b.abs();
            worst_dop = worst_dop.max(rel);
            assert!(rel <= tol, "(e) {key:?} DOP {k}: {a} vs {b} (rel {rel:e})");
        }
        let oq: Vec<f64> = r[9..19].iter().map(|v| f(v)).collect();
        let scale = oq.iter().fold(0.0_f64, |m, v| m.max(v.abs()));
        for (l, ov) in labels.iter().zip(&oq) {
            let (i, j) = index(l);
            // Position-clock entries flip sign between the [-e, 1] and [e, 1] conventions.
            let sign = if (i == 3) != (j == 3) { -1.0 } else { 1.0 };
            let diff = (q[i][j] - sign * ov).abs() / scale;
            worst_q = worst_q.max(diff);
            assert!(
                diff <= tol,
                "(f) {key:?} q_{l}: {} vs {}",
                q[i][j],
                sign * ov
            );
        }
        n_sets += 1;
    }
    eprintln!(
        "skyline oracle: {n_sets} visible sets; worst DOP relative {worst_dop:.3e}, worst \
         cofactor {worst_q:.3e} of the matrix scale"
    );
    assert!(n_sets > 100, "only {n_sets} sets compared");
}
