// SPDX-License-Identifier: AGPL-3.0-only
//! ESA Celeste in-orbit demonstration (IOD): the one optional preset that uses parameters
//! presented at the ESA Navigation Innovation and Support Programme (NAVISP) LEO-PNT (low
//! Earth orbit positioning, navigation and timing) workshop, 2026.
//!
//! **This file holds every workshop-derived number in the engine**, for all three areas that
//! offer a Celeste IOD preset: the pass link budget ([`link`], the `leo-pass` kind's system
//! preset), the navigation message ([`navmsg`], the `leo-navmsg` kind's preset and decoded-CSV
//! column schema) and fused positioning ([`fusion`], the `leo-pvt` kind's LEO preset). The
//! scenarios that use it are named `scenarios/*celeste-iod*.toml` and are kept out of the
//! binary (`src/bundled_scenarios.rs`, `REPO_ONLY`).
//!
//! **Withholding it from a release** takes no source edit: delete this file and the
//! `scenarios/*celeste-iod*.toml` files. `build.rs` compiles this module, and the three
//! preset registrations that name it, only when this file exists (the `kshana_celeste`
//! configuration flag); every other capability, test and bundled scenario runs without it,
//! and `tests/workshop_preset_isolation.rs` checks that no other file carries a workshop
//! number.
//!
//! Celeste IOD signals are a vehicle for experiments; the later Celeste In-Orbit Pathfinder
//! and an EU LEO-PNT system will have their own designs, which is why this is one named,
//! replaceable preset of a parameterised signal design and never "the Celeste signal".

/// The `leo-pass` system preset (was `src/leo_link/presets/celeste_iod.rs`).
pub mod link {
    //! ESA Celeste IOD (in-orbit demonstration), signal configuration #1 ("Classical Pilot").
    //! **WORKSHOP** signal parameters, **PUBLIC** orbit.
    //!
    //! Its scenario is `scenarios/leo-pass-celeste-iod-multiband.toml`; see the file-level
    //! documentation for how the whole preset is withheld.
    //!
    //! **Orbit (PUBLIC).** The first two satellites fly a near-polar sun-synchronous orbit at
    //! 510 km (GMV, ION GNSS+ 2026 abstract 16907,
    //! <https://www.ion.org/gnss/abstracts.cfm?paperID=16907>; Thales Alenia Space press release,
    //! <https://www.thalesaleniaspace.com/en/press-releases/iod-2-satellite-built-thales-alenia-space-esas-celeste-mission-lifted-today-new>).
    //! The exact inclination is not published; the sun-synchronous inclination at 510 km is used.
    //! ESA's own page gives "quasi polar, between 500 and 600 km"
    //! (<https://www.esa.int/Applications/Satellite_navigation/Celeste/Celeste_IOD_-_Facts_and_figures>).
    //!
    //! **Signals (WORKSHOP; presented at the ESA NAVISP LEO-PNT workshop, 2026).** The band plan
    //! (centre, allocation, transmitted bandwidth) and configuration #1: E5 pilot BPSK(10); S (the
    //! RDSS band) pilot BPSK(5); UHF pilot BPSK(5); C pilot BPSK(10). The MSS band and the extended
    //! C band are listed without a configuration: their chip rates here are assumptions (the widest
    //! BPSK whose main lobe fits the stated bandwidth, BPSK(1) for the MSS band). Celeste IOD
    //! signals are a vehicle for experiments; later Celeste and EU LEO-PNT designs may differ, which
    //! is why this is one named, replaceable preset and not "the Celeste signal".
    //!
    //! **Power and pattern (WORKSHOP-calibrated, MODELLED).** No EIRP or antenna pattern is
    //! published. The EIRP and the Gaussian beamwidth below were chosen so that the E5 carrier over
    //! a high pass from 510 km reproduces the shape of the C/N0 (carrier-to-noise density) trace
    //! shown at the workshop (a bell of a few minutes peaking near 57.5 dB-Hz, several dB above
    //! Galileo). Every band is given the same EIRP and beam: an assumption, not a measurement.
    //! The data rate (500 bit/s) follows a third-party public note
    //! (<https://open-receiver.com/blogs/leo-pnt-signals-celeste/>, flagged "to be confirmed").

    use crate::leo_link::antenna::{Polarisation, SatPattern};
    use crate::leo_link::presets::{
        BandPreset, PresetSource, ShellPreset, SourceKind, SystemPreset,
    };

    /// EIRP (dBW) calibrated to the workshop C/N0 trace (see the module documentation).
    pub const EIRP_DBW: f64 = 0.6;
    /// Beam of every band, calibrated to the width of the workshop C/N0 trace.
    const BEAM: SatPattern = SatPattern::Gaussian {
        hpbw_deg: 90.0,
        floor_db: -20.0,
    };
    const BASIS: &str = "centre, allocation, bandwidth and pilot modulation presented at the ESA \
        NAVISP LEO-PNT workshop, 2026; EIRP and beam calibrated to the workshop C/N0 trace; data rate \
        from a third-party public note";

    const fn band(
        name: &'static str,
        centre_hz: f64,
        tx_bandwidth_hz: f64,
        chip_rate_hz: f64,
        allocation: &'static str,
    ) -> BandPreset {
        BandPreset {
            name,
            centre_hz,
            tx_bandwidth_hz,
            chip_rate_hz,
            code_length_chips: chip_rate_hz * 1e-3,
            data_rate_bps: 500.0,
            eirp_dbw: EIRP_DBW,
            pattern: BEAM,
            polarisation: Polarisation::Rhcp,
            axial_ratio_db: 2.0,
            allocation,
            ranging: true,
            basis: BASIS,
        }
    }

    /// The Celeste IOD preset.
    pub const PRESET: SystemPreset = SystemPreset {
        id: "celeste-iod",
        name: "ESA Celeste IOD, configuration #1 (Classical Pilot)",
        source: PresetSource {
            kind: SourceKind::Workshop,
            citation: "Signal parameters presented at the ESA NAVISP LEO-PNT workshop, 2026; orbit \
                from GMV (ION GNSS+ 2026 abstract 16907) and Thales Alenia Space",
            urls: &[
                "https://www.ion.org/gnss/abstracts.cfm?paperID=16907",
                "https://www.esa.int/Applications/Satellite_navigation/Celeste/Celeste_IOD_-_Facts_and_figures",
            ],
        },
        shells: &[ShellPreset {
            altitude_km: 510.0,
            inclination_deg: None,
            total: 2,
            planes: 1,
            phasing: 0,
            star: false,
        }],
        orbit_basis: "510 km near-polar sun-synchronous (public: GMV, Thales Alenia Space); \
            inclination computed as sun-synchronous",
        bands: &[
            band("E5", 1_191.795e6, 51.15e6, 10.23e6, "RNSS"),
            band("SR", 2_492.028e6, 15.0e6, 5.115e6, "RDSS"),
            band("SM", 2_170.0e6, 5.0e6, 1.023e6, "MSS"),
            band("UHF", 465.465e6, 10.0e6, 5.115e6, "EESS"),
            band("C", 5_019.861e6, 19.7e6, 10.23e6, "RNSS"),
            band("Cext-B1", 5_071.011e6, 120.0e6, 59.334e6, "non-RNSS"),
            band("Cext-B2", 5_122.161e6, 240.0e6, 119.691e6, "non-RNSS"),
        ],
        cold_start_bits: 1000.0,
        notes: "WORKSHOP preset. The navigation message carries a Galileo-style Keplerian set with \
            along-track, cross-track and radial correction terms (presented at the workshop); the \
            message model belongs to the navigation-message code.",
    };

    #[cfg(test)]
    mod tests {
        use super::*;

        #[test]
        fn the_band_plan_is_the_presented_one() {
            assert_eq!(PRESET.bands.len(), 7);
            let e5 = PRESET.band("E5").unwrap();
            // 1191.795 MHz is 116.5 x 10.23 MHz, the Galileo E5 centre.
            assert!((e5.centre_hz - 116.5 * 10.23e6).abs() < 1.0);
            // BPSK(5) is 10.23 MHz null to null and fits the 10 MHz UHF allocation to within the
            // band-edge filter.
            let uhf = PRESET.band("UHF").unwrap();
            assert!(2.0 * uhf.chip_rate_hz <= uhf.tx_bandwidth_hz * 1.03);
        }

        #[test]
        fn a_high_pass_reproduces_the_shape_of_the_presented_c_n0_trace() {
            // The trace presented at the workshop: a bell of a few minutes peaking near 57.5 dB-Hz,
            // about 7 to 10 dB above Galileo carriers at 44 to 51 dB-Hz. The EIRP and beam were
            // calibrated to it, so this pins the calibration, it does not validate anything.
            let src = "kind = \"leo-pass\"\nduration_s = 600.0\nstep_s = 2.0\n\
                       [user]\nlat_deg = 52.218\nlon_deg = 4.42\n\
                       [[satellite]]\nsystem = \"celeste-iod\"\nbands = [\"E5\"]\n\
                       max_elevation_deg = 75.0\ntca_s = 300.0\n";
            let scn: crate::leo_pass::LeoPassScenario = toml::from_str(src).unwrap();
            let r = scn.compute().unwrap();
            let c = r.comparison.unwrap();
            assert!((c.leo_peak_cn0_dbhz - 57.5).abs() < 1.0, "{c:?}");
            assert!(
                (6.0..11.0).contains(&c.leo_peak_above_gnss_median_db),
                "{c:?}"
            );
            let s = &r.satellites[0];
            let above_40 = s
                .series
                .iter()
                .filter(|e| e.visible && e.bands[0].cn0_dbhz > 40.0)
                .count() as f64
                * r.step_s;
            assert!(
                (150.0..360.0).contains(&above_40),
                "{above_40} s above 40 dB-Hz"
            );
        }
    }
}

/// The `leo-navmsg` preset and CSV schema (was `src/leo_navmsg/presets/celeste_iod.rs`).
pub mod navmsg {
    //! ESA Celeste in-orbit demonstration (IOD). This is the one preset that uses material
    //! presented at the ESA Navigation Innovation and Support Programme (NAVISP) LEO-PNT
    //! workshop, 2026. Its scenario is `scenarios/leo-navmsg-celeste-iod.toml`; see the
    //! file-level documentation for how the whole preset is withheld.
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

    use crate::leo_navmsg::presets::{MessageDefaults, Preset, SourceKind};
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
}

/// The `leo-pvt` LEO preset (was `src/leo_fusion/presets/celeste_iod.rs`).
pub mod fusion {
    //! ESA Celeste in-orbit demonstration (IOD), satellites IOD-1 and IOD-2: one preset of a
    //! parameterised signal design, never "the Celeste signal". The IOD signals are a vehicle for
    //! experiments; the later Celeste In-Orbit Pathfinder and an EU LEO PNT system will have their
    //! own designs.
    //!
    //! Its scenario is `scenarios/celeste-iod-fused-pvt.toml`; see the file-level documentation
    //! for how the whole preset is withheld.
    //!
    //! Public sources:
    //! * ESA, Celeste IOD facts and figures
    //!   (<https://www.esa.int/Applications/Satellite_navigation/Celeste/Celeste_IOD_-_Facts_and_figures>):
    //!   the IOD mission, L-band and S-band on IOD-1 and IOD-2.
    //! * ION GNSS+ 2026 abstract 16907 (<https://www.ion.org/gnss/abstracts.cfm?paperID=16907>) and
    //!   the Thales Alenia Space press release
    //!   (<https://www.thalesaleniaspace.com/en/press-releases/iod-2-satellite-built-thales-alenia-space-esas-celeste-mission-lifted-today-new>):
    //!   a 510 km near-polar sun-synchronous orbit; signals synchronised to GNSS time.
    //!
    //! Workshop (presented at the ESA NAVISP LEO-PNT workshop, 2026): the E5 signal of
    //! configuration #1 (classical pilot), the MSS S-band signal for 5G NTN terminals, the pass
    //! C/N0 range, and the navigation message content (Galileo-style Keplerian ephemeris with
    //! along-track, cross-track and radial corrections, a second-order time-of-transmission
    //! polynomial, and the system-time-to-UTC offset).
    //!
    //! Derived: the sun-synchronous inclination at 510 km, 97.44 deg, from the J2 node rate.
    //! Representative: the along-track separation of the two satellites (half an orbit, Walker 2/1/0) and
    //! the orbit-and-clock error.

    use crate::leo_fusion::presets::{
        LeoPreset, PresetShell, PresetSignal, PresetSource, SourceKind,
    };

    pub const PRESET: LeoPreset = LeoPreset {
        id: "celeste-iod",
        name: "ESA Celeste IOD-1/IOD-2, configuration #1 (classical pilot)",
        summary: "Two IOD satellites at 510 km sun-synchronous; E5 pilot BPSK(10) and an MSS S-band 5G NTN channel",
        sources: &[
            PresetSource {
                kind: SourceKind::Public,
                citation: "ESA Celeste IOD facts and figures: mission, L- and S-band on IOD-1/IOD-2",
                url: Some("https://www.esa.int/Applications/Satellite_navigation/Celeste/Celeste_IOD_-_Facts_and_figures"),
            },
            PresetSource {
                kind: SourceKind::Public,
                citation: "ION GNSS+ 2026 abstract 16907: 510 km near-polar sun-synchronous orbit, signals synchronised to GNSS time",
                url: Some("https://www.ion.org/gnss/abstracts.cfm?paperID=16907"),
            },
            PresetSource {
                kind: SourceKind::Workshop,
                citation: "Presented at the ESA NAVISP LEO-PNT workshop, 2026: E5 1191.795 MHz, 51.15 MHz, pilot BPSK(10); SM 2170.00 MHz MSS, 0.2 and 5 MHz; pass C/N0 about 41 to 57.5 dB-Hz; message with system-time-to-UTC offset",
                url: None,
            },
            PresetSource {
                kind: SourceKind::Derived,
                citation: "sun-synchronous inclination at 510 km from the J2 node rate: 97.44 deg",
                url: None,
            },
        ],
        representative: &[
            "two satellites half an orbit apart in one plane (Walker 2/1/0)",
            "signal-in-space range error 0.5 m",
        ],
        shells: &[PresetShell { pattern: "delta", total: 2, planes: 1, phasing: 0, altitude_km: 510.0, inclination_deg: 97.44 }],
        signals: &[
            PresetSignal {
                name: "E5",
                carrier_hz: 1_191.795e6,
                modulation: "pilot BPSK(10); data BPSK(1) or BPSK(10)",
                chip_rate_hz: Some(10.23e6),
                bandwidth_hz: 51.15e6,
                rx_power_dbw: None,
                cn0_dbhz: Some((41.0, 57.5)),
            },
            PresetSignal {
                name: "SM-5MHz",
                carrier_hz: 2_170.0e6,
                modulation: "5G NR NTN downlink positioning reference signal, 5 MHz",
                chip_rate_hz: None,
                bandwidth_hz: 5.0e6,
                rx_power_dbw: None,
                cn0_dbhz: Some((41.0, 57.5)),
            },
            PresetSignal {
                name: "SM-200kHz",
                carrier_hz: 2_170.0e6,
                modulation: "narrowband positioning reference signal, 0.2 MHz",
                chip_rate_hz: None,
                bandwidth_hz: 0.2e6,
                rx_power_dbw: None,
                cn0_dbhz: Some((41.0, 57.5)),
            },
        ],
        doppler_only: false,
        sigma_doppler_hz: None,
        sisre_m: 0.5,
        ephemeris_model: "Galileo-style Keplerian set with along-track, cross-track and radial correction polynomials",
        clock_model: "second-order time-of-transmission polynomial relative to GNSS time; system-time-to-UTC offset broadcast",
    };
}
