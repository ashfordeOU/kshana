// SPDX-License-Identifier: AGPL-3.0-only
//! DEV: pass D (DSS 43) fit diagnostics (CAP-30 run 2). Development pass only.
//!
//! ORACLE: `mro_psp5.bsp`, the reconstruction the JPL MRO navigation team produced from the full
//! DSN tracking with its own models (NAIF, MRO-M-SPICE-6-V1.0). Kshana reads it with its own SPK
//! type 1 reader, which is checked here against CSPICE (an engineering check, not evidence).
//!
//! DATA-GATED. The reconstruction, DE440s, the DSN station coordinates and the GMM-3 field are
//! fetched by `scripts/fetch_mro_od.sh` into `realdata-cache/mro/` (or the directory named by
//! `KSHANA_MRO_OD_DIR`). Every file is checked against its pinned SHA-256 and the test fails on a
//! mismatch. Without the files it prints a skip notice, unless `KSHANA_REQUIRE_REALDATA=1` (the
//! monthly CI job), which makes a missing file a failure.
//!
//! BARS, registered in `xval/mro-od/PREREGISTRATION.md` (commit abf7a311, before any Doppler
//! prediction or fit; amendment A1 before the scored run), on the scored arc 2007-304T23:00 to
//! 2007-305T12:45 UTC (DSS 63 and DSS 14, 2-way X-band Doppler compressed to 60 s):
//!
//! - B1: Doppler predicted from the reconstruction, RMS of observed − predicted ≤ 0.030 Hz;
//! - B2: post-fit Doppler RMS of the orbit determination ≤ 0.030 Hz;
//! - B3: 3-D position difference, estimate − reconstruction, RMS ≤ 1.0 km (60 s sampling);
//! - B4: its maximum ≤ 2.5 km;
//! - B5: points removed by the outlier rule ≤ 5 %.
//!
//! RESULT of the registered run (amendments A1 and A2 in force; 447 of 459 60-s points have
//! ramp coverage): B1 MET, 0.01253 Hz (32 of 447 points edited). B2-B5 NOT MET: the registered
//! fit stopped with a normal matrix that is not positive definite and produced no orbit. Both
//! are pinned below; the row stays MODELLED.

use kshana::mars_od::*;
use kshana::naif_kernel::SpkKernel;
use kshana::odf::{parse_odf, seconds_1950};
use sha2::{Digest, Sha256};
use std::collections::BTreeMap;
use std::path::{Path, PathBuf};

const PINS: [(&str, &str); 5] = [
    (
        "mro_psp5.bsp",
        "9c26069bcdfca2ef42e5afd3baebb721ffb9dfc22096fcffd59aef430b676c75",
    ),
    (
        "de440s.bsp",
        "c1c7feeab882263fc493a9d5a5b2ddd71b54826cdf65d8d17a76126b260a49f2",
    ),
    (
        "earthstns_itrf93_260814.cmt",
        "567f9516452b849a58c3ff75fa6cec8a81cc336cb7726238c49fe265f294dff5",
    ),
    (
        "gmm3_120_sha.tab",
        "eb4913b1afb6682406e6a9dad5be7918a162fa8462473c9a2e7aae258d4c2c9c",
    ),
    (
        "gmm3_120_sha.lbl",
        "097f9989fc87bc9adbf04be754734349160228de940f9a242164f3be1b80bb7d",
    ),
];

const EOP_SHA256: &str = "7c672ff206aea2755ccdd733662c7567b38b772273d7b6130694b020af9c8a1c";

fn repo(p: &str) -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR")).join(p)
}

fn sha256(bytes: &[u8]) -> String {
    Sha256::digest(bytes)
        .iter()
        .map(|b| format!("{b:02x}"))
        .collect()
}

/// The data directory with every pinned file checked, or `None` (skip) when files are absent
/// and real data are not required.
fn data_dir() -> Option<PathBuf> {
    let dir = std::env::var_os("KSHANA_MRO_OD_DIR")
        .map(PathBuf::from)
        .unwrap_or_else(|| repo("realdata-cache/mro"));
    let missing: Vec<&str> = PINS
        .iter()
        .filter(|(f, _)| !dir.join(f).is_file())
        .map(|(f, _)| *f)
        .collect();
    if !missing.is_empty() {
        let msg = format!(
            "MRO OD inputs missing in {}: {missing:?} (run scripts/fetch_mro_od.sh)",
            dir.display()
        );
        if std::env::var("KSHANA_REQUIRE_REALDATA").as_deref() == Ok("1") {
            panic!("{msg}");
        }
        eprintln!("SKIP: {msg}");
        return None;
    }
    for (f, want) in PINS {
        let got = sha256(&std::fs::read(dir.join(f)).expect("read input"));
        assert_eq!(got, want, "SHA-256 mismatch for {f}");
    }
    Some(dir)
}

fn kernel(dir: &Path, f: &str) -> SpkKernel {
    SpkKernel::open(&dir.join(f)).expect("SPK")
}

fn utc(doy: u32, h: u32, m: u32) -> Utc1950 {
    Utc1950 {
        whole: seconds_1950(2007, doy, h, m, 0.0),
        frac: 0.0,
    }
}

fn model(dir: &Path, odf: &kshana::odf::Odf) -> DopplerModel {
    let eop_text =
        std::fs::read_to_string(repo("tests/fixtures/mro_od/finals2000A_54401_54408.txt"))
            .expect("EOP fixture");
    assert_eq!(sha256(eop_text.as_bytes()), EOP_SHA256);
    let stations = parse_dsn_stations(
        &std::fs::read_to_string(dir.join("earthstns_itrf93_260814.cmt")).expect("stations"),
    )
    .expect("station block");
    let ramps: BTreeMap<u16, RampTable> = [14u16, 43, 63]
        .into_iter()
        .map(|s| (s, RampTable::for_station(odf, s)))
        .collect();
    DopplerModel {
        stations,
        earth: EarthFrame::new(kshana::eop::EopSeries::from_finals2000a(&eop_text)),
        eph: Ephemeris::new(kernel(dir, "de440s.bsp")),
        ramps,
        troposphere: true,
        antenna_radial_offset_m: 1.5,
    }
}

#[test]
#[ignore = "dev pass D diagnostics, run by hand"]
fn dev_pass_d_fit() {
    let Some(dir) = data_dir() else { return };
    let odf = parse_odf(
        &std::fs::read(repo(
            "tests/fixtures/mro_odf/mromagr2007_304_1424xmmmv1.odf",
        ))
        .unwrap(),
    )
    .unwrap();
    let model = model(&dir, &odf);
    let mro = kernel(&dir, "mro_psp5.bsp");
    let (from, to) = (utc(304, 16, 0), utc(304, 22, 0));
    let points: Vec<DopplerPoint> = compress_two_way(&odf, from, to, 60)
        .into_iter()
        .filter(|p| {
            p.station == 43
                && model.ramps[&p.station]
                    .integral_minus_ref(p.t3s, -900.0, p.tc)
                    .is_some()
        })
        .collect();
    let eph = Ephemeris::new(kernel(&dir, "de440s.bsp"));
    let field = kshana::gravity_sh::SphericalHarmonicField::from_shadr(
        &std::fs::read_to_string(dir.join("gmm3_120_sha.tab")).unwrap(),
        80,
    )
    .unwrap();
    let dynamics = MarsDynamics {
        field,
        mars: kshana::body::Body::mars(),
        eph: &eph,
        cd_area_over_mass: 0.073,
    };
    let epoch = et_of_utc(from).total();
    let s = mro.state(-74, 4, epoch, 0.0).unwrap();
    let k: f64 = std::env::var("DEV_OFFSET")
        .ok()
        .and_then(|v| v.parse().ok())
        .unwrap_or(1.0);
    let guess = [
        s[0][0] + 1e3 * k,
        s[0][1] + 1e3 * k,
        s[0][2] + 1e3 * k,
        s[1][0] + k,
        s[1][1] + k,
        s[1][2] + k,
    ];
    println!("pass D points {}", points.len());
    let r = (if std::env::var_os("DEV_DAMPED").is_some() {
        fit_damped
    } else {
        fit
    })(
        &model,
        &dynamics,
        &points,
        epoch,
        guess,
        ForceParams {
            srp_cr_a_over_m: 0.043,
            drag_scale: 1.0,
        },
        &FitSettings {
            min_elevation_rad: 15f64.to_radians(),
            outlier_k: 5.0,
            step_s: 5.0,
            max_iter: std::env::var("DEV_ITER")
                .ok()
                .and_then(|v| v.parse().ok())
                .unwrap_or(15),
        },
    );
    match r {
        Err(e) => println!("fit failed: {e}"),
        Ok(f) => {
            let mut d = Vec::new();
            let mut t = epoch;
            while t <= et_of_utc(to).total() - 120.0 {
                let a = f.trajectory.state(t).unwrap();
                let b = mro.state(-74, 4, t, 0.0).unwrap()[0];
                d.push(
                    ((a[0] - b[0]).powi(2) + (a[1] - b[1]).powi(2) + (a[2] - b[2]).powi(2)).sqrt(),
                );
                t += 60.0;
            }
            for l in &f.log {
                println!("{l:?}");
            }
            println!("post-fit {:.5} Hz, {} outliers of {}, {} it, params {:?}, pos rms {:.1} m max {:.1} m",
                rms(&f.residuals_hz), f.n_outliers, f.n_after_elevation, f.iterations, f.params,
                rms(&d), d.iter().cloned().fold(0.0, f64::max));
        }
    }
}
