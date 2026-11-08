// SPDX-License-Identifier: AGPL-3.0-only
//! M5 bar B4: the engine's link budget and detection probability at the pass peak of P1-P10 agree
//! with the independent numpy oracle (`xval/m5-jammers-from-orbit/oracle_b4.json`) within 1e-9 dB and
//! 1e-6 in probability, with the same pass-peak times.

use serde_json::Value;

#[test]
fn engine_agrees_with_the_oracle() {
    let o: Value = serde_json::from_str(
        &std::fs::read_to_string("xval/m5-jammers-from-orbit/oracle_b4.json").expect("oracle"),
    )
    .expect("json");
    let e = kshana::m5_hybrid::b4_rows();
    for (pe, po) in e["points"]
        .as_array()
        .unwrap()
        .iter()
        .zip(o["points"].as_array().unwrap())
    {
        assert_eq!(pe["peak_t_s"].as_f64(), po["peak_t_s"].as_f64());
        for (re, ro) in pe["receivers"]
            .as_array()
            .unwrap()
            .iter()
            .zip(po["receivers"].as_array().unwrap())
        {
            for c in ["E10", "E30", "E40"] {
                let d =
                    (re[c]["pr_dbw"].as_f64().unwrap() - ro[c]["pr_dbw"].as_f64().unwrap()).abs();
                let q = (re[c]["pd"].as_f64().unwrap() - ro[c]["pd"].as_f64().unwrap()).abs();
                assert!(d <= 1e-9 && q <= 1e-6, "{c}: {d} dB, {q}");
            }
        }
    }
}
