// SPDX-License-Identifier: AGPL-3.0-only
//! Generate a short four-satellite GPS L1 C/A scene and write it next to its truth.
//!
//! Writes interleaved little-endian f32 I/Q (`scene.cf32`) and the truth sidecar
//! (`scene_truth.csv`) into the directory given as the first argument (default: the system
//! temporary directory). Run with `cargo run --release --example iq_scene -- out_dir`.

use kshana::iq::scene::{
    CsvTruthWriter, NavData, RangeProfile, Scene, SceneConfig, SceneSatellite,
};
use kshana::iq::{Cf64, IqError, IqSink, SampleSpec, C_M_PER_S};
use kshana::sdr::L1_HZ;
use std::fs::File;
use std::io::{BufWriter, Write};

/// Interleaved f32 I/Q onto a writer.
struct Cf32Writer<W: Write>(W);

impl<W: Write> IqSink for Cf32Writer<W> {
    fn write(&mut self, block: &[Cf64]) -> Result<(), IqError> {
        for s in block {
            self.0
                .write_all(&(s.re as f32).to_le_bytes())
                .and_then(|_| self.0.write_all(&(s.im as f32).to_le_bytes()))
                .map_err(|e| IqError::Io(e.to_string()))?;
        }
        Ok(())
    }
    fn finish(&mut self) -> Result<(), IqError> {
        self.0.flush().map_err(|e| IqError::Io(e.to_string()))
    }
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let dir = std::env::args()
        .nth(1)
        .map(std::path::PathBuf::from)
        .unwrap_or_else(std::env::temp_dir);
    let spec = SampleSpec {
        fs_hz: 2.5e6,
        center_hz: L1_HZ,
        if_hz: 0.0,
    };
    let mut cfg = SceneConfig::new(spec, 0.5);
    cfg.threads = 4;
    let lambda = C_M_PER_S / L1_HZ;
    let mut scene = Scene::new(cfg)?;
    for (prn, range_m, doppler_hz, cn0) in [
        (3u8, 20.5e6, 2100.0, 48.0),
        (11, 21.9e6, -1350.0, 46.0),
        (19, 23.1e6, 620.0, 45.0),
        (27, 24.7e6, -3300.0, 50.0),
    ] {
        let profile = RangeProfile {
            range_m,
            range_rate_mps: -doppler_hz * lambda,
            range_accel_mps2: 0.0,
            elevation_deg: 45.0,
            azimuth_deg: 0.0,
        };
        scene.add_satellite(SceneSatellite::gps_l1ca_profile(
            prn,
            profile,
            Some(cn0),
            NavData::Seeded { seed: prn as u64 },
        )?);
    }
    let mut iq = Cf32Writer(BufWriter::new(File::create(dir.join("scene.cf32"))?));
    let mut truth = CsvTruthWriter::new(BufWriter::new(File::create(dir.join("scene_truth.csv"))?));
    let summary = scene.generate(&mut iq, &mut truth)?;
    println!(
        "wrote {} samples and {} truth records to {}",
        summary.samples,
        summary.truth_records,
        dir.display()
    );
    Ok(())
}
