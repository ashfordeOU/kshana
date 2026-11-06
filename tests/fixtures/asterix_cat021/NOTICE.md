# ASTERIX CAT021 test blocks: provenance

- `blocks.bin` (sha256 550220e57df4444e4efc9fe4b43fdada9a2c76a1b76966506dc9aae6d8ab5f5a) and `expected.json`
  are written by `make_blocks.py`, an independent encoder kept in this folder. It was written from the
  EUROCONTROL CAT021 edition 2.6 specification (EUROCONTROL-SPEC-0149-12, a public document) and shares no
  code with `src/asterix_cat021.rs`.
- The data is synthetic: 40 reports with random positions and addresses, one CAT048 block, and five random
  extra items per record.
- Limit: an encoder and a reader written from the same document can share a misreading. A public CAT021
  recording with a clear licence would be an independent check; none has been found yet.
