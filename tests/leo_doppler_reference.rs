//! External oracle for the LEO Doppler geometry of the `leo-pvt` kind.
//!
//! Two published figures describe the Doppler a receiver on the ground must handle from a
//! LEO navigation satellite, and both follow from the orbit and the carrier alone:
//!
//! * Iridium: 780 km, 86.4 deg, L band 1616 to 1626 MHz, Doppler "up to ±36 kHz"
//!   (Resilient Navigation and Timing Foundation, "Recent PNT improvements and test results
//!   based on low Earth orbit satellites",
//!   <https://rntfnd.org/wp-content/uploads/Recent-PNT-Improvements-and-Test-Results-Based-on-Low-Earth-Orbit-Satellites.pdf>).
//! * Xona Pulsar X1: about 1080 km, carrier 1593.3225 MHz, maximum Doppler 32 to 34 kHz
//!   (Leclère, Marathe and Reid, ION GNSS+ 2025, arXiv:2509.19551, <https://arxiv.org/abs/2509.19551>).
//!
//! The setup is reproduced from those stated parameters: one satellite of each system is
//! flown for a day with the engine's orbit model (two-body with the J2 drift, Earth rotation)
//! and the largest absolute Doppler above the horizon is taken over users at several
//! latitudes. The bars are stated in each test; the Iridium figure is a rounded upper bound,
//! so the modelled maximum must fall within 5% of 36 kHz at the band centre, and the Xona
//! maximum must fall inside the published 32 to 34 kHz interval widened by 2%.

use kshana::leo_fusion::doppler::doppler_envelope;
use kshana::leo_fusion::geom::{EarthOrbit, Site, DEG};

fn max_doppler(alt_km: f64, inc_deg: f64, carrier_hz: f64) -> f64 {
    let mut best: f64 = 0.0;
    for (k, lat) in [0.0, 20.0, 40.0, 60.0].iter().enumerate() {
        let o = EarthOrbit::circular(alt_km * 1e3, inc_deg * DEG, 0.3 * k as f64, 0.0);
        let site = Site {
            lat_deg: *lat,
            lon_deg: 0.0,
            height_m: 0.0,
        };
        let env = doppler_envelope(&o, &site, carrier_hz, 0.0, 86_400.0, 2.0, 0.0);
        best = best.max(env.max_doppler_hz);
    }
    best
}

#[test]
fn iridium_doppler_reaches_the_published_36_khz() {
    let f = max_doppler(780.0, 86.4, 1_621.0e6);
    assert!(
        ((f - 36_000.0) / 36_000.0).abs() <= 0.05,
        "Iridium maximum Doppler {f:.0} Hz vs the published 36 kHz"
    );
}

#[test]
fn xona_pulsar_x1_doppler_lies_in_the_published_32_to_34_khz() {
    let f = max_doppler(1080.0, 53.0, 1_593.322_5e6);
    assert!(
        (32_000.0 * 0.98..=34_000.0 * 1.02).contains(&f),
        "Pulsar X1 maximum Doppler {f:.0} Hz vs the published 32 to 34 kHz"
    );
}
