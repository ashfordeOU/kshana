// SPDX-License-Identifier: AGPL-3.0-only
//! ESA Celeste in-orbit demonstration (IOD). This is the one preset that uses material
//! presented at the ESA Navigation Innovation and Support Programme (NAVISP) LEO-PNT
//! workshop, 2026; every workshop-derived number lives in this file (and its one
//! scenario, `scenarios/leo-navmsg-celeste-iod.toml`), so deleting both withholds it.
//!
//! PUBLIC parts: the orbit (a 510 km near-polar sun-synchronous orbit; GMV, ION GNSS+ 2026
//! abstract 16907, and Thales Alenia Space's launch release), the L-band carrier
//! 1191.795 MHz (third-party description flagged "to be confirmed", open-receiver.com).
//! The 97.4° inclination is derived: the sun-synchronous inclination at 510 km.
//!
//! WORKSHOP parts (presented at the ESA NAVISP LEO-PNT workshop, 2026): the message
//! structure (a Galileo Keplerian set plus along-track, cross-track and radial correction
//! polynomials `a0..a5`, `c0..c2`, `r0..r4`, a second-order clock polynomial, SVID, health
//! and issue of data, ionospheric and UTC parameters), the 5-minute spacing of successive
//! ephemeris records, and the column spellings of the decoded CSV. What the columns mean is
//! Kshana's reading; the Celeste bit layout is not public and is not reproduced. Future
//! Celeste phases and the EU LEO-PNT system may use different designs.

use super::{MessageDefaults, Preset, SourceKind};
use crate::leo_navmsg::text::CsvSchema;

/// Celeste IOD configuration as far as it is known.
pub const CELESTE_IOD: Preset = Preset {
    key: "celeste-iod",
    name: "ESA Celeste IOD (in-orbit demonstration)",
    source: SourceKind::Workshop,
    source_urls: &[
        "https://www.ion.org/gnss/abstracts.cfm?paperID=16907",
        "https://www.thalesaleniaspace.com/en/press-releases/iod-2-satellite-built-thales-alenia-space-esas-celeste-mission-lifted-today-new",
        "https://open-receiver.com/blogs/leo-pnt-signals-celeste/",
    ],
    altitude_km: 510.0,
    inclination_deg: 97.4,
    carrier_hz: 1_191_795_000.0,
    carrier_label: "L band 1191.795 MHz (the Galileo E5 centre)",
    message: Some(MessageDefaults {
        model: "kepler-rac",
        rac_degrees: [5, 2, 4],
        poly_degree: 6,
        fit_interval_s: 300.0,
        update_period_s: 300.0,
        zero_clock: false,
        steered_sigma_m: 0.0,
    }),
    notes: "Message structure, correction-polynomial orders (a0..a5, c0..c2, r0..r4), \
            5-minute record spacing and CSV column names presented at the ESA NAVISP \
            LEO-PNT workshop, 2026. Orbit and carrier from public sources. The Celeste bit \
            layout is not public; Kshana's own encoding is used. Fit interval assumed equal \
            to the record spacing.",
};

/// The column spellings of the workshop CSV decode, mapped to Kshana's keys. `STRFI`'s
/// meaning was not stated, so it maps to no key and is written empty. A final `racTau`
/// column is Kshana's addition (the correction time scale), not part of the decode.
pub fn csv_schema() -> CsvSchema {
    let mut cols: Vec<(String, String)> = [
        ("SVID", "SVID"),
        ("IOD", "IOD"),
        ("Band", "Band"),
        ("WeekNumber", "WeekNumber"),
        ("ToW", "ToW"),
        ("-", "STRFI"),
        ("toc", "t0c"),
        ("af0", "af0"),
        ("af1", "af1"),
        ("af2", "af2"),
        ("toe", "t0e"),
        ("M0", "m0"),
        ("sqrtA", "sqrtA"),
        ("e", "ecc"),
        ("deltaN", "deltaN"),
        ("Omega0", "omega0"),
        ("OmegaDot", "omegaDot"),
        ("iDot", "iDot"),
        ("i0", "i0"),
        ("omega", "omega"),
        ("Crc", "crc"),
        ("Crs", "crs"),
        ("Cic", "cic"),
        ("Cis", "cis"),
        ("Cuc", "cuc"),
        ("Cus", "cus"),
    ]
    .iter()
    .map(|(k, h)| (k.to_string(), h.to_string()))
    .collect();
    for (p, n) in [("a", 6), ("c", 3), ("r", 5)] {
        for k in 0..n {
            cols.push((format!("{p}{k}"), format!("{p}{k}")));
        }
    }
    cols.push(("Health".to_string(), "shs".to_string()));
    // Kshana's own column, not on the slide: the correction polynomials' time scale, which
    // a reader needs to evaluate a0..r4 (Kshana transmits it with the message).
    cols.push(("racTau".to_string(), "racTau".to_string()));
    CsvSchema {
        name: "celeste-iod".to_string(),
        columns: cols,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_celeste_schema_has_the_workshop_columns_in_order() {
        let s = csv_schema();
        let heads: Vec<&str> = s.columns.iter().map(|(_, h)| h.as_str()).collect();
        assert_eq!(heads[0], "SVID");
        assert_eq!(heads[5], "STRFI");
        assert_eq!(heads[heads.len() - 2], "shs");
        assert_eq!(heads.last(), Some(&"racTau"));
        assert_eq!(heads.len(), 26 + 6 + 3 + 5 + 2);
        let m = CELESTE_IOD
            .message
            .expect("the preset carries a message model");
        assert_eq!(m.rac_degrees, [5, 2, 4]);
        assert_eq!(m.update_period_s, 300.0);
    }

    #[test]
    fn a_message_round_trips_through_the_celeste_columns() {
        use crate::leo_navmsg::elements::*;
        let k = Keplerian {
            sqrt_a: 2624.5,
            e: 1.2e-3,
            i0: 1.7,
            omega0: 0.3,
            omega: 1.1,
            m0: -0.4,
            delta_n: 1e-9,
            omega_dot: 2e-7,
            i_dot: 1e-10,
            cuc: 1e-4,
            cus: -2e-4,
            crc: 120.0,
            crs: -80.0,
            cic: 3e-5,
            cis: -1e-5,
            toe: 86_550.0,
        };
        let msg = LeoNavMessage {
            svid: 4,
            iod: 7,
            band: 1,
            health: 0,
            week: 2438,
            tow: 86_400.0,
            clock: Some(ClockPoly {
                toc: 86_550.0,
                af0: 2e-5,
                af1: 1e-11,
                af2: 0.0,
            }),
            ephemeris: EphemerisModel::KeplerRac {
                kepler: k,
                rac: RacPoly {
                    tau_s: 256.0,
                    along: vec![0.1, -0.02, 0.003, 0.0, 1e-4, -2e-5],
                    cross: vec![0.01, 0.002, -0.001],
                    radial: vec![-0.05, 0.004, 0.0, 1e-4, 2e-5],
                },
            },
            services: Services::default(),
        };
        let schema = csv_schema();
        let text = crate::leo_navmsg::text::csv_export(std::slice::from_ref(&msg), &schema)
            .expect("export");
        assert!(text.starts_with("SVID,IOD,Band,WeekNumber,ToW,STRFI,t0c,af0"));
        let back = crate::leo_navmsg::text::csv_import(&text, &schema).expect("import");
        assert_eq!(back[0].ephemeris, msg.ephemeris);
        assert_eq!(back[0].clock, msg.clock);
    }
}
