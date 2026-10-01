# gnss_ins_navego_dataset_oracle fixture

Used by `tests/gnss_ins_navego_dataset_oracle.rs` (matrix row "GNSS/INS sensor fusion", scoped to
the loosely coupled filter).

## Source

NaveGo v1.4, https://github.com/rodralez/NaveGo (git tag `v1.4`, commit 24d9488), retrieved
2026-09-30. Licence: **GNU LGPL-3.0** (the NaveGo repository, including its example data). The
example dataset is `examples/real-data/`, a 21-minute land-vehicle drive recorded with an Ekinox
IMU (200 Hz), its GNSS receiver (5 Hz) and the Ekinox reference trajectory (1 Hz):

| Source file | SHA-256 |
|---|---|
| `ekinox_imu.mat` | b49466ed36c5b7de343e555ecd5822ce0cc47896911224d23ee6226f0ef526c5 |
| `ekinox_gnss.mat` | 13f8a2611ad6df24cb875593dac00702b31cb9125e69eb6ebd9b2c276a9bcd9c |
| `ref.mat` | a1e68052b4126c1af2f93deb44a4301ab54ef0693310d59e523a37a2732dbfab |

NaveGo is run as a tool under GNU Octave 11.1.0; none of its code is linked into or copied into
the crate. The files below are data derived from the LGPL-3.0 dataset and NaveGo's outputs on it,
redistributed under the same licence; the full licence text is at
https://www.gnu.org/licenses/lgpl-3.0.txt (and `lgpl.txt` in the NaveGo repository).

## Files

Regenerate with `source ~/Code/kshana-oracles/env.sh` and, from this directory,
`octave --no-gui -q --eval "gen_gnss_ins_navego"` (about five minutes; it runs NaveGo twice).

| File | What it is | SHA-256 |
|---|---|---|
| `gen_gnss_ins_navego.m` | the generator | |
| `octave_shims/obsv.m` | standard-definition observability matrix, used only because NaveGo's `ins_gnss.m` calls the Octave control package's `obsv` for a diagnostic count that never feeds the solution | |
| `imu_20hz_f32.bin` | the 200 Hz IMU averaged over groups of 10 samples (groups end on the GNSS epochs), float32 little-endian rows `[wx wy wz fx fy fz]`; row 0 is the first 200 Hz sample | 6c6dee22e5d5f1e7462f0825f45a3e2fc52fdd1659bf36aef02576085b4cd869 |
| `imu_time.csv` | first time, uniform step and row count of the 20 Hz rows | e873205bac4d5710e79e07dc11daf6aa5dba0df6f3bc34b7eb66132b87ef8829 |
| `gnss.csv` | the GNSS fixes, with the 20 Hz row each coincides with by NaveGo's own time-match rule | a8d74351141b22a4acc1d43d20ba9271074162fbd0eee00e6c833ef5bd7beaaf |
| `ref.csv` | the Ekinox reference trajectory | bfefcc04cc33e79c69b9e72bbd33c11c9cbcf12a208fd4878d61922a9a60ff54 |
| `navego_at_ref.csv` | NaveGo `ins_gnss` on the 20 Hz float32 input, interpolated at the reference epochs inside it | d485ad1eed69488c461b0b12292e24ee1ee7bbe299529da8b0c46eb3bcf3e264 |
| `navego_innov.csv` | NaveGo's position innovations where it applied a position update (row 1 is its initialisation entry) | 4078a26fafb572403648b82380015d9d29ecb31143fb48a0be7aeaa2bf89165e |
| `meta.json` | the dataset's IMU and GNSS parameters, NaveGo's RMS figures (20 Hz float32 input; 200 Hz original for context) | b84659665433ef1d1c69c7a23af57cafb68fafc8ed309f0edc1f00f48458285e |
