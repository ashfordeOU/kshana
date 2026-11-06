# C37.118.2 test stream: provenance

- `stream.bin` (sha256 0ccf17100d912c85afc5401542fd9fe55d12de1eacc7a1ee5e7263464c61932f) and
  `expected.json` are written by `make_stream.py`, an independent encoder kept in this folder. It shares
  no code with `src/c37118.rs` and was written from public descriptions of the frame layout.
- The stream is synthetic: two PMUs at 30 frames/s for 10 s. PMU 2 loses sync for 90 frames. It also
  holds one frame with a broken CRC and one data frame sent before the configuration.
- Limit: an encoder and a reader written from the same descriptions can share a misreading. A public PMU
  capture with a clear licence would be an independent check; none has been found yet.
