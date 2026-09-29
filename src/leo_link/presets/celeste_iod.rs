// SPDX-License-Identifier: AGPL-3.0-only
//! ESA Celeste IOD (in-orbit demonstration), signal configuration #1 ("Classical Pilot").
//! **WORKSHOP** signal parameters, **PUBLIC** orbit.
//!
//! This file is the only place in the engine that carries parameters presented at the ESA
//! NAVISP (Navigation Innovation and Support Programme) LEO-PNT workshop, 2026. To withhold it
//! from a release, delete this file, `scenarios/leo-pass-celeste-iod-multiband.toml`, and the
//! lines marked `WORKSHOP-PRESET` in `presets/mod.rs` and `bundled_scenarios.rs`. Nothing else
//! depends on it.
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

use super::{BandPreset, PresetSource, ShellPreset, SourceKind, SystemPreset};
use crate::leo_link::antenna::{Polarisation, SatPattern};

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
