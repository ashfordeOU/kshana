// SPDX-License-Identifier: AGPL-3.0-only
//! The opt-in LS+AR extension of an Earth-orientation series beyond its last row
//! (`EopSeries::with_ls_ar_prediction`, package WP-03 item CAP-02b), on the real IERS daily
//! history already committed for the LS+AR row (MJD 58063-61209).
//!
//! What is checked here is the wiring, as internal consistency: the extended series keeps every
//! tabulated record and every in-table frame argument bit for bit; its forecast records are
//! exactly the predictor's own output; and the frame arguments of an epoch beyond the table now
//! follow the forecast instead of clamping to the last row. The accuracy of the forecast itself
//! is the separate LS+AR row (`tests/operational_eop_ls_ar_bulletin_a_oracle.rs`, a finding
//! against IERS Bulletin A).

use kshana::eop::{EopRecord, EopSeries, ARCSEC_TO_RAD};
use kshana::eop_ls_ar::{ls_ar_predict, LsArConfig};
use kshana::timescales::{MJD_OFFSET, SECONDS_PER_DAY};

const BASE: &str = include_str!("fixtures/operational_eop_ls_ar_oracle/history_base.csv");

fn series() -> EopSeries {
    let recs = BASE
        .lines()
        .filter(|l| !l.starts_with('#') && !l.starts_with("mjd"))
        .map(|l| {
            let f: Vec<&str> = l.split(',').collect();
            EopRecord {
                mjd: f[0].parse().unwrap(),
                xp_arcsec: f[1].parse().unwrap(),
                yp_arcsec: f[2].parse().unwrap(),
                ut1_utc_s: f[3].parse().unwrap(),
                lod_ms: 0.0,
            }
        })
        .collect();
    EopSeries::new(recs)
}

#[test]
fn prediction_extends_the_table_and_leaves_it_untouched() {
    let s = series();
    let last = s.last_mjd().unwrap();
    let cfg = LsArConfig::default();
    let ext = s
        .with_ls_ar_prediction(30, &cfg)
        .expect("five-year daily history");
    assert_eq!(ext.len(), s.len() + 30);

    // In-table: the same answer, bit for bit, at the rows and between them.
    for k in 0..400 {
        let mjd = last - 300.0 + 0.75 * k as f64;
        if mjd > last {
            break;
        }
        assert_eq!(s.interp_utc_mjd(mjd), ext.interp_utc_mjd(mjd), "MJD {mjd}");
    }

    // Forecast rows are the predictor's own output.
    let hist: Vec<_> = BASE
        .lines()
        .filter(|l| !l.starts_with('#') && !l.starts_with("mjd"))
        .map(|l| {
            let f: Vec<f64> = l.split(',').take(4).map(|x| x.parse().unwrap()).collect();
            (f[0], f[1], f[2], f[3])
        })
        .collect();
    let fc = ls_ar_predict(&hist, last, 30, &cfg).unwrap();
    for (mjd, xp, yp, ut1) in &fc {
        assert_eq!(
            ext.interp_utc_mjd(*mjd),
            (*ut1, *xp, *yp),
            "forecast day {mjd}"
        );
    }

    // Beyond the table the plain series clamps; the extended one follows the forecast.
    let mjd = last + 10.5;
    let clamped = s.interp_utc_mjd(mjd);
    let (a, b) = (fc[9], fc[10]);
    let want = (0.5 * (a.3 + b.3), 0.5 * (a.1 + b.1), 0.5 * (a.2 + b.2));
    let got = ext.interp_utc_mjd(mjd);
    assert!((got.0 - want.0).abs() < 1e-15 && (got.1 - want.1).abs() < 1e-15);
    assert_ne!(got, clamped, "the extended series must not clamp");

    // And the frame arguments read it: at a TT epoch 20 days past the table.
    let jd_tt = last + MJD_OFFSET + 20.0 + 69.184 / SECONDS_PER_DAY;
    let (_, xp, _) = ext.frame_args_tt(jd_tt);
    let (_, xp_clamped, _) = s.frame_args_tt(jd_tt);
    assert!(
        (xp / ARCSEC_TO_RAD - fc[19].1).abs() < 1e-6,
        "x_p follows the forecast"
    );
    assert_ne!(xp, xp_clamped);
}

#[test]
fn a_short_history_is_refused() {
    let s = series();
    let short = EopSeries::new(
        BASE.lines()
            .filter(|l| !l.starts_with('#') && !l.starts_with("mjd"))
            .take(100)
            .map(|l| {
                let f: Vec<f64> = l.split(',').take(4).map(|x| x.parse().unwrap()).collect();
                EopRecord {
                    mjd: f[0],
                    xp_arcsec: f[1],
                    yp_arcsec: f[2],
                    ut1_utc_s: f[3],
                    lod_ms: 0.0,
                }
            })
            .collect(),
    );
    assert!(short
        .with_ls_ar_prediction(10, &LsArConfig::default())
        .is_err());
    assert!(s.with_ls_ar_prediction(10, &LsArConfig::default()).is_ok());
}
