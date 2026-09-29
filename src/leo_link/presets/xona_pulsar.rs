// SPDX-License-Identifier: AGPL-3.0-only
//! Xona Space Systems Pulsar: X1 (L1 band) and X5 (L5 band). **PUBLIC.**
//!
//! Source: Leclère, Marathe and Reid, "Insights into Xona Pulsar LEO PNT: Constellation,
//! Signals, and Receiver Design", ION GNSS+ 2025,
//! <https://arxiv.org/abs/2509.19551>, Table 1 (constellation) and Table 2 (signals):
//!
//! * X1: 1593.3225 MHz (155.75 × 10.23 MHz), 1.77 MHz bandwidth containing 99.5 % of the power,
//!   EFQPSK, 1.023 Mchip/s small-set Kasami codes of 1023 chips (1 ms), 1000 bit/s, received
//!   power −148.2 dBW minimum (elevation 10° or more) to −139.1 dBW maximum.
//! * X5: 1190.51625 MHz (116.375 × 10.23 MHz), 17.7 MHz, EFQPSK with code shift keying,
//!   10.23 Mchip/s extended Gold codes of 10230 chips (1 ms), 4000 bit/s, −144.9 to −136.2 dBW.
//! * Constellation: 1080 km; 192 satellites in 12 planes at 53° (phasing 22.5°/12, Walker F = 1)
//!   and 66 in 6 planes at 97° (phasing 32.72°/6, F = 1). Pulsar-0 flies at about 520 km, 97°.
//!
//! The paper publishes received powers, not an EIRP or a pattern. Here the pattern is taken as
//! flat over the visible Earth and the EIRP is the one that delivers the published minimum at
//! 10° elevation from 1080 km: `EIRP = P_min + FSPL(ρ(10°), f)`, with `ρ(10°) = 2913.6 km`
//! over the equatorial radius. With that EIRP the received power at the zenith is −139.58 dBW
//! (X1) and −136.28 dBW (X5), against the published maxima of −139.1 and −136.2 dBW: the
//! published spread is almost exactly the free-space range spread. That is a consistency check
//! (MODELLED), not a validation of Pulsar's antenna.

use super::{BandPreset, PresetSource, ShellPreset, SourceKind, SystemPreset};
use crate::leo_link::antenna::{Polarisation, SatPattern};

/// X1 EIRP (dBW): −148.2 dBW plus the free-space loss over 2913.6 km at 1593.3225 MHz.
pub const X1_EIRP_DBW: f64 = 17.582_524;
/// X5 EIRP (dBW): −144.9 dBW plus the free-space loss over 2913.6 km at 1190.51625 MHz.
pub const X5_EIRP_DBW: f64 = 18.351_157;

const BASIS: &str = "arXiv 2509.19551 Table 2 (frequency, bandwidth, chip rate, code length, \
    data rate, received powers); EIRP derived from the published minimum received power at 10 \
    deg elevation with a flat pattern; polarisation and axial ratio representative";

/// The Pulsar preset.
pub const PRESET: SystemPreset = SystemPreset {
    id: "xona-pulsar",
    name: "Xona Pulsar (X1, X5)",
    source: PresetSource {
        kind: SourceKind::Public,
        citation: "Leclère, Marathe and Reid, ION GNSS+ 2025, arXiv 2509.19551, Tables 1 and 2",
        urls: &["https://arxiv.org/abs/2509.19551"],
    },
    shells: &[
        ShellPreset {
            altitude_km: 1080.0,
            inclination_deg: Some(53.0),
            total: 192,
            planes: 12,
            phasing: 1,
            star: false,
        },
        ShellPreset {
            altitude_km: 1080.0,
            inclination_deg: Some(97.0),
            total: 66,
            planes: 6,
            phasing: 1,
            star: false,
        },
    ],
    orbit_basis: "arXiv 2509.19551 Table 1: 1080 km, 12 planes x 16 at 53 deg and 6 planes x 11 \
        at 97 deg, uniform in-plane spacing, fixed inter-plane phasing",
    bands: &[
        BandPreset {
            name: "X1",
            centre_hz: 1_593.322_5e6,
            tx_bandwidth_hz: 1.77e6,
            chip_rate_hz: 1.023e6,
            code_length_chips: 1023.0,
            data_rate_bps: 1000.0,
            eirp_dbw: X1_EIRP_DBW,
            pattern: SatPattern::Flat,
            polarisation: Polarisation::Rhcp,
            axial_ratio_db: 1.0,
            allocation: "RNSS (L1 band)",
            ranging: true,
            basis: BASIS,
        },
        BandPreset {
            name: "X5",
            centre_hz: 1_190.516_25e6,
            tx_bandwidth_hz: 17.7e6,
            chip_rate_hz: 10.23e6,
            code_length_chips: 10230.0,
            data_rate_bps: 4000.0,
            eirp_dbw: X5_EIRP_DBW,
            pattern: SatPattern::Flat,
            polarisation: Polarisation::Rhcp,
            axial_ratio_db: 1.0,
            allocation: "RNSS (L5 band)",
            ranging: true,
            basis: BASIS,
        },
    ],
    // Not published; one second of X1 data (1000 bit) is a representative placeholder.
    cold_start_bits: 1000.0,
    notes: "Pulsar-0 (in-orbit validation) flies near 520 km at 97 deg: override altitude_km. \
        The broadcast ephemeris model, clock type and what the company's 1.5 cm figure measures \
        are not public.",
};

#[cfg(test)]
mod tests {
    use super::super::{fspl_db, slant_range_m};
    use super::*;

    #[test]
    fn the_eirps_reproduce_the_published_minimum_power_at_ten_degrees() {
        let rho = slant_range_m(1080e3, 10.0);
        assert!((rho - 2_913_623.0).abs() < 1.0);
        for (f, pmin, eirp) in [
            (1_593.322_5e6, -148.2, X1_EIRP_DBW),
            (1_190.516_25e6, -144.9, X5_EIRP_DBW),
        ] {
            assert!((eirp - fspl_db(rho, f) - pmin).abs() < 1e-5);
        }
    }

    #[test]
    fn a_flat_pattern_lands_the_zenith_power_near_the_published_maximum() {
        // Published maxima -139.1 (X1) and -136.2 (X5) dBW; the flat-pattern zenith power is
        // within 0.5 dB of each.
        for (f, pmax, eirp) in [
            (1_593.322_5e6, -139.1, X1_EIRP_DBW),
            (1_190.516_25e6, -136.2, X5_EIRP_DBW),
        ] {
            let p = eirp - fspl_db(1080e3, f);
            assert!((p - pmax).abs() < 0.5, "{p} vs {pmax}");
        }
    }
}
